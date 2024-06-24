locals {
  merged_map_roles = distinct(concat(
    try(yamldecode(yamldecode(var.aws_auth_configmap_yaml).data.mapRoles), []),
    var.map_roles,
  ))

  aws_auth_configmap_yaml = templatefile("${path.module}/templates/aws_auth_cm.tpl",
    {
      map_roles    = local.merged_map_roles
      map_users    = var.map_users
      map_accounts = var.map_accounts
    }
  )
}

# patch
resource "kubernetes_config_map_v1_data" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    "mapRoles"    = yamlencode(local.merged_map_roles)
    "mapUsers"    = yamlencode(var.map_users)
    "mapAccounts" = yamlencode(var.map_accounts)
  }

  force = true
}

# create

# resource "kubernetes_config_map_v1" "aws_auth" {
#   metadata {
#     name      = "aws-auth"
#     namespace = "kube-system"
#   }

#   data = {
#     "mapRoles"    = yamlencode(local.merged_map_roles)
#     "mapUsers"    = yamlencode(var.map_users)
#     "mapAccounts" = yamlencode(var.map_accounts)
#   }
# }