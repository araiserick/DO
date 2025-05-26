output "cluster-k8s-master" {
  value = "name = ${yandex_compute_instance.master-node.name} | external-address=${yandex_compute_instance.master-node.network_interface.0.ip_address} | internal-address=${yandex_compute_instance.master-node.network_interface.0.nat_ip_address}"
}

output "cluster-k8-workers" {
  value = [
    for i in yandex_compute_instance.platform: 
   "name = ${i.name} | external-address=${i.network_interface.0.ip_address} | internal-address=${i.network_interface.0.nat_ip_address}"
  ]
}
