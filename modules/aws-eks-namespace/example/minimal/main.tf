provider "aws" {
  version = "~>3.0"
  region  = "us-east-1"
}

module "namespace" {
  source = "../../"

  namespace          = "app-dev"
  create_ci_iam_user = true

  administrators = [
    "krzysztof.miemiec@boldare.com"
  ]
  developers = [
    "dev1@boldare.com",
    "dev2.boldare.com"
  ]
}
