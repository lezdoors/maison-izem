import { corsHeaders, handleCors } from "../_shared/cors.ts";
import { getServiceClient } from "../_shared/supabase.ts";

function generateOrderNumber(): string {
  const num = Math.floor(Math.random() * 999999).toString().padStart(6, "0");
  return `PERLE-${num}`;
}

Deno.serve(async (req) => {
  const cors = handleCors(req);
  if (cors) return cors;

  const headers = { ...corsHeaders, "Content-Type": "application/json" };

  // Verify admin token
  const authHeader = req.headers.get("authorization");
  const token = authHeader?.replace("Bearer ", "");

  if (!token) {
    return new Response(
      JSON.stringify({ error: "Unauthorized" }),
      { status: 401, headers },
    );
  }

  try {
    const decoded = JSON.parse(atob(token));
    if (Date.now() > decoded.exp || decoded.role !== "admin") {
      return new Response(
        JSON.stringify({ error: "Unauthorized" }),
        { status: 401, headers },
      );
    }
  } catch {
    return new Response(
      JSON.stringify({ error: "Invalid token" }),
      { status: 401, headers },
    );
  }

  const body = await req.json();
  const { etsy_order_id, customer_name, customer_email, items, total, shipping_address } = body;

  if (!etsy_order_id || !customer_name || !customer_email || !items?.length) {
    return new Response(
      JSON.stringify({ error: "Missing required fields" }),
      { status: 400, headers },
    );
  }

  const supabase = getServiceClient();

  const { data, error } = await supabase
    .from("orders")
    .insert({
      order_number: generateOrderNumber(),
      sales_channel: "etsy",
      etsy_order_id,
      customer_name,
      customer_email,
      items,
      subtotal: total,
      shipping_cost: 0,
      total,
      shipping_address: shipping_address || {},
      status: "paid",
    })
    .select()
    .single();

  if (error) {
    console.error("Failed to create order:", error);
    return new Response(
      JSON.stringify({ error: "Failed to create order" }),
      { status: 500, headers },
    );
  }

  return new Response(JSON.stringify({ order: data }), { headers });
});
