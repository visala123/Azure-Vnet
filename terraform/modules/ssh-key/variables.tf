variable "ssh_key_name" {
  type        = string
  description = "Name of the SSH key"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where the SSH key will be created"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
