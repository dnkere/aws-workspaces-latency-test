

variable "subnet_ids" {
  description = "A list of VPC subnet IDs to launch resources in"
  type        = list(string)
}

variable "ami_id" {
  description = "EC2 AMI id to use in the launch template"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3a.xlarge"
}

variable "instance_permission_policies" {
  description = "List of IAM permission policy names to assign to the instance role."
  type        = set(string)
  default     = []
}

variable "additional_instance_security_groups" {
  description = "List of security group ID's to add to each instance"
  type        = list(string)
  default     = []
}
