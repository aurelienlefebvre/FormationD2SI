terraform {
  backend "s3" {
    bucket = "aurelien-d2si"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}

