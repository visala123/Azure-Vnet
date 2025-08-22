# General
variable "rg_name"    { type = string }
variable "location"   { type = string }
variable "tags"       { type = map(string) }

# VNet
variable "vnet_name"            { type = string }
variable "vnet_address_space"   { type = list(string) }
variable "aks_subnet_name"      { type = string }
variable "aks_subnet_prefixes"  { type = list(string) }
variable "bastion_subnet_name"  { type = string }
variable "bastion_subnet_prefixes" { type = list(string) }
variable "enable_bastion_ssh_inbound" { type = bool }
variable "bastion_ssh_source_ranges"  { type = list(string) }

# ACR
variable "acr_name"  { type = string }
variable "acr_sku"   { type = string }

# Log Analytics / Monitor
variable "log_analytics_workspace_name" { type = string }
variable "log_analytics_sku"            { type = string }
variable "log_analytics_retention_days" { type = number }
variable "enable_azure_monitor"         { type = bool }

# Bastion VM
variable "bastion_name"               { type = string }
variable "bastion_vm_size"            { type = string }
variable "bastion_admin_username"     { type = string }
#variable "bastion_ssh_public_key_path"{ type = string }

# AKS
variable "aks_name"           { type = string }
variable "aks_dns_prefix"     { type = string }
variable "kubernetes_version" { type = string }
variable "network_plugin"     { type = string } # "azure" recommended
variable "service_cidr"       { type = string }
variable "dns_service_ip"     { type = string }

variable "system_node_count"  { type = number }
variable "system_vm_size"     { type = string }

variable "user_node_count"    { type = number }
variable "user_vm_size"       { type = string }

# Outbound
variable "managed_outbound_ip_count"        { type = number }
variable "grant_network_contributor_on_subnet" { type = bool }

