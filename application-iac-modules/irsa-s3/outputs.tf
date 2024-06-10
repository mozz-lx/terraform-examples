output "iam_role_arn" {
  value = module.iam_role_for_service_accounts.iam_role_arn
}

output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.id
}