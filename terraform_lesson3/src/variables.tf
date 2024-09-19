###cloud vars
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
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "serial-port-enable" {
  type = string
  default = 1
}
###ssh vars

variable "vms_ssh_root_key" {
  type        = map(any)
  default     = {
    serial-port-enable = 1
    ssh-keys           = "~/.ssh/id_rsa.pub"
  }
}

variable "vm_resources_list" {
  type          = list(object({
      vm_name       = string
      cpu           = number
      ram           = number
      disk          = number
      core_fraction = number
  }))
  default           = [
      {
      vm_name       = "main"
      cpu           = 2
      ram           = 1
      disk          = 1
      core_fraction = 5

      },
      {  
      vm_name       = "replica"
      cpu           = 4
      ram           = 2
      disk          = 3
      core_fraction = 5
      },
  ]
  description = "There's list if dict's with VM resources"
}

