resource "kubernetes_namespace" "minikube_test" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace_monitoring
  }
}