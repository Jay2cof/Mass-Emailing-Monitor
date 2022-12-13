  terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40"
    }
  }
  backend "s3" {
    bucket = "email-monitor-jay"
    key    = "terraform.tfstate"
    region = "us-west-2"

  }
}
provider "aws" {
  region = "us-west-2"
}


locals {
  account_id = "861680570809"
  iam_role   = join(":", ["arn:aws:iam:", local.account_id, "role/LabRole"]) 
}

