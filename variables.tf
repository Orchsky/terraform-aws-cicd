variable "vpc_cidr" {
  description = "Choose cider for vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "OrchskyVPC"
}

variable "aws_region" {
    type = string 
    default = "us-east-1"
}

variable "nat_amis" {
  type = string 
  default = "ami-0aa7d40eeae50c9a9"
}