import Stripe from "https://esm.sh/stripe@17?target=deno";
import { getServiceClient } from "../_shared/supabase.ts";
import { sendOrderConfirmation, sendAdminNotification } from "../_shared/email.ts";

const stripe = new Stripe(Deno.env.get("STRIPE_SECRET_KEY")!, {
  apiVersion: "2024-12-18.acacia",
});

const webhookSecret = Deno.env.get("STRIPE_WEBHOOK_SECRET")!;

function generateOrderNumber(): string {
  const num = Math.floor(Math.random() * 999999).toString().padStart(6, "0");
  return `PERLE-${num}`;
}

Deno.serve(async (req) => {
  const body = await req.text();
  const signature = req.headers.get("stripe-signature");

  let event: Stripe.Event;
  try {
    event = await stripe.webhooks.constructEventAsync(body, signature!, webhookSecret);
  } catch (err: any) {
    console.error("Webhook signature verification failed:", err.message);
    return new Response(JSON.stringify({ error: "Invalid signature" }), { status: 400 });
  }

  if (event.type === "checkout.session.completed") {
    const session = event.data.object as Stripe.Checkout.Session;
    const items = JSON.parse(session.metadata?.items || "[]");
    const orderNumber = generateOrderNumber();
    const customerEmail = session.customer_details?.email || "";
    const customerName = session.customer_details?.name || "";
    const shippingAddress = (session as any).collected_information?.shipping_details?.address || {};

    const supabase = getServiceClient();

    // Create order
    const { error } = await supabase.from("orders").insert({
      order_number: orderNumber,
      sales_channel: "direct",
      stripe_session_id: session.id,
      customer_email: customerEmail,
      customer_name: customerName,
      shipping_address: shippingAddress,
      items,
      subtotal: session.amount_subtotal || 0,
      shipping_cost: session.total_details?.amount_shipping || 0,
      total: session.amount_total || 0,
      status: "paid",
    });

    if (error) {
      console.error("Failed to create order:", error);
    }

    // Mark products as sold
    for (const item of items) {
      await supabase
        .from("products")
        .update({ status: "sold", available_quantity: 0 })
        .eq("id", item.product_id);
    }

    // Send emails (non-blocking)
    try {
      await sendOrderConfirmation({
        to: customerEmail,
        orderNumber,
        customerName,
        items,
        total: session.amount_total || 0,
      });
      await sendAdminNotification({
        orderNumber,
        customerName,
        customerEmail,
        items,
        total: session.amount_total || 0,
        shippingAddress,
      });
    } catch (emailErr) {
      console.error("Failed to send emails:", emailErr);
    }
  }

  return new Response(JSON.stringify({ received: true }), {
    headers: { "Content-Type": "application/json" },
  });
});
