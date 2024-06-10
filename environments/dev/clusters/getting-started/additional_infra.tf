################################################################################
# Argo Workflows needs
################################################################################
module "argo_workflows_eks_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.30.0"

  role_name = "argo-workflows-irsa-${local.name}"

  role_policy_arns = {
    policy = "arn:aws:iam::aws:policy/AdministratorAccess"
  }

  oidc_providers = {
    one = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["argo-workflows:argo-workflow", "argo-workflows:argo-workflows-server", "argo-workflows-workflow-controller"]
    }
  }
}