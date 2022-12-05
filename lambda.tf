resource "aws_lambda_function" "email-monitor" {
  function_name = "email-monitor"
  filename =  "build/lambda.zip" 
  handler = "lambda.lambda_handler"
  timeout = 300
  role = local.iam_role
  runtime = "python3.9"
  source_code_hash = data.archive_file.zip_the_python_code.output_base64sha256

  environment {
    variables = {
      EMAILS_TABLE_NAME = aws_dynamodb_table.emailing-monitor.name

    }
  }
}

resource "aws_lambda_layer_version" "request_layer" {
  s3_bucket = "email-monitor-jay"
  s3_key    = "request-layer.zip"
  layer_name = "requests-layer"

  compatible_runtimes = ["python3.9"]
}