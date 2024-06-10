provider "aws" {
  region = local.region
}
data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}

locals {
  region       = var.region
  repositories = var.repositories
}

# create a dynamic block, that receives a dictionary from the variables
module "application_foundation" {
  source       = "../../../application-iac-modules/codecommit-ecr"
  repositories = local.repositories
}