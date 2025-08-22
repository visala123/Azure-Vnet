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

# Get Bastion Subnet from the VNet
data "azurerm_subnet" "bastion_subnet" {
  name                 = "${var.tags["environment"]}-snet-bastion"
  virtual_network_name = "${var.tags["environment"]}-vnet"
  resource_group_name  = "${var.tags["environment"]}-rg-vnet"   
}

# RG for Bastion
module "rg_bastion" {
  source   = "../../../modules/resource-group"
  name     ="${var.tags["environment"]}-rg-bastion"
  location = var.location
  tags     = var.tags
}

# SSH Key
module "bastion_key" {
  source              = "../../../modules/ssh-key"
  ssh_key_name        = "${var.tags["environment"]}-bastion-key"
  resource_group_name = module.rg_bastion.name
  location            = module.rg_bastion.location
  tags                = var.tags
}

# Bastion VM
module "bastion" {
  source              = "../../../modules/bastion"
  name                = "${var.tags["environment"]}-vm-bastion"
  location            = module.rg_bastion.location
  resource_group_name = module.rg_bastion.name
  subnet_id           = data.azurerm_subnet.bastion_subnet.id # comes from VNet output
  vm_size             = var.bastion_vm_size
  admin_username      = "${var.tags["environment"]}-AZUREUSER"
  ssh_public_key      = module.bastion_key.public_key
  tags                = var.tags
}
