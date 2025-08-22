#variable "rg_name"    { type = string }
variable "location"   { type = string }
variable "tags"       { type = map(string) }

#variable "vnet_name"            { type = string }
variable "vnet_address_space"   { type = list(string) }
#variable "aks_subnet_name"      { type = string }
variable "aks_subnet_prefixes"  { type = list(string) }
#variable "bastion_subnet_name"      { type = string }
variable "bastion_subnet_prefixes"  { type = list(string) }
variable "enable_bastion_ssh_inbound" { type = bool }
variable "bastion_ssh_source_ranges"  { type = list(string) }
