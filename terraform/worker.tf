resource "cloudflare_worker_script" "mnt_profile" {
  account_id = var.cloudflare_account_id
  name = "mnt_profile"
  content = <<EOF
/**
 * Welcome to Cloudflare Workers! This is your first worker.
 *
 * - Run "npm run dev" in your terminal to start a development server
 * - Open a browser tab at http://localhost:8787/ to see your worker in action
 * - Run "npm run deploy" to publish your worker
 *
 * Learn more at https://developers.cloudflare.com/workers/
 */

export default {
  async fetch(request, env, ctx) {
    return new Response("Hello World!");
  },
};
EOF
  module = true

  lifecycle {
    ignore_changes = [
      content
    ]
  }
}

resource "cloudflare_worker_route" "mnt_profile_route" {
  zone_id = var.cloudflare_zone_id
  pattern = "kmnt.info/*"
  script_name = cloudflare_worker_script.mnt_profile.name
}