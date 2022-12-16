resource "aws_lambda_function" "email-monitor" {
  function_name = "email-monitor"
  filename =  "build/job_crawler.zip" 
  handler = "crawler.handler"
  timeout = 300
  role = local.iam_role
  runtime = "python3.9"
  source_code_hash = filebase64sha256("build/job_crawler.zip")

  layers = [aws_lambda_layer_version.requests_layer.arn]

  environment {
    variables = {
      EMAILS_TABLE_NAME = aws_dynamodb_table.emailing-monitor.name

    }
  }
}

resource "aws_lambda_layer_version" "requests_layer" {
  s3_bucket = "email-monitor-jay"
  s3_key    = "requests-layer.zip"
  layer_name = "requests-layer"

  compatible_runtimes = ["python3.9"]
}