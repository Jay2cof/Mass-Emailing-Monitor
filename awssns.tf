resource "aws_sns_topic" "email-monitor-topic" {
  name = "email-monitor-topic"
}
resource "aws_lambda_permission" "allow-sns-to-lambda" {
  function_name = aws_lambda_function.email-monitor.function_name
  action = "lambda:InvokeFunction"
  principal = "sns.amazonaws.com"
  source_arn = aws_sns_topic.email-monitor-topic.arn
  statement_id = "AllowExecutionFromSNS"
}
resource "aws_sns_topic_subscription" "sns-lambda-subscritption" {
  topic_arn = aws_sns_topic.email-monitor-topic.arn
  protocol = "lambda"
  endpoint = aws_lambda_function.email-monitor.arn
}