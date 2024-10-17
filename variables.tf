# variables.tf

variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "First subnet CIDR block"
  default     = "10.1.1.0/24"
}

variable "subnet_cidr_block_2" {
  description = "Second subnet CIDR block"
  default     = "10.1.2.0/24"
}

variable "directory_password" {
  description = "Password for AWS Directory Service"
  type        = string
}

variable "workspace_user_name" {
  description = "User name for the AWS WorkSpace"
  type        = string
  default     = "workspace_admin"
}

variable "instance_type" {
  description = "Instance type for EC2"
  default     = "t2.micro"
}

# Specific AMIs for each region
variable "ami_us_east_1" {
  description = "AMI for EC2 instances in us-east-1"
  default     = "ami-0324a83b82023f0b3"
}

variable "ami_us_west_2" {
  description = "AMI for EC2 instances in us-west-2"
  default     = "ami-00bedb8509ebcc120"
}

variable "ami_ap_southeast_1" {
  description = "AMI for EC2 instances in ap-southeast-1"
  default     = "ami-0c86ea25dca843f1c"
}

# Workspace bundle IDs
variable "workspace_bundle_id_us_east_1" {
  description = "Workspace bundle ID for us-east-1"
  default     = "wsb-bh8rsxt14"
}

variable "workspace_bundle_id_us_west_2" {
  description = "Workspace bundle ID for us-west-2"
  default     = "wsb-bh8rsxt14"
}

variable "workspace_bundle_id_ap_southeast_1" {
  description = "Workspace bundle ID for ap-southeast-1"
  default     = "wsb-bh8rsxt14"
}
