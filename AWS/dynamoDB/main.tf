resource "aws_dynamodb_table" "dynamodb-terraform-locks" {
   name        = "terraform-locks"
   hash_key    = "LockID"
   billing_mode = "PAY_PER_REQUEST" 

   attribute {
      name = "LockID"
      type = "S"
   }

   tags = {
     Name = "Terraform Lock Table"
   }
}
