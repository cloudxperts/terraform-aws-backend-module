# creating S3 bucket
resource "aws_s3_bucket" "terraform_backend_bucket" {
   bucket = var.bucket_name

   versioning {
      enabled = var.versioning_enabled
   }

   server_side_encryption_configuration {
      rule {
         apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
         }
      }
   }
}

