resource "aws_dynamodb_table" "cvortex-locks" {
  name         = "cvortex-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }
}