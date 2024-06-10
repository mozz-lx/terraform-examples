variable "repositories" {
  description = "A map of repositories to create with keys as repository identifiers"
  type = map(object({
    codecommit_repo_name = string
    ecr_repo_name        = string
    description          = string
  }))
}
