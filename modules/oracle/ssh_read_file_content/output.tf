output "file_contents" {
  value = { for index in range(length(ssh_resource.template.*.result)) :
  var.remote_files_paths[index] => trimspace(ssh_resource.template.*.result[index]) }
  sensitive = true
}
