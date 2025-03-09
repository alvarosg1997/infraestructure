terraform {
  backend "s3" {
    bucket         = "terraform-state-asanchez"
    key            = "Grafana/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    profile        = "asanchez"
    encrypt        = true
  }
}
