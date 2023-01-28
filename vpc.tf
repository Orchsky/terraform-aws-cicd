locals {
  vpc_name = terraform.workspace == "prod" ? "orchsky-prod" : "orchsky-dev"
}

resource "aws_vpc" "my_vpc" {
  #count            = "${terraform.workspace == "prod" ? 0 : 1}"
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name        = local.vpc_name
    Environment = terraform.workspace
    Location    = "USA"
  }
}















# output "vpc_cidr" {
#     value = aws_vpc.my_vpc.cidr_block

# }

# output "vpc_arn" {
#     value = aws_vpc.my_vpc.arn
# }

# output "vpc_tenancy" {
#     value = aws_vpc.my_vpc.instance_tenancy

# }