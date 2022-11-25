terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40"
    }
  }
}
provider "aws" {
  region = "us-west-2"
}
data "aws_caller_identity" "current" {}

