variable "global_tags" {
  description = "Map of key,value pairs to tag all resources."
  type        = map(string)
  default     = {}
}
variable "directory_password" {
  description = "The password for the directory."
  type        = string
  default     = "Password1234"
}

