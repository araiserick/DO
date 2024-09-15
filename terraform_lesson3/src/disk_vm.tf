resource "yandex_compute_disk" "volumes" {
  count = 3

  name     = "disk-${count.index}"
  type     = "network-hdd"
  size     = 1
  zone     = "ru-central1-a"

}

resource "yandex_compute_instance" "storage" {
    depends_on = [resource.yandex_compute_instance.database]
    name        = "storage"
    platform_id = "standard-v1"
    resources {
        cores         = 2
        memory        = 1
        core_fraction = 5
    }

    boot_disk {
    initialize_params {
         image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }
    dynamic "secondary_disk" {
        for_each = yandex_compute_disk.volumes.*.id
            content {
                disk_id = secondary_disk.value
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