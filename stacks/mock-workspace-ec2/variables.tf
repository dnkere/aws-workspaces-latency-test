variable "global_tags" {
  description = "The global tags for the resources"
  type        = map(string)
}

variable "instance_permission_policies" {
  description = "The instance permission policies"
  type        = map(list(string))
  default     = {}
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

variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "t3.small"
}
