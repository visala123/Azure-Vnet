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

# Resource Group
module "rg" {
  source   = "../../modules/resource-group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

# VNet & Subnets
module "vnet" {
  source                = "../../modules/vnet"
  name                  = var.vnet_name
  location              = module.rg.location
  resource_group_name   = module.rg.name
  address_space         = var.vnet_address_space
  aks_subnet_name       = var.aks_subnet_name
  aks_subnet_prefixes   = var.aks_subnet_prefixes
  bastion_subnet_name   = var.bastion_subnet_name
  bastion_subnet_prefixes = var.bastion_subnet_prefixes
  enable_bastion_ssh_inbound = var.enable_bastion_ssh_inbound
  bastion_ssh_source_ranges  = var.bastion_ssh_source_ranges
  tags                 = var.tags
  }

# ACR
module "acr" {
  source              = "../../modules/acr"
  name                = var.acr_name
  location            = module.rg.location
  resource_group_name = module.rg.name
  sku                 = var.acr_sku
  tags                = var.tags
  
}

# Log Analytics Workspace for Azure Monitor
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  location            = module.rg.location
  resource_group_name = module.rg.name
  sku                 = var.log_analytics_sku
  retention_in_days   = var.log_analytics_retention_days
  tags                = var.tags
}

# Module that generates SSH key
module "bastion_key" {
  source              = "../../modules/ssh-key"
  ssh_key_name        = "${var.tags["environment"]}-bastion-key"
  resource_group_name = module.rg.name
  location            = module.rg.location
  tags                = var.tags
}

# Bastion / Jump VM
module "bastion" {
  source              = "../../modules/bastion"
  name                = var.bastion_name
  location            = module.rg.location
  resource_group_name = module.rg.name
  subnet_id           = module.vnet.bastion_subnet_id
  vm_size             = var.bastion_vm_size
  admin_username      = var.bastion_admin_username
  ssh_public_key      = module.bastion_key.public_key
  tags                = var.tags
}

# AKS (Private)
module "aks" {
  source                         = "../../modules/aks"
  name                           = var.aks_name
  location                       = module.rg.location
  resource_group_name            = module.rg.name
  dns_prefix                     = var.aks_dns_prefix
  kubernetes_version             = var.kubernetes_version
  subnet_id                      = module.vnet.aks_subnet_id
  network_plugin                 = var.network_plugin
  service_cidr                   = var.service_cidr
  dns_service_ip                 = var.dns_service_ip

  system_node_count              = var.system_node_count
  system_vm_size                 = var.system_vm_size

  user_node_count                = var.user_node_count
  user_vm_size                   = var.user_vm_size

  acr_id                         = module.acr.id
  enable_azure_monitor           = var.enable_azure_monitor
  log_analytics_workspace_id     = azurerm_log_analytics_workspace.law.id

  managed_outbound_ip_count      = var.managed_outbound_ip_count
  grant_network_contributor_on_subnet = var.grant_network_contributor_on_subnet

  tags = var.tags
}
module "aks_rbac" {
  source = "../../modules/aks-rbac"

  aks_kubelet_object_id = module.aks.kubelet_object_id
  acr_id                = module.acr.id
  subnet_id             = module.vnet.aks_subnet_id
  tags                  = var.tags
  }