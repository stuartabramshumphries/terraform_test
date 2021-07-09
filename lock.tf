terraform {
  backend "s3" {
    bucket         = "saah-lockfile"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "saah-db-lock"
    encrypt        = true
  }
}
