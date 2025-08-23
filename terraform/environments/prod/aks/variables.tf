variable "location"   { type = string }
variable "tags"       { type = map(string) }
variable "aks_dns_prefix"     { type = string }
variable "kubernetes_version" { type = string }
variable "network_plugin"     { type = string } # "azure" recommended
variable "service_cidr"       { type = string }
variable "dns_service_ip"     { type = string }

variable "system_node_count"  { type = number }
variable "system_vm_size"     { type = string }

variable "user_node_count"    { type = number }
variable "user_vm_size"       { type = string }
variable "enable_azure_monitor" { type = bool }
variable "log_analytics_sku"    { type = string }
variable "log_analytics_retention_days" { type = number }

# Outbound
variable "managed_outbound_ip_count"        { type = number }
variable "grant_network_contributor_on_subnet" { type = bool }

variable "private_cluster_enable" {
  description = "Enable private cluster (true/false)"
  type        = bool
}

variable "nodepool_identity_type" {
  description = "Identity type for AKS (SystemAssigned or UserAssigned)"
  type        = string
}
variable "nodepool_os_disk_size_gb" {
  description = "OS disk size for system nodepool"
  type        = number
}

variable "nodepool_type" {
  description = "System nodepool type (e.g., VirtualMachineScaleSets)"
  type        = string
}

variable "outbound_type" {
  description = "Outbound type for AKS networking (e.g., loadBalancer, userDefinedRouting)"
  type        = string
}
variable "nodepool_mode" {
  description = "Node pool mode (System/User)"
  type        = string
}

variable "nodepool_labels" {
  description = "Labels to apply to user nodepool"
  type        = map(string)
  default     = {}
}

variable "nodepool_taints" {
  description = "Taints to apply to user nodepool"
  type        = list(string)
  default     = []
}

