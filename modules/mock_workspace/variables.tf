variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3a.xlarge"
}

variable "instance_id" {
  description = "EC2 instance ID"
  type        = string
}

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


variable "name" {
  description = "Name"
  type        = string
  default     = "mock-workspace"
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks for ingress"
  type        = list(string)
}

variable "global_tags" {
  description = "The global tags"
  type        = map(string)
}

variable "policy_names" {
  description = "List of IAM policy names"
  type        = list(string)
  default     = ["AmazonSSMDirectoryServiceAccess",
      "AmazonSSMManagedInstanceCore",
      "AWSAccelerator-SessionManagerLogging",
      "CloudWatchAgentServerPolicy",
      "AmazonS3ReadOnlyAccess"]
}

