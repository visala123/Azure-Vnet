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
data "azurerm_subnet" "aks_subnet" {
  name                 = "${var.tags["environment"]}-snet-aks"
  virtual_network_name = "${var.tags["environment"]}-vnet"
  resource_group_name  = "${var.tags["environment"]}-rg-vnet"   
}
# Get ACR id
data "azurerm_container_registry" "acr" {
  name                = "${var.tags["environment"]}revinciacr"         
  resource_group_name = "${var.tags["environment"]}-rg-acr" 
}

# RG for AKS
module "rg_aks" {
  source   = "../../../modules/resource-group"
  name     = "${var.tags["environment"]}-rg-aks"
  location = var.location
  tags     = var.tags
}
resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.tags["environment"]}-log-analytics-workspace"
  location            = module.rg_aks.location
  resource_group_name = module.rg_aks.name
  sku                 = var.log_analytics_sku
  retention_in_days   = var.log_analytics_retention_days
  tags                = var.tags
}

module "aks" {
  source                         = "../../../modules/aks"  #D:\git\Azure-Vnet\terraform\modules
  name                           = "${var.tags["environment"]}-aks"
  location                       = module.rg_aks.location
  resource_group_name            = module.rg_aks.name
  dns_prefix                     = var.aks_dns_prefix
  kubernetes_version             = var.kubernetes_version
 private_cluster_enable          = var.private_cluster_enable
 
  nodepool_identity_type         = var.nodepool_identity_type
  system_nodepool_name           = "${var.tags["environment"]}syspool"
  nodepool_os_disk_size_gb       = var.nodepool_os_disk_size_gb
  nodepool_type                  = var.nodepool_type
  subnet_id                      = data.azurerm_subnet.aks_subnet.id 
  network_plugin                 = var.network_plugin
  service_cidr                   = var.service_cidr
  dns_service_ip                 = var.dns_service_ip
  outbound_type                  = var.outbound_type

  system_node_count              = var.system_node_count
  system_vm_size                 = var.system_vm_size

  user_node_count                = var.user_node_count
  user_vm_size                   = var.user_vm_size
  user_nodepool_name             = "${var.tags["environment"]}userpool"
  nodepool_mode                  = var.nodepool_mode
  nodepool_labels                = var.nodepool_labels
  nodepool_taints                = var.nodepool_taints

  acr_id                         = data.azurerm_container_registry.acr.id
  enable_azure_monitor           = var.enable_azure_monitor
  log_analytics_workspace_id     = azurerm_log_analytics_workspace.law.id #var.log_analytics_workspace_id

  managed_outbound_ip_count      = var.managed_outbound_ip_count
  grant_network_contributor_on_subnet = var.grant_network_contributor_on_subnet

  tags = var.tags

  depends_on = [module.rg_aks]
}
