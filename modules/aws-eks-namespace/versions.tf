terraform {
  required_version = ">= 0.12.6, < 0.14"

  required_providers {
    aws        = ">= 2.49, < 4.0"
    kubernetes = ">= 1.0, < 2.0"
  }
}
