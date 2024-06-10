resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3-access-policy"
  description = "Policy to allow S3 access"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
}

module "iam_role_for_service_accounts" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name               = var.role_name

  oidc_providers = [
    {
      provider_arn     = var.oidc_provider_arn
      namespace_service_accounts = ["${var.namespace}:${var.service_account_name}"]
    }
  ]

  role_policy_arns = {
    policy = aws_iam_policy.s3_access_policy.arn
    }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "kubernetes_secret_v1" "irsa_secret" {
  metadata {
    name        = "${var.application_name}-irsa"
    namespace   = "argocd"
    annotations = {
      "argocd.argoproj.io/sync-options" = "Prune=false"
    }
  }

  data = {
    iam_role_arn = base64encode(module.iam_role_for_service_accounts.iam_role_arn)
    bucket_name  = base64encode(var.bucket_name)
  }
}

