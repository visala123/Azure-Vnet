variable "name"                { type = string }
variable "location"            { type = string }
variable "resource_group_name" { type = string }

variable "dns_prefix"          { type = string }
variable "kubernetes_version"  { type = string }

variable "subnet_id"           { type = string } # AKS nodes subnet
variable "network_plugin"      { type = string } # "azure" (CNI) or "kubenet"
variable "service_cidr"        { type = string }
variable "dns_service_ip"      { type = string }
variable "outbound_type"       { type = string }

variable "private_cluster_enable" {type = bool}  #true

variable "nodepool_identity_type" {
  description = "Identity type (SystemAssigned or UserAssigned)"
  type        = string
  default     = "SystemAssigned"
}

# System pool
variable "system_nodepool_name" {
  description = "Name of the system node pool"
  type        = string
}
variable "system_node_count"   { type = number }
variable "system_vm_size"      { type = string }
variable "nodepool_os_disk_size_gb" {
  description = "OS disk size in GB"
  type        = number
  default     = 128
}

variable "nodepool_type" {
  description = "Type of node pool (VirtualMachineScaleSets or AvailabilitySet)"
  type        = string
  default     = "VirtualMachineScaleSets"
}

# User pool
variable "user_nodepool_name" {
  description = "Name of the AKS user node pool"
  type        = string
}

variable "nodepool_mode" {
  description = "Mode of the node pool (System/User)"
  type        = string
  default     = "User"
}

variable "nodepool_labels" {
  description = "Labels for the node pool"
  type        = map(string)
  default     = {}
}

variable "nodepool_taints" {
  description = "Taints for the node pool"
  type        = list(string)
  default     = []
}
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