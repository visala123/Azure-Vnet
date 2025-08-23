variable "aks_kubelet_object_id" {
  description = "The Object ID of the AKS kubelet identity (used for RBAC assignments)"
  type        = string
}

variable "acr_id" {
  description = "The resource ID of the Azure Container Registry (ACR)"
  type        = string
}

variable "subnet_id" {
  description = "The resource ID of the subnet where AKS is deployed"
  type        = string
}

variable "grant_network_contributor_on_subnet" {
  description = "Whether to assign Network Contributor role to the AKS kubelet identity on the subnet"
  type        = bool
  default     = true
}


variable "tags" {
  type    = map(string)
  default = {}
}
