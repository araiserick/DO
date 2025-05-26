resource "yandex_iam_service_account" "bucket" {
  name = var.bucket
}

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket.id}"
  depends_on = [yandex_iam_service_account.bucket]
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.bucket.id
  description        = "static access key for object storage"
}

resource "yandex_storage_bucket" "zhivarev" {
  bucket                = "zhivarev"
  access_key            = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key            = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  max_size              = 1073741824 # 1 Gb
}
