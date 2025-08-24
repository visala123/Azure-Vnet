variable "tags" {
  type = map(string)
}
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
