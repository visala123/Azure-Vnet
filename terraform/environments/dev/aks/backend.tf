terraform {
  backend "azurerm" {
    resource_group_name  = "dev-revinci"
    storage_account_name = "devrevincicicd"
    container_name       = "dev-revinci"
    key                  = "dev.aks.tfstate"
  }
}
