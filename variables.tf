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
  type    = string
  default = "us-east-1"
}

variable "nat_amis" {
  type = map(any)
  default = {
    us-east-1 = "ami-0aa7d40eeae50c9a9"
    us-east-2 = "ami-05bfbece1ed5beb54"
  }

}

variable "web_instance_type" {
  description = "Choose instance type for your web ec2"
  type        = string
  default     = "t2.micro"
}

variable "web_tags" {
  type = map(any)
  default = {
    Name = "Webserver"
  }

}

variable "web_ec2_count" {
  description = "Choose number of ec2 instances for webserver"
  type        = string
  default     = "2"
}

variable "my_app_s3_bucket" {
  default = "orchsky-app-bucket"

}