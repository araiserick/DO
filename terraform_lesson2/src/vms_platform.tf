resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  platform_id = "standard-v1"
  resources {
    cores         = var.resources_db.cores
    memory        = var.resources_db.memory
    core_fraction = var.resources_db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.serial-port-enable
    ssh-keys           = var.vms_ssh_root_key
      }
}
