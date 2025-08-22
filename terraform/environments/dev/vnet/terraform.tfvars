location               = "eastus"
vnet_address_space     = ["10.20.0.0/16"]
aks_subnet_prefixes    = ["10.20.1.0/24"]
bastion_subnet_prefixes= ["10.20.2.0/24"]

enable_bastion_ssh_inbound = true
bastion_ssh_source_ranges  = ["YOUR.PUBLIC.IP.ADDR/32"]

tags = {
  environment = "dev"
  owner       = "platform-team"
}
