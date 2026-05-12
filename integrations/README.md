# Maison Izem — MCP integrations (per-machine)

Each subfolder here is a **per-machine MCP server**. Not part of the deployed site. Each clawdbot installs locally; secrets stay on the machine. The folder itself is gitignored.

## Installed integrations

| Name | Purpose | Status | Repo |
|------|---------|--------|------|
| `etsy-mcp/` | Etsy API access for shop sections, listings (read-only first, write later) | Turbo: ✅ installed (Maison Izem shop) · Cowork: pending registration | https://github.com/profplum700/etsy-mcp-server |

## How to install on a new fleet machine

### Etsy MCP (read-only)

```bash
cd ~/atlas-dark
mkdir -p integrations
git clone https://github.com/profplum700/etsy-mcp-server integrations/etsy-mcp
cd integrations/etsy-mcp
npm install
npm run build
```

Then patch `src/get-refresh-token.ts` to support `--read-only` flag (PR pending upstream — for now, edit the `scopes` array in `main()` to only include `listings_r shops_r transactions_r` before `npm run build`).

OAuth setup, credentials, and Claude Code registration: see the parent CLAUDE.md in `~/atlas-dark/CLAUDE.md` § "Etsy MCP install".

## Security

- `integrations/*/` is gitignored — secrets never get committed
- Each fleet machine has its own OAuth refresh token tied to its own developer-app entry (or shares the same dev app — Ryan decides)
- Read-only scopes by default. Write scopes (`listings_w shops_w transactions_w`) require explicit Ryan + Cowork approval and a re-auth via OAuth
