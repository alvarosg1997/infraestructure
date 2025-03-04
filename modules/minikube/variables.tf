variable "namespace" {
  type    = string
  default = "minikube-test"
}
variable "namespace_monitoring" {
  type    = string
  default = "observability"
}
variable "kube-version" {
  type    = string
  default = "69.7.2"
}