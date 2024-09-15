resource "yandex_compute_instance" "database" {
  depends_on = [resource.yandex_compute_instance.webservers]
  platform_id = "standard-v1"
  for_each   = {
    for index, vm in var.vm_resources_list:
    vm.vm_name => vm
  }

  name        = each.value.vm_name

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction

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
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.serial-port-enable
    ssh-keys           = var.vms_ssh_root_key
  }

}