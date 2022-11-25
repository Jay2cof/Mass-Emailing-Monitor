
locals {
  account_id = data.aws_caller_identity.current.account_id
  iam_role   = join(":", ["arn:aws:iam:", local.account_id, "role/LabRole"]) 
}
data "archive_file" "zip_the_python_code" {
  type        =  "zip"
  source_dir  =  "${path.module}/python/"
  output_path =  "${path.module}/build/lambda.zip" 
}
resource "aws_lambda_function" "email-monitor" {
  function_name = "email-monitor"
  filename =  "build/lambda.zip" 
  handler = "lambda.lambda_handler"
  timeout = 300
  role = local.iam_role
  runtime = "python3.9"
  source_code_hash = data.archive_file.zip_the_python_code.output_base64sha256
}