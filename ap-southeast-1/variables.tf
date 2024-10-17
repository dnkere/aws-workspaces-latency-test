# ap-southeast-1/region.tf

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR block"
  type        = string
}

variable "subnet_cidr_block_2" {
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
}

variable "ami_ap_southeast_1" {
  description = "AMI for EC2 in ap-southeast-1"
  type        = string
}

variable "workspace_bundle_id_ap_southeast_1" {
  description = "Bundle ID for WorkSpace in ap-southeast-1"
  type        = string
}
