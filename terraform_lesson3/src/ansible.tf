resource "local_file" "hosts" {    
  filename = "hosts"    
  content = templatefile("${path.module}/hosts.tftpl", {    
    webservers = yandex_compute_instance.webservers    
    databases  = yandex_compute_instance.database    
    storage    = [yandex_compute_instance.storage]    
  })    
}  
 
resource "null_resource" "ansible_provisioning" {  
  depends_on = [resource.yandex_compute_instance.storage]
  provisioner "local-exec" {  
    command = "ansible-playbook -i hosts ../demo/test.yml"   
    
    working_dir = path.module  
    interpreter = ["bash", "-c"]  
  }  
} 
