# Create a new load balancer
resource "aws_elb" "stuweb" {
  name               = "stuweb-terraform-elb"
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

#  access_logs {
#    bucket        = "saah-elb-logs"
#    bucket_prefix = "stuweb"
#    interval      = 60
#  }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = "${aws_instance.example.*.id}"
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400


  tags = {
    Name = "stuweb-terraform-elb"
  }
}

output "elb_dns_name" {
  description = "The DNS name of the ELB"
#  value       = aws_elb.stuweb.*.elb_dns_name
   value       = aws_elb.stuweb.dns_name
}
