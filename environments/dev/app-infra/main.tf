provider "aws" {
  region = local.region
}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}

locals {
  region       = var.region
  cluster_name = var.cluster_name
}

# Fetch EKS Cluster information
data "aws_eks_cluster" "cluster" {
  name = local.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = local.cluster_name
}

# Fetch OIDC provider ARN for the EKS cluster
data "aws_iam_openid_connect_provider" "oidc" {
  url = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}
