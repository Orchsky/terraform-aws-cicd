locals {
  env_tag = {
    Environment = terraform.workspace
  }

  web_tags = merge(var.web_tags, local.env_tag)
}

resource "aws_instance" "web" {
  count                  = var.web_ec2_count
  ami                    = var.nat_amis[var.aws_region]
  instance_type          = var.web_instance_type
  subnet_id              = local.pub_sub_ids[count.index]
  tags                   = local.web_tags
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.s3_ec2_profile.name
  user_data              = file("scripts/apache.sh")

}