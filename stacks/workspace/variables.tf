variable "global_tags" {
  description = "Map of key,value pairs to tag all resources."
  type        = map(string)
  default     = {}
}

variable "workspace_user_password" {
  type        = string
  description = "The password for the workspace user"
  sensitive   = true
}
