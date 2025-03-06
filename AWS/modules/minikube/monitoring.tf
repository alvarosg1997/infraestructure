resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stackr"
  namespace  = var.namespace_monitoring
  version    = var.kube-version
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  set {
    name  = "prometheus-node-exporter.enabled"
    value = "true"
  }

  set {
    name  = "grafana.enabled"
    value = "true"
  }
}