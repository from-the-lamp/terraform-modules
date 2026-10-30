output "ocid" {
  value     = oci_objectstorage_bucket.template.bucket_id
  sensitive = true
}

output "name" {
  value = oci_objectstorage_bucket.template.name
}
