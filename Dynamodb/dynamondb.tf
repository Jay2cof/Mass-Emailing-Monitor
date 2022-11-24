resource "aws_dynamodb_table" "emailing-monitor" {
  name     = "emailing-monitor"
  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  read_capacity  = 5
  write_capacity = 5

  stream_enabled = true
  stream_view_type = "SEND_EMAILS"
}
