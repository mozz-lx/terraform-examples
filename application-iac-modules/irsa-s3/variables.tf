variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "application_name" {}

variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "oidc_provider_arn" {
  description = "The ARN of the OIDC provider"
  type        = string
}

variable "namespace" {
  description = "The Kubernetes namespace where the service account resides"
  type        = string
}

variable "service_account_name" {
  description = "The name of the Kubernetes service account"
  type        = string
}

variable "kubernetes_host" {
  type = string
}

variable "kubernetes_cluster_ca_certificate" {
  type = string
}

variable "kubernetes_cluster_name" {
  type = string
}

variable "kubernetes_region" {
  type = string
}

