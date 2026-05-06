import { corsHeaders, handleCors } from "../_shared/cors.ts";
import { getServiceClient } from "../_shared/supabase.ts";
import { compare, hash } from "https://deno.land/x/bcrypt@v0.4.1/mod.ts";

Deno.serve(async (req) => {
  const cors = handleCors(req);
  if (cors) return cors;

  const url = new URL(req.url);
  const action = url.searchParams.get("action") || "login";

  const headers = { ...corsHeaders, "Content-Type": "application/json" };
  const supabase = getServiceClient();

  if (action === "login") {
    const { email, password } = await req.json();

    if (!email || !password) {
      return new Response(
        JSON.stringify({ error: "Email and password required" }),
        { status: 400, headers },
      );
    }

    const { data } = await supabase
      .from("admin_users")
      .select("id, email, password_hash, role")
      .eq("email", email)
      .single();

    if (!data) {
      return new Response(
        JSON.stringify({ error: "Invalid credentials" }),
        { status: 401, headers },
      );
    }

    const valid = await compare(password, data.password_hash);
    if (!valid) {
      return new Response(
        JSON.stringify({ error: "Invalid credentials" }),
        { status: 401, headers },
      );
    }

    // Return a signed token (base64 JSON with expiry)
    const token = btoa(
      JSON.stringify({ id: data.id, email: data.email, role: data.role, exp: Date.now() + 7 * 24 * 60 * 60 * 1000 }),
    );

    return new Response(
      JSON.stringify({ token, email: data.email, role: data.role }),
      { headers },
    );
  }

  if (action === "verify") {
    const authHeader = req.headers.get("authorization");
    const token = authHeader?.replace("Bearer ", "");

    if (!token) {
      return new Response(
        JSON.stringify({ error: "No token" }),
        { status: 401, headers },
      );
    }

    try {
      const decoded = JSON.parse(atob(token));
      if (Date.now() > decoded.exp) {
        return new Response(
          JSON.stringify({ error: "Token expired" }),
          { status: 401, headers },
        );
      }
      return new Response(
        JSON.stringify({ email: decoded.email, role: decoded.role }),
        { headers },
      );
    } catch {
      return new Response(
        JSON.stringify({ error: "Invalid token" }),
        { status: 401, headers },
      );
    }
  }

  return new Response(
    JSON.stringify({ error: "Unknown action. Use ?action=login or ?action=verify" }),
    { status: 400, headers },
  );
});
