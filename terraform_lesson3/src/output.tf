output "info_servers" {
  value = flatten([
    [for i in yandex_compute_instance.database : {
      name = i.name
      id   = i.id
      fqdn = i.fqdn
    }],
    [for i in yandex_compute_instance.webservers : {
      name = i.name
      id   = i.id
      fqdn = i.fqdn
    }]
      ])
}