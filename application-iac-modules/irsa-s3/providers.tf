provider "kubernetes" {
  alias = "eks"
  host                   = var.kubernetes_host
  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", var.kubernetes_cluster_name, "--region", var.kubernetes_region]
  }
}