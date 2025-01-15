// Создание сервисного аккаунта
resource "yandex_iam_service_account" "bucket" {
  name = "bucket"
}

// Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket.id}"
}

// Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.bucket.id
  description        = "static access key for object storage"
}

// Создание ключа шифрования
resource "yandex_kms_symmetric_key" "encryption-key" {
  name              = "encryption-key"
  description       = "yandex_kms_symmetric_key"
  default_algorithm = "AES_256"
  rotation_period   = "8760h"
}

// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "arais" {
  bucket                = "arais"
  access_key            = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key            = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  server_side_encryption_configuration {
    rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = yandex_kms_symmetric_key.encryption-key.id
      sse_algorithm     = "aws:kms"
      }
    }
  }
}

// Загрузка тестовой картинки в бакет
resource "yandex_storage_object" "my-picture" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "arais"
  key        = "img.png"
  source     = "./images/img.png"
  acl = "public-read" # открываем доступ на чтение всем
  depends_on = [yandex_storage_bucket.arais]
}
