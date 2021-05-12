variable "aws-region" {
   description = "Provide the region of your choice, default us-east-1."
   type = string
   default = "us-east-1"
}

variable "aws-profile" {
   description = "Please provide the IAM profile which will connect to AWS. default is terraform which will work only if terraform profile is created."
   type = string
   default = "terraform"
}

variable "bucket_name" {
   description = "Bucket name must be unique globally and should not contain any special char except '-' char."
   type = string

   validation {
      condition = length(var.bucket_name) < 60 && length(var.bucket_name) > 5 
      error_message = "Bucket name must be less than 60 char and greater than 5 char and unique."
   }
}

variable "versioning_enabled" {
   description = "This variable's value must be true or false."
   type = bool
   default = true
}

variable "dynamodb_table" {
   description = "Provide your dynamoDB table name, default cx-terraform-backend-lock-table"
   type = string
   default = "cx-terraform-backend-lock-table"
   validation {
      condition = length(var.dynamodb_table) < 60 && length(var.dynamodb_table) > 5
      error_message = "Table name should be less than 60 char and greater than 5 char."
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

