provider "kubernetes" {
  host                   = module.environment.kubernetes_host
  cluster_ca_certificate = base64decode(module.environment.kubernetes_cluster_ca_certificate)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.environment.cluster_name, "--region", module.environment.aws_region]
  }
}

module "environment" {
  source = "../"
}

module "python_basic_app_infra" {
  source = "../../../../application-iac-modules/irsa-s3"
  application_name                    = var.application_name
  bucket_name                         = var.bucket_name
  role_name                           = var.role_name
  oidc_provider_arn                   = module.environment.oidc_provider_arn
  namespace                           = var.application_name
  service_account_name                = var.application_name
  kubernetes_host                     = module.environment.kubernetes_host
  kubernetes_cluster_ca_certificate   = base64decode(module.environment.kubernetes_cluster_ca_certificate)
  kubernetes_cluster_name             = module.environment.cluster_name
  kubernetes_region                   = module.environment.aws_region
}