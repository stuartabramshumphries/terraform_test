provider "aws" {
  region = "eu-west-2"
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
  ami           = "ami-098828924dc89ea4a"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web-node.name]
  key_name = "tf_lon"

  user_data = <<-EOF
           #!/bin/bash
           echo "Hello, Stuart" > /etc/motd2
           yum -y install httpd
           systemctl enable httpd
           systemctl start httpd
           EOF
  tags = {
    Name = "stuart-terraform-example"
  }
}

