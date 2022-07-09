terraform {
  backend "s3" {
    bucket = "p6-west-1"
    key    = "terraform/terraform.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"
  #profile = "default"

  default_tags {
    tags = local.tags
  }
}