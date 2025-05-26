resource "yandex_vpc_network" "net" {
  name = "develop"
}

resource "yandex_vpc_subnet" "subnets-master" {
  name           = "subnet-master"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "subnets" {
  count          = 3
  name           = "subnet-${var.subnet[count.index]}"
  zone           = "${var.subnet[count.index]}"
  network_id     = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = [ "${var.cidr[count.index]}" ]
}

resource "yandex_compute_instance" "master-node" {
  name                      = var.vpc_name
  zone                      = var.default_zone
  platform_id               = var.vpc.platform_id
  hostname                  = var.vpc_name
  allow_stopping_for_update = true


  resources {
    cores                   = var.vpc.cores
    memory                  = var.vpc.memory
    core_fraction           = var.vpc.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id              = var.vpc.image_id
      size                  = var.vpc.disk_size
    }
  }

  scheduling_policy {
    preemptible             = true
  }


  network_interface {
    subnet_id = yandex_vpc_subnet.subnets-master.id
    nat       = true
  }

  metadata                  = local.ssh_keys_and_serial_port

}

resource "yandex_compute_instance" "platform" {
  count                     = 3
  name                      = "worker-${count.index+1}"
  zone                      = "${var.subnet[count.index]}"
  platform_id               = var.vpc.platform_id
  hostname                  = "worker-${count.index+1}"
  allow_stopping_for_update = true

  resources {
    cores         = var.vpc.cores
    memory        = var.vpc.memory
    core_fraction = var.vpc.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.vpc.image_id
      size     = var.vpc.disk_size
    }
  }

## Прерываемая
  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnets[count.index].id}"
    nat       = true
  }

  metadata = local.ssh_keys_and_serial_port
  
}
