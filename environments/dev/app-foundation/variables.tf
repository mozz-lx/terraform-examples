variable "region" {
  default = "us-east-1"
}

variable "repositories" {
  default = {
    app1 = {
      codecommit_repo_name = "python-basic-app"
      ecr_repo_name        = "python-basic-app"
      description          = "Application foundation repository for app1"
    }
    app2 = {
      codecommit_repo_name = "python-application-2"
      ecr_repo_name        = "python-application-2"
      description          = "Application foundation repository for app2"
    }
    app3 = {
      codecommit_repo_name = "argo-workflows-internal"
      ecr_repo_name        = "argo-workflows-internal"
      description          = "Argo Workflows Internal"
    }
  }
}