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

resource "aws_iam_role" "jay_project_role" {
    name = "terraform_aws_lambda-role"
    assume-role_policy = <<EOF
  
{
    "Version": "2012-10-17",
    "Statement".[
        {
            "Action": "sts:assumeRole,
            "Principal": {
                "Service": "lambda.amazonaws.com"
            }
            "Effect": "Allow",
            "Sid": ""
        },
    ]
}
EOF
}