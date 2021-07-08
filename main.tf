provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

resource "aws_security_group" "web-node" {
  name = "web-node"
  description = "Web and SSH sec group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "example" {
  ami           = var.aws_amis
  instance_type = "t2.micro"
  availability_zone = var.availability_zone
  security_groups = [aws_security_group.web-node.name]
  key_name = var.key_name

  user_data = <<-EOF
           #!/bin/bash
           echo "Hello, Stuart" > /etc/motd2
           EOF
  tags = {
    Name = "stuart-terraform-playground"
  }
}

