output "codecommit_repository_urls" {
  value = { for repo in aws_codecommit_repository.codecommit_repo : repo.repository_name => repo.clone_url_http }
}

output "ecr_repository_urls" {
  value = { for repo in aws_ecr_repository.ecr_repo : repo.name => repo.repository_url }
}