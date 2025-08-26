location               = "eastus"
vnet_address_space     = ["10.20.0.0/16"]
aks_subnet_prefixes    = ["10.20.10.0/24"]
bastion_subnet_prefixes= ["10.20.20.0/24"]

tags = {
  environment = "prod"
}