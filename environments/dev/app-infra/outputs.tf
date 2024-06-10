output "oidc_provider_arn" {
  description = "The ARN of the OIDC provider for the EKS cluster"
  value       = data.aws_iam_openid_connect_provider.oidc.arn
}

output "cluster_name" {
  value = data.aws_eks_cluster.cluster.name
}

output "aws_region" {
  value = var.region
}

output "kubernetes_cluster_ca_certificate" {
  value = data.aws_eks_cluster.cluster.certificate_authority[0].data
}

output "kubernetes_host" {
  value = data.aws_eks_cluster.cluster.endpoint
}