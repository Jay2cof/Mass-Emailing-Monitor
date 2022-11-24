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
locals {
  account_id = data.aws_caller_identity.current.account_id
  iam_role   = join(":", ["arn:aws:iam:", local.account_id, "role/LabRole"]) 
}
