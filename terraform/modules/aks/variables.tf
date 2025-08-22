variable "name"                { type = string }
variable "location"            { type = string }
variable "resource_group_name" { type = string }

variable "dns_prefix"          { type = string }
variable "kubernetes_version"  { type = string }

variable "subnet_id"           { type = string } # AKS nodes subnet
variable "network_plugin"      { type = string } # "azure" (CNI) or "kubenet"
variable "service_cidr"        { type = string }
variable "dns_service_ip"      { type = string }

# System pool
variable "system_node_count"   { type = number }
variable "system_vm_size"      { type = string }

# User pool
variable "user_node_count"     { type = number }
variable "user_vm_size"        { type = string }

# ACR integration
variable "acr_id"              { type = string }

# Azure Monitor
variable "enable_azure_monitor"          { type = bool }
variable "log_analytics_workspace_id"    { type = string }

# Outbound
variable "managed_outbound_ip_count" {
  type    = number
  default = 1
}

# Optional: grant Network Contributor on subnet to AKS MI
variable "grant_network_contributor_on_subnet" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}