tags = {
  environment = "uat"
}

aks_nsg_rules = [
  { name = "SSH",  priority = 100, direction = "Inbound", access = "Allow", protocol = "Tcp", destination_port_range = "22", source_address_prefix = "0.0.0.0/0" },
  { name = "HTTP", priority = 200, direction = "Inbound", access = "Allow", protocol = "Tcp", destination_port_range = "80", source_address_prefix = "0.0.0.0/0" },
  { name = "HTTPS",priority = 300, direction = "Inbound", access = "Allow", protocol = "Tcp", destination_port_range = "443", source_address_prefix = "0.0.0.0/0" }
]

bastion_nsg_rules = [
  { name = "SSH",  priority = 100, direction = "Inbound", access = "Allow", protocol = "Tcp", destination_port_range = "22", source_address_prefix = "10.20.2.18/32" },
  { name = "HTTP", priority = 200, direction = "Inbound", access = "Allow", protocol = "Tcp", destination_port_range = "80", source_address_prefix = "0.0.0.0/0" },
  { name = "HTTPS",priority = 300, direction = "Inbound", access = "Allow", protocol = "Tcp", destination_port_range = "443", source_address_prefix = "0.0.0.0/0" }
]
