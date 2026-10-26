# The root of the "app of apps" pattern: nothing inside argo-apps can create
# this, since ArgoCD has to be told about the repo before it can read
# anything from it. This is the one resource in the whole GitOps flow that
# has to be applied directly instead of synced from git.
resource "kubernetes_manifest" "application" {
  field_manager {
    force_conflicts = true
  }

  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = var.name
      namespace = var.namespace
    }
    spec = {
      project = "default"
      source = {
        repoURL        = var.repo_url
        targetRevision = var.target_revision
        path           = var.path
      }
      destination = {
        name      = "in-cluster"
        namespace = var.namespace
      }
      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
        syncOptions = [
          "CreateNamespace=true",
        ]
      }
    }
  }
}
