data "oci_core_instance" "template" {
  instance_id = var.instance_id
}

resource "null_resource" "boot_finished" {
  provisioner "remote-exec" {
    inline = [
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 5; done",
    ]
    connection {
      type        = "ssh"
      host        = data.oci_core_instance.template.public_ip
      user        = var.user
      private_key = var.private_key
    }
  }
}

resource "ssh_resource" "template" {
  host        = data.oci_core_instance.template.public_ip
  user        = var.user
  private_key = var.private_key
  agent       = false
  timeout     = var.timeout
  retry_delay = var.retry_delay
  count       = length(var.remote_files_paths)
  commands = [
    var.use_sudo ? "sudo cat ${var.remote_files_paths[count.index]}" : "cat ${var.remote_files_paths[count.index]}"
  ]
  depends_on = [null_resource.boot_finished]
}
