module "iam" {
  source = "./modules/iam"
}

module "dynamodb" {
  source = "./modules/dynamoDB"
}

module "ec2-docker" {
  source = "./modules/ec2/ec2-docker"
}

module "ec2-portfolio" {
  source = "./modules/ec2/ec2-portfolio"
}

module "minikube" {
  source = "./modules/minikube"
}
module "s3" {
  source = "./modules/s3"
}