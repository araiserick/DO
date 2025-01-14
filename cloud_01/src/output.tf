output "public" {
  value = "${yandex_compute_instance.public_instance.name} - ${yandex_compute_instance.public_instance.network_interface.0.ip_address}(${yandex_compute_instance.public_instance.network_interface.0.nat_ip_address})"
}

output "private" {
  value = "${yandex_compute_instance.private_instance.name} - ${yandex_compute_instance.private_instance.network_interface.0.ip_address}(${yandex_compute_instance.private_instance.network_interface.0.nat_ip_address})"
}
