provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "orchsky-terraform-backend"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ocrhsky-tf"
  }
}