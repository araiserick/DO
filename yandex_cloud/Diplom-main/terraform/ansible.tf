
resource "local_file" "hosts_cfg" {
  content = templatefile("${abspath(path.module)}/hosts.tftpl",
    {
      master	= [yandex_compute_instance.master-node]
      worker   = yandex_compute_instance.platform
    }
  )

  filename = "../ansible/inventory/hosts.ini"

}