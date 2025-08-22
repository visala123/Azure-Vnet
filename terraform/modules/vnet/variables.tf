variable "name"                  { type = string }
variable "location"              { type = string }
variable "resource_group_name"   { type = string }
variable "address_space"         { type = list(string) }

# Subnets
variable "aks_subnet_name"       { type = string }
variable "aks_subnet_prefixes"   { type = list(string) }

variable "bastion_subnet_name"   { type = string }
variable "bastion_subnet_prefixes"{ type = list(string) }

# NSG rules (simple & opinionated)
variable "enable_bastion_ssh_inbound" {
  type        = bool
  description = "Allow SSH inbound to Bastion from Internet (lock with source_ranges)"
  default     = true
}
variable "bastion_ssh_source_ranges" {
  type        = list(string)
  description = "CIDRs allowed to SSH to Bastion"
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  type    = map(string)
  default = {}
}


