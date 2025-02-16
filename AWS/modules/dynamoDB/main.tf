resource "aws_dynamodb_table" "dynamodb_locks" {
  name           = var.table_name
  hash_key       = "LockID"
  billing_mode = "PAY_PER_REQUEST"

   attribute {
      name = "LockID"
      type = "S"
   }

  tags = {
    Name = "Terraform Lock Table"
  }
}