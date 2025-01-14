resource "yandex_compute_instance" "public_instance" {
  name        = "public-instance"
  hostname    = "public-instance"
  platform_id = "standard-v1"
  boot_disk {
    initialize_params {
      image_id = var.vm_base.image_id
      size     = var.vm_base.disk_size
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }
  resources {
    cores         = var.vm_base.cores
    memory        = var.vm_base.memory
    core_fraction = var.vm_base.core_fraction
  }
  metadata = local.ssh_keys_and_serial_port
}

resource "yandex_compute_instance" "private_instance" {
  name        = "private-instance"
  hostname    = "private-instance"
  platform_id = "standard-v1"
  boot_disk {
    initialize_params {
      image_id = var.vm_base.image_id
      size     = var.vm_base.disk_size
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = false
  }
  resources {
    cores         = var.vm_base.cores
    memory        = var.vm_base.memory
    core_fraction = var.vm_base.core_fraction
  }
  metadata = local.ssh_keys_and_serial_port
}
resource "yandex_compute_instance" "nat_instance" {
  name        = "nat-instance"
  hostname    = "nat"
  platform_id = "standard-v1"
  boot_disk {
    initialize_params {
      image_id = var.nat.image_id
      size     = var.nat.disk_size
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
    ip_address         = "192.168.10.254"
  }
  resources {
    cores         = var.nat.cores
    memory        = var.nat.memory
    core_fraction = var.nat.core_fraction
  }
  metadata = local.ssh_keys_and_serial_port
}
