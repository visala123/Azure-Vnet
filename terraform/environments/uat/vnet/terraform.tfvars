location               = "eastus"
vnet_address_space     = ["10.20.0.0/16"]
aks_subnet_prefixes    = ["10.20.1.0/24"]
bastion_subnet_prefixes= ["10.20.2.0/24"]

tags = {
  environment = "uat"
}