variable "directory_password" {
  description = "The password for the directory"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the directory"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID for the directory"
  type        = string
}
