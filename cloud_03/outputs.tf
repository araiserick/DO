output "picture_url" {
  value = "https://${yandex_storage_bucket.arais.bucket_domain_name}/${yandex_storage_object.my-picture.key}"
}
