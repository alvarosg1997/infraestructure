resource "kubernetes_deployment" "portfolio" {
  metadata {
    name = "portfolio"
    labels = {
      app = "portfolio"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "portfolio"
      }
    }

    template {
      metadata {
        labels = {
          app = "portfolio"
        }
      }

      spec {
        container {
          name  = "portfolio"
          image = "alvarosg97/portfolio:${var.image_tag}"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "portfolio" {
  metadata {
    name = "portfolio"
  }

  spec {
    selector = {
      app = "portfolio"
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}

variable "image_tag" {
  description = "Tag de la imagen Docker"
  type        = string
}
