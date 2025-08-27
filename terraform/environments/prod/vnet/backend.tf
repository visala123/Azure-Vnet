terraform {
  backend "azurerm" {
  #  resource_group_name  = "dev-revinci"
  #   storage_account_name = "devrevincicicd"
  #   container_name       = "dev-revinci"
   resource_group_name  = "demo-rg"
    storage_account_name = "terraformbackendalgorims"
    container_name       = "tfstate-aks"
    key                  = "prod.vnet.tfstate"
  }
}
