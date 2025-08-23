terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80"
    }
  }
}
provider "azurerm" {
  features {}
}
# Get AKS Subnet from the VNet
# data "azurerm_subnet" "aks_subnet" {
#   name                 = "${var.tags["environment"]}-snet-aks"
#   virtual_network_name = "${var.tags["environment"]}-vnet"
#   resource_group_name  = "${var.tags["environment"]}-rg-vnet"   
# }

# RG for ACR
module "rg_acr" {
  source   = "../../../modules/resource-group"
  name     = "${var.tags["environment"]}-rg-acr"
  location = var.location
  tags     = var.tags
}

module "acr" {
  source              = "../../../modules/acr"
  name                = "${var.tags["environment"]}revinciacr"
  location            = module.rg_acr.location
  resource_group_name = module.rg_acr.name
  sku                 = var.acr_sku
  admin_enabled       = var.admin_enabled
  tags                = var.tags
  # network_rule_set = null
    
}

