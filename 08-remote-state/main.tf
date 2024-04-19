resource "null_resource" "test" {}

terraform {
  backend "s3" {
    bucket = "d77-terraform-01"
    key    = "test/terraform.tfstate"
    region = "us-east-1"
  }
}



