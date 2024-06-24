data "cloudflare_zone" "template" {
  name = var.cloudflare_zone_name
}

data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "template" {
  name = var.cloudflare_token_name
  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["Cache Purge"],
    ]
    resources = {
      "com.cloudflare.api.account.zone.${data.cloudflare_zone.template.id}" = "*"
    }
  }
}
