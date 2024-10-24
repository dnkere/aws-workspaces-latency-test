variable "directory_id" {
  type        = string
  description = "The ID of the directory for the WorkSpace"
}

variable "bundle_id" {
  type        = string
  description = "The ID of the bundle for the WorkSpace"
}

variable "user_name" {
  type        = string
  description = "The user name of the user for the WorkSpace"
}

variable "global_tags" {
  description = "The global tags"
  type        = map(string)
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for WorkSpaces"
}

variable "workspace_bundle_id" {
  description = "The ID of the workspace bundle"
  type        = string
  default     = "wsb-55rrhyyg1"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "workspace_user_password" {
  type        = string
  description = "The password for the workspace user"
  sensitive   = true
  default     = "Password123"
}

variable "workspace_user_name" {
  type        = string
  description = "The name of the workspace user"
  default     = "workspace-user"
}

variable "display_name" {
  type        = string
  description = "The display name of the workspace user"
  default     = "Workspace User"
}

variable "given_name" {
  type        = string
  description = "The first name of the workspace user"
  default     = "Workspace"
}

variable "surname" {
  type        = string
  description = "The last name of the workspace user"
  default     = "User"
}
