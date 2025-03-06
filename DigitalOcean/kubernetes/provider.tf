terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {

  token = var.digitalocean_token
}

provider "kubernetes" {
  config_path = local_file.kube_config.filename
}