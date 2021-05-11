variable "aws-region" {
   type = string
   default = "us-east-1"
}

variable "aws-profile" {
   type = string
   default = "terraform"
}

variable "bucket_name" {
   description = "bucket name must contain string number and - special char, no other char"
   type = string

   validation {
      condition = length(var.bucket_name) < 60 && length(var.bucket_name) > 5 
      error_message = "Bucket name must be less than 60 char and greater than 5 char and unique."
   }
}

variable "versioning_enabled" {
   type = bool
   default = true
}

variable "dynamodb_table" {
   type = string
   default = "cx-terraform-backend-lock-table"
   validation {
      condition = length(var.dynamodb_table) < 60
      error_message = "Table name must be less than 60 char."
   }
}

variable "billing_mode_db" {
   description = "which billing mode you want ? (options: PROVISIONED, PAY_PER_REQUEST)."
   type = string
   default = "PAY_PER_REQUEST"
   validation {
      condition = contains(["PROVISIONED", "PAY_PER_REQUEST"], var.billing_mode_db)
      error_message = "Valid value must be PROVISIONED or PAY_PER_REQUEST."
   }
}

