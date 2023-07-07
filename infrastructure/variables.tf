variable "cluster_name" {
  description = "The name of the kubernetes cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of k3s"
  type        = string
}

variable "region" {
  description = "The region where the cluster is created"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the cluster"
  type        = number
}

variable "node_size" {
  description = "The size of each node in the cluster"
  type        = string
}
