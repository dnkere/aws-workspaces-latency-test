
<<<<<<< HEAD

variable "subnet_ids" {
  description = "A list of VPC subnet IDs to launch resources in"
  type        = list(string)
}

variable "ami_id" {
  description = "EC2 AMI id to use in the launch template"
  type        = string
  default     = null
}

=======
>>>>>>> 30267b8 (latest)
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3a.xlarge"
}

<<<<<<< HEAD
variable "instance_permission_policies" {
  description = "List of IAM permission policy names to assign to the instance role."
  type        = set(string)
  default     = []
}

variable "additional_instance_security_groups" {
  description = "List of security group ID's to add to each instance"
  type        = list(string)
  default     = []
=======
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "instance_permission_policies" {
  description = "A map of instance permission policies for each region"
  type        = map(list(string))
  default     = {
    use1  = [
      "AmazonSSMDirectoryServiceAccess",
      "AmazonSSMManagedInstanceCore",
      "AWSAccelerator-SessionManagerLogging",
      "CloudWatchAgentServerPolicy",
      "AmazonS3ReadOnlyAccess",
    ]
    usw2  = [
      "AmazonSSMDirectoryServiceAccess",
      "AmazonSSMManagedInstanceCore",
      "AWSAccelerator-SessionManagerLogging",
      "CloudWatchAgentServerPolicy",
      "AmazonS3ReadOnlyAccess",
    ]
    apse1 = [
      "AmazonSSMDirectoryServiceAccess",
      "AmazonSSMManagedInstanceCore",
      "AWSAccelerator-SessionManagerLogging",
      "CloudWatchAgentServerPolicy",
      "AmazonS3ReadOnlyAccess",
    ]
  }
}

variable "ami" {
  description = "AMI"
  type        = string
  default     = null
}

variable "name" {
  description = "Name"
  type        = string
  default     = "mock-workspace"
}

variable "ingress_cidr_blocks" {
  description = "The ingress cidr blocks for the security group"
  type        = list(string)
}

variable "region" {
  description = "The region of the workspace"
  type        = string
>>>>>>> 30267b8 (latest)
}
