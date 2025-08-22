#variable "rg_name"    { type = string }
variable "location"   { type = string }
variable "tags"       { type = map(string) }
#variable "aks_name"           { type = string }
variable "aks_dns_prefix"     { type = string }
variable "kubernetes_version" { type = string }
variable "network_plugin"     { type = string } # "azure" recommended
variable "service_cidr"       { type = string }
variable "dns_service_ip"     { type = string }

variable "system_node_count"  { type = number }
variable "system_vm_size"     { type = string }

variable "user_node_count"    { type = number }
variable "user_vm_size"       { type = string }
variable "enable_azure_monitor"         { type = bool }
variable "log_analytics_sku"            { type = string }
variable "log_analytics_retention_days" { type = number }

# Outbound
variable "managed_outbound_ip_count"        { type = number }
variable "grant_network_contributor_on_subnet" { type = bool }

