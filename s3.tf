resource "aws_s3_bucket" "elblogs" {
  bucket = "saah-elb-logs"
  acl    = "private"

  tags = {
    Name        = "bucker for elb logs"
  }
}
