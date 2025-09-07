resource "helm_release" "template" {
  name                       = var.helm_release_name
  repository                 = var.helm_repo_url
  chart                      = var.helm_chart_name
  version                    = var.helm_chart_version
  namespace                  = var.helm_namespace
  create_namespace           = var.helm_create_namespace
  repository_username        = var.helm_repo_user
  repository_password        = var.helm_repo_pass
  force_update               = var.helm_force_update
  recreate_pods              = var.helm_recreate_pods
  reuse_values               = var.helm_reuse_values
  disable_openapi_validation = var.disable_openapi_validation
  values                     = var.helm_values
  set_sensitive = [
    for k, v in var.set_sensitive : {
      name  = k
      value = v
    }
  ]
}
