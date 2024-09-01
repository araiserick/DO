output "name_vm_web" {
  value = "${yandex_compute_instance.platform.name}"
}
output "ip_address_platform" {
  value = "${yandex_compute_instance.platform.network_interface.0.nat_ip_address}"
}
output "fqdn_platform" {
  value = "${yandex_compute_instance.platform.fqdn}"
}

output "name_vm_db" {
  value = "${yandex_compute_instance.platform_db.name}"
}
output "ip_address_platform_db" {
  value = "${yandex_compute_instance.platform_db.network_interface.0.nat_ip_address}"
}
output "fqdn_platform_db" {
  value = "${yandex_compute_instance.platform_db.fqdn}"
}