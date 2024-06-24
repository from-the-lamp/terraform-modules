data "cloudinit_config" "template" {
  gzip          = var.gzip
  base64_encode = var.base64_encode
  part {
    content_type = var.content_type
    content      = templatefile(var.content, var.vars)
  }
}

output "config" {
  value     = data.cloudinit_config.template
  sensitive = true
}
