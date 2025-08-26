location               = "eastus"
vnet_address_space     = ["10.21.0.0/16"]
aks_subnet_prefixes    = ["10.21.1.0/24"]
bastion_subnet_prefixes= ["10.21.2.0/24"]

tags = {
  environment = "dev"
}