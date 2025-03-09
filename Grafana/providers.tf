terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.21.0"
    }
  }
}

provider "grafana" {
  url  = "https://grafana.asgdevops.eu"
  auth = var.grafana_auth
}
