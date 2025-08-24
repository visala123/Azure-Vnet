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
# Resource Group for VNet
module "rg_vnet" {
  source   = "../../../modules/resource-group"
  name     = "${var.tags["environment"]}-rg-vnet"
  location = var.location
  tags     = var.tags
}

# VNet + Subnets (NO NSGs here)
module "vnet" {
  source              = "../../../modules/vnet"
  name                = "${var.tags["environment"]}-vnet"
  location            = module.rg_vnet.location
  resource_group_name = module.rg_vnet.name
  address_space       = var.vnet_address_space

  aks_subnet_name         = "${var.tags["environment"]}-snet-aks"
  aks_subnet_prefixes     = var.aks_subnet_prefixes
  bastion_subnet_name     = "${var.tags["environment"]}-snet-bastion"
  bastion_subnet_prefixes = var.bastion_subnet_prefixes

  tags = var.tags

  depends_on = [module.rg_vnet]
}