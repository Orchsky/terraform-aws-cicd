resource "aws_s3_bucket" "my_bucket" {
  bucket = var.my_app_s3_bucket
  acl    = "private"
  #region = var.aws_region

  tags = {
    Name        = "orchsky-app-bucket"
    Environment = terraform.workspace
  }

}

resource "aws_s3_bucket" "alb_access_logs" {
  bucket = "orchsky-alb-access-logs"
  policy = data.template_file.orchsky.rendered
  acl    = "public-read-write"
  tags = {
    Name        = "orchsky-alb-access-logs"
    Environment = terraform.workspace
  }

}