resource "aws_lambda_function" "email-monitor" {
  function_name = "email-monitor"
  filename =  "build/lambda.zip" 
  handler = "lambda.lambda_handler"
  timeout = 300
  role = local.iam_role
  runtime = "python3.9"
  source_code_hash = data.archive_file.zip_the_python_code.output_base64sha256
}

