provider "aws" {
  version = "~>3.0"
  region  = "us-east-1"
}

module "developers" {
  source = "../"

  name = "Developers"
  attached_policy_arns = {
    read_only = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }
  users = {
    user_1 = "developer-iam-user-1",
    user_2 = "developer-iam-user-2"
  }
}
