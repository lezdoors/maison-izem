import Stripe from "https://esm.sh/stripe@17?target=deno";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

const stripe = new Stripe(Deno.env.get("STRIPE_SECRET_KEY")!, {
  apiVersion: "2024-12-18.acacia",
});

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

function extractOrigin(url: string): string {
  try {
    return new URL(url).origin;
  } catch {
    return "";
  }
}

// Look up product from Supabase to validate price server-side
async function lookupProduct(productId: string) {
  const res = await fetch(
    `${SUPABASE_URL}/rest/v1/products?id=eq.${productId}&select=id,title,price,images`,
    {
      headers: {
        apikey: SUPABASE_SERVICE_KEY,
        Authorization: `Bearer ${SUPABASE_SERVICE_KEY}`,
      },
    }
  );
  if (!res.ok) return null;
  const rows = await res.json();
  return rows[0] || null;
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const { items, success_url, cancel_url } = await req.json();

    if (!items || items.length === 0) {
      return new Response(JSON.stringify({ error: "No items" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const siteUrl =
      Deno.env.get("SITE_URL") ||
      (success_url ? extractOrigin(success_url) : "") ||
      "https://www.atlasperle.com";

    // Build line items — validate prices server-side when possible
    const lineItems = [];
    for (const item of items) {
      let title = item.title;
      let price = item.price;
      let image = item.image;

      // Server-side price validation: look up the real price from DB
      if (item.product_id) {
        const dbProduct = await lookupProduct(item.product_id);
        if (dbProduct) {
          title = title || dbProduct.title;
          price = dbProduct.price; // Always use DB price (prevents manipulation)
          image = image || dbProduct.images?.[0] || "";
        }
      }

      if (!title || !price) {
        return new Response(
          JSON.stringify({ error: `Invalid item: missing title or price` }),
          {
            status: 400,
            headers: { ...corsHeaders, "Content-Type": "application/json" },
          }
        );
      }

      lineItems.push({
        price_data: {
          currency: "usd",
          product_data: {
            name: title,
            images: image ? [`${siteUrl}${image}`] : [],
          },
          unit_amount: price,
        },
        quantity: item.quantity || 1,
      });
    }

    const session = await stripe.checkout.sessions.create({
      mode: "payment",
      payment_method_types: ["card"],
      line_items: lineItems,
      shipping_address_collection: {
        allowed_countries: ["US", "CA", "GB", "FR", "DE", "IT", "ES", "AU"],
      },
      metadata: {
        items: JSON.stringify(
          items.map((i: any) => ({
            product_id: i.product_id,
            title: i.title,
            price: i.price,
            quantity: i.quantity,
            image: i.image,
          }))
        ),
      },
      success_url:
        success_url ||
        `${siteUrl}/success?session_id={CHECKOUT_SESSION_ID}`,
      cancel_url: cancel_url || `${siteUrl}/cart`,
    });

    return new Response(JSON.stringify({ url: session.url }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (err: any) {
    console.error("Stripe checkout error:", err.message, err.stack);
    return new Response(
      JSON.stringify({
        error: err.message || "Failed to create checkout session",
      }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
