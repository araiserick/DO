locals {
    ssh-keys= file(var.vms_ssh_root_key.ssh-keys)
    serial-port= "${var.vms_ssh_root_key.serial-port-enable}"
}