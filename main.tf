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
  iam_role   = join(":", ["arn:iam:", local.account_id, "role/labRole"]) 
}
data "archive_file" "zip_the_python_code" {
  type        =  "zip"
  source_dir  =  "${path.module}/python/"
  output_path =  "${path.module}/python/lambda.zip" 
}
resource "aws_lambda_function" "email-monitor" {
  function_name = "email-monitor"
  filename =  "python/lambda.zip" 
  handler = "lambda.lambda_handler"
  timeout = 300
  role = local.iam_role
  runtime = "python3.9"
}
