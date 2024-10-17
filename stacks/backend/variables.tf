variable "bucket_prefix" {
  description = "AWS S3 bucket name prefix"
  type = string
}

variable "region" {
  description = "AWS Region"
  type = string
}

variable "lock_table_name" {
  description = "AWS DynamoDB name for Terraform lock table"
  type = string
}

variable "global_tags" {
  description = "Map of key,value pairs to tag all resources."
  type        = map(string)
  default     = {}
}
