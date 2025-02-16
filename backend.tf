terraform {
  backend "s3" {
    bucket         = "terraform-state-asanchez"
    key            = "AWS/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
