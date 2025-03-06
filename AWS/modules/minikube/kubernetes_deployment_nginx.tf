
resource "kubernetes_deployment" "nginx" {
    metadata {
        name = "nginx"
        namespace = var.namespace
    }
    spec {
        replicas = 2
        selector {
            match_labels = {
                app = "nginx"
            }
        }
        template {
            metadata {
                labels = {
                    app = "nginx"
                }
            }
            spec {
                container {
                    image = "nginx"
                    name = "nginx"
                    port {
                        container_port = 80
                    }
                }
            }
        }
    }
}