variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}

variable "aks_subnet_id" {
  type = string
}
variable "bastion_subnet_id" {
  type = string
}

# NSG names
variable "aks_sg_name" {
  type = string
}
variable "bastion_sg_name" {
  type = string
}

# NSG rules
variable "aks_nsg_rules" {
  type = list(object({
    name                   = string
    priority               = number
    direction              = string
    access                 = string
    protocol               = string
    destination_port_range = string
    source_address_prefix  = string
  }))
}
variable "bastion_nsg_rules" {
  type = list(object({
    name                   = string
    priority               = number
    direction              = string
    access                 = string
    protocol               = string
    destination_port_range = string
    source_address_prefix  = string
  }))
}

variable "tags" {
  type = map(string)
}
