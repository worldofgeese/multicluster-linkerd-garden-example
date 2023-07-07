resource "civo_firewall" "my-firewall" {
    name = "my-firewall"
    region = var.region
}
resource "civo_kubernetes_cluster" "my-cluster" {
    firewall_id = civo_firewall.my-firewall.id
    name = var.cluster_name
    region = var.region
    applications = "-Traefik-v2-nodeport,Linkerd:Linkerd with Dashboard \u0026 Jaeger"
    pools {
        size = var.node_size
        node_count = var.node_count
    }
    kubernetes_version = var.kubernetes_version
}

resource "local_file" "kubeconfig" {
  filename = "${path.module}/kubeconfig.yaml"
  content  = civo_kubernetes_cluster.my-cluster.kubeconfig
}
