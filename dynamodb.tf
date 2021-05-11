# creating DynamoDB
resource "aws_dynamodb_table" "terraform_dynamodb_table_locks" {
   name = var.dynamodb_table
   billing_mode = var.billing_mode_db
   hash_key = "LockID"

   attribute {
      name = "LockID"
      type = "S"
   }
}