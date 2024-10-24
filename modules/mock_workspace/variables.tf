
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3a.xlarge"
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
}

variable "global_tags" {
  description = "The global tags"
  type        = map(string)
}
