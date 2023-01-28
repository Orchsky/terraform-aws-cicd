resource "aws_s3_bucket" "my_bucket" {
  bucket = var.my_app_s3_bucket
  acl    = "private"
  #region = var.aws_region

  tags = {
    Name        = "orchsky-app-bucket"
    Environment = terraform.workspace
  }

}