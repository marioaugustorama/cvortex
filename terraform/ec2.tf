resource "aws_key_pair" "kubernets-key" {
  key_name   = "devops-kubernets-key"
  public_key = file("../keys/devops-kubernets-key.pub")
}

resource "aws_instance" "k8s-master-instance" {
  ami           = var.aws_amis[var.region]
  instance_type = var.instance_type[0]
  key_name      = aws_key_pair.kubernets-key.key_name
  user_data     = file("cloud_config-master.yml")

  vpc_security_group_ids = [
    aws_security_group.kubernetes_rules.id
  ]

  tags = {
    Name = "k8s-master"
  }
  root_block_device {
    delete_on_termination = false
    volume_size           = 80
  }
}

resource "aws_instance" "k8s-workers-instance" {
  count         = var.instance_count
  ami           = var.aws_amis[var.region]
  instance_type = var.instance_type[0]
  key_name      = aws_key_pair.kubernets-key.key_name
  user_data     = file("cloud_config-worker.yml")

  vpc_security_group_ids = [
    aws_security_group.kubernetes_rules.id
  ]

  tags = {
    Name = "K8s-worker-${count.index + 1}"
  }

  root_block_device {
    delete_on_termination = false
    volume_size           = 80
  }
}