output "iam_role_arn" {
  value = module.python_basic_app_infra.iam_role_arn
}

output "s3_bucket_name" {
  value = module.python_basic_app_infra.s3_bucket_name
}