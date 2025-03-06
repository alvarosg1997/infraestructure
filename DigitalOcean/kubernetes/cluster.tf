
data "digitalocean_kubernetes_versions" "current" {}

resource "digitalocean_kubernetes_cluster" "terraform_cluster" {
  name    = "terraform-cluster"
  region  = "lon1" # Replace with your preferred region
  version = data.digitalocean_kubernetes_versions.current.latest_version

  node_pool {
    name       = "default-pool"
    size       = "s-2vcpu-2gb"
    node_count = 1
  }
}

# resource "digitalocean_kubernetes_node_pool" "additional_node" {
#   cluster_id = digitalocean_kubernetes_cluster.terraform_cluster.id
#   name       = "additional-node-pool"
#   size       = "s-2vcpu-4gb"
#   node_count = 1
#   tags = ["k8s", "additional-node"]
# }

resource "local_file" "kube_config" {
  content  = digitalocean_kubernetes_cluster.terraform_cluster.kube_config.0.raw_config
  filename = "kubeconfig.yaml"
}