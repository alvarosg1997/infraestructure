resource "aws_s3_bucket" "s3_lambda" {
  bucket = "bucket-lambda-asanchez" 

  lifecycle {
    prevent_destroy = false 
  }

  tags = {
    Name        = "terraform-bucket"
    Environment = "dev"
  }
}