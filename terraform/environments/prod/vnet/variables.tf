variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vnet_address_space" {
  type = list(string)
}

variable "aks_subnet_prefixes" {
  type = list(string)
}

variable "bastion_subnet_prefixes" {
  type = list(string)
}