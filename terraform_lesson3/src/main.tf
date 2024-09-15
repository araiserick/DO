resource "yandex_vpc_network" "develop" {
  name = "webservers"
}
resource "yandex_vpc_subnet" "develop" {
  name           = "webservers"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}