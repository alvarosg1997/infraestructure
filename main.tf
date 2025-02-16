module "iam" {
  source = "./modules/iam"
}

module "dynamodb" {
  source = "./modules/dynamoDB"
}

module "ec2-docker" {
  source = "./modules/ec2"
}