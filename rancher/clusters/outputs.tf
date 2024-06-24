data "http" "raw_manifests" {
  for_each = rancher2_cluster.template
  url      = each.value.cluster_registration_token[0].manifest_url
}

locals {
  manifests = {
    for cluster, data in data.http.raw_manifests :
    cluster => {
      raw_manifest = data.response_body
      yaml_parts = compact([
        for s in split("YAMLSEPARATOR", replace(data.response_body, "/(?m:^---$)/", "YAMLSEPARATOR")) :
        try(yamlencode(yamldecode(s)), "")
      ])
    }
  }
}

output "cluster_manifests" {
  value = {
    for cluster, manifest_data in local.manifests :
    cluster => manifest_data.yaml_parts
  }
}
