resource "aws_codecommit_repository" "codecommit_repo" {
  for_each       = var.repositories
  repository_name = each.value.codecommit_repo_name
  description     = each.value.description

  tags = {
    Name = each.value.codecommit_repo_name
  }
}

resource "aws_ecr_repository" "ecr_repo" {
  for_each = var.repositories
  name     = each.value.ecr_repo_name

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = each.value.ecr_repo_name
  }
}