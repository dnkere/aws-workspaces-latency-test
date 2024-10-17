# us-west-1/region.tf

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR block"
  type        = string
}

variable "directory_password" {
  description = "Directory Service Password"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "workspace_user_name" {
  description = "WorkSpace user name"
  type        = string
  default     = "workspace_admin"
}

variable "ami_us_west_2" {
  description = "AMI for EC2 in us-west-2"
  type        = string
}

variable "workspace_bundle_id_us_west_2" {
  description = "Bundle ID for WorkSpace in us-west-2"
  type        = string
}
