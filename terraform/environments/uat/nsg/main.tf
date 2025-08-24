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
# ── Get Resource Group (created in VNet module) ──
data "azurerm_resource_group" "rg" {
  name = "${var.tags["environment"]}-rg-vnet"
}

# ── Get Subnets from VNet 
data "azurerm_subnet" "aks_subnet" {
  name                 = "${var.tags["environment"]}-snet-aks"
  virtual_network_name = "${var.tags["environment"]}-vnet"
  resource_group_name  = "${var.tags["environment"]}-rg-vnet"   
}

data "azurerm_subnet" "bastion_subnet" {
  name                 = "${var.tags["environment"]}-snet-bastion"
  virtual_network_name = "${var.tags["environment"]}-vnet"
  resource_group_name  = "${var.tags["environment"]}-rg-vnet"   
}
# Security Groups for AKS + Bastion
module "nsg" {
  source              = "../../../modules/nsg"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  aks_sg_name       = "${var.tags["environment"]}-aks-nsg"
  bastion_sg_name   = "${var.tags["environment"]}-bastion-nsg"

  aks_nsg_rules     = var.aks_nsg_rules
  bastion_nsg_rules = var.bastion_nsg_rules

  aks_subnet_id     = data.azurerm_subnet.aks_subnet.id
  bastion_subnet_id = data.azurerm_subnet.bastion_subnet.id

  tags = var.tags
}
