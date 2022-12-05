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

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  iam_role   = join(":", ["arn:aws:iam:", local.account_id, "role/LabRole"]) 
}
data "archive_file" "zip_the_python_code" {
  type        =  "zip"
  source_dir  =  "${path.module}/python/"
  output_path =  "${path.module}/build/lambda.zip" 
}
