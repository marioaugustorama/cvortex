output "k8s-Master" {
    value = aws_instance.k8s-master-instance.public_ip
}

output "k8s-Worker" {
    value = ["${aws_instance.k8s-workers-instance.*.public_ip}"]
}

resource "local_file" "AnsibleInventory" {
  content = templatefile("template/inventory.tmpl", {
    master = aws_instance.k8s-master-instance.public_ip,
    names = aws_instance.k8s-workers-instance.*.tags.Name,    
    workers = aws_instance.k8s-workers-instance.*.public_ip
  })
  filename = "../ansible/inventory"
}
