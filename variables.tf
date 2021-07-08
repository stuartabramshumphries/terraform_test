variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-2"
}

variable "aws_profile" {
  description = "AWS profile"
  default = "stumain"
}

variable "key_name" {
  description = "key name to add to server"
  default     = "tf_lon"
}

variable "cidr_block" {
  description = "default subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  default = "eu-west-2a"
}

variable "aws_amis" {
  default = "ami-063a939f366c8da70"
}

