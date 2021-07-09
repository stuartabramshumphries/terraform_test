resource "aws_instance" "example" {
  ami               = var.aws_amis
  instance_type     = "t2.micro"
  availability_zone = var.availability_zone
  security_groups   = [aws_security_group.web-node1.name]
  key_name          = var.key_name
  user_data         = <<-EOF
         #!/bin/bash
         echo "Hello, Stuart" > /etc/motd2
         EOF
  tags = {
    Name = "stuart-terraform-playground"
  }
}

output "instance_ips" {
  value = aws_instance.example.*.public_ip
}
