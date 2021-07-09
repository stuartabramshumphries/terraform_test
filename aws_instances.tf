resource "aws_instance" "example" {
  count             = var.instance_count
  ami               = var.aws_amis
  instance_type     = "t2.micro"
  availability_zone = "${var.zone != "" ? var.zone: var.zones[ count.index % length(var.zones) ]}"
  security_groups   = [aws_security_group.web-node1.name]
  key_name          = var.key_name
  user_data         = <<-EOF
         #!/bin/bash
         echo "Hello, Stuart" > /etc/motd2
         EOF
  tags = {
    Name = "stuart-terraform-${count.index}"
  }
}

output "instance_ips" {
  value = aws_instance.example.*.public_ip
}
