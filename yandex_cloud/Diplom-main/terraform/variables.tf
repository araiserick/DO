variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "bucket" {
  type = string
  default = "bucket"
}

variable "vpc" {
  type = map(any)
  default = {
    cores         = 2,
    memory        = 2,
    core_fraction = 20,
    platform_id   = "standard-v3"
    image_family  = "ubuntu-2004-lts"
    image_id      = "fd89j9gu6vbcmqkcf4gh"
    disk_size     = 40
  }
}

variable "user_name" {
  type = string
  default = "ubuntu"
}

variable "default_name" {
  type = string
  default = "develop"
}

variable "vpc_name" {
  type        = string
  default     = "master"
  description = "VPC name"
}

variable "subnet" {
  type        = list(string)
  default     = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
  description = "subnet zones (https://cloud.yandex.ru/docs/overview/concepts/geo-scope)"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["192.168.40.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
  description = "zone cirds (https://cloud.yandex.ru/docs/overview/concepts/geo-scope)"
}

variable "ssh-keys" {
  type        = string
  default     = "local.key_ssh_ssh-ed25519"
  description = "ssh-keygen -t ed25519"
}
