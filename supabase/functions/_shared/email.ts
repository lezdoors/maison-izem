const RESEND_API_KEY = Deno.env.get("RESEND_API_KEY");
const FROM_EMAIL = "Perle de l'Atlas <onboarding@resend.dev>";

function formatPrice(cents: number): string {
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
  }).format(cents / 100);
}

interface OrderEmailData {
  to: string;
  orderNumber: string;
  customerName: string;
  items: { title: string; price: number; quantity: number }[];
  total: number;
}

export async function sendOrderConfirmation(data: OrderEmailData) {
  const itemsHtml = data.items
    .map(
      (i) =>
        `<tr><td style="padding:8px 0;border-bottom:1px solid #e4dcc8;font-family:Georgia,serif;">${i.title}</td><td style="padding:8px 0;border-bottom:1px solid #e4dcc8;text-align:center;font-family:monospace;font-size:12px;">${i.quantity}</td><td style="padding:8px 0;border-bottom:1px solid #e4dcc8;text-align:right;font-family:Georgia,serif;font-style:italic;">${formatPrice(i.price * i.quantity)}</td></tr>`,
    )
    .join("");

  await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: {
      Authorization: `Bearer ${RESEND_API_KEY}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      from: FROM_EMAIL,
      to: data.to,
      subject: `Order Confirmed — ${data.orderNumber}`,
      html: `
        <div style="max-width:600px;margin:0 auto;background:#f5efe3;padding:48px 32px;font-family:'Inter Tight',Helvetica,Arial,sans-serif;color:#1f1b16;">
          <div style="text-align:center;margin-bottom:40px;">
            <div style="font-family:monospace;font-size:10px;letter-spacing:0.22em;text-transform:uppercase;color:#7a6f5c;margin-bottom:8px;">Order Confirmed</div>
            <div style="font-family:Georgia,serif;font-size:36px;letter-spacing:-0.01em;line-height:1.1;">PERLE DE L'ATLAS</div>
          </div>
          <p style="font-family:Georgia,serif;font-style:italic;font-size:18px;line-height:1.5;color:#3a332a;">Dear ${data.customerName},</p>
          <p style="font-family:Georgia,serif;font-style:italic;font-size:16px;line-height:1.6;color:#3a332a;">Thank you for your order. Each piece is handcrafted by our master artisans in Marrakech and will be carefully prepared for shipping.</p>
          <div style="margin:32px 0;padding:24px 0;border-top:1px solid #d9cfbb;">
            <div style="font-family:monospace;font-size:11px;letter-spacing:0.2em;text-transform:uppercase;color:#7a6f5c;margin-bottom:16px;">Order ${data.orderNumber}</div>
            <table style="width:100%;border-collapse:collapse;">
              <thead><tr><th style="text-align:left;font-family:monospace;font-size:10px;letter-spacing:0.15em;text-transform:uppercase;color:#7a6f5c;padding-bottom:8px;">Item</th><th style="text-align:center;font-family:monospace;font-size:10px;letter-spacing:0.15em;text-transform:uppercase;color:#7a6f5c;padding-bottom:8px;">Qty</th><th style="text-align:right;font-family:monospace;font-size:10px;letter-spacing:0.15em;text-transform:uppercase;color:#7a6f5c;padding-bottom:8px;">Total</th></tr></thead>
              <tbody>${itemsHtml}</tbody>
            </table>
            <div style="display:flex;justify-content:space-between;margin-top:16px;padding-top:16px;">
              <span style="font-family:monospace;font-size:11px;letter-spacing:0.2em;text-transform:uppercase;color:#7a6f5c;">Total</span>
              <span style="font-family:Georgia,serif;font-size:22px;font-style:italic;">${formatPrice(data.total)}</span>
            </div>
          </div>
          <div style="background:#ebe3d1;padding:24px;margin:32px 0;">
            <div style="font-family:monospace;font-size:10px;letter-spacing:0.2em;text-transform:uppercase;color:#7a6f5c;margin-bottom:8px;">Shipping</div>
            <p style="font-family:Georgia,serif;font-style:italic;font-size:14px;color:#3a332a;margin:0;line-height:1.6;">Your pieces are handcrafted to order in Marrakech. Please allow 2-4 weeks for crafting and international shipping. You will receive a tracking number once your order ships.</p>
          </div>
          <div style="text-align:center;margin-top:40px;padding-top:24px;border-top:1px solid #d9cfbb;">
            <div style="font-family:monospace;font-size:10px;letter-spacing:0.2em;text-transform:uppercase;color:#7a6f5c;">Perle de l'Atlas -- Marrakech</div>
          </div>
        </div>
      `,
    }),
  });
}

interface AdminNotificationData {
  orderNumber: string;
  customerName: string;
  customerEmail: string;
  items: { title: string; price: number; quantity: number; product_id?: string }[];
  total: number;
  shippingAddress: Record<string, string>;
}

export async function sendAdminNotification(data: AdminNotificationData) {
  const itemsList = data.items
    .map((i) => `- ${i.title} (${i.quantity}x) -- ${formatPrice(i.price * i.quantity)}`)
    .join("\n");
  const addr = data.shippingAddress;
  const addressStr = [addr.line1, addr.line2, `${addr.city}, ${addr.state} ${addr.postal_code}`, addr.country]
    .filter(Boolean)
    .join("\n");

  await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: {
      Authorization: `Bearer ${RESEND_API_KEY}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      from: FROM_EMAIL,
      to: "ryanaoufal@gmail.com",
      subject: `New Perle de l'Atlas Order -- ${data.orderNumber} -- ${formatPrice(data.total)}`,
      html: `
        <div style="font-family:monospace;font-size:13px;line-height:1.8;color:#1f1b16;max-width:600px;">
          <h2 style="font-family:Georgia,serif;font-size:24px;font-weight:normal;">New Order: ${data.orderNumber}</h2>
          <p><strong>Customer:</strong> ${data.customerName} (${data.customerEmail})</p>
          <p><strong>Total:</strong> ${formatPrice(data.total)}</p>
          <p><strong>Items:</strong></p>
          <pre style="background:#f5efe3;padding:16px;white-space:pre-wrap;">${itemsList}</pre>
          <p><strong>Ship to:</strong></p>
          <pre style="background:#f5efe3;padding:16px;white-space:pre-wrap;">${addressStr}</pre>
          <p style="color:#7a6f5c;font-size:11px;margin-top:24px;">Coordinate with craftsmen for fulfillment.</p>
        </div>
      `,
    }),
  });
}
