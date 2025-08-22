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

# Look up existing AKS cluster
data "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.tags["environment"]}-aks"    # cluster name
  resource_group_name = "${var.tags["environment"]}-rg-aks"
}

# Kubelet identity object ID
locals {
  kubelet_object_id = try(data.azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id, null)
}

# RG for AKS
module "rg_aks-rbac" {
  source   = "../../../modules/resource-group"
  name     = "${var.tags["environment"]}-rg-aks-rbac"
  location = var.location
  tags     = var.tags
}
module "aks_rbac" {
  source = "../../../modules/aks-rbac"

  aks_kubelet_object_id = local.kubelet_object_id
  acr_id                = data.azurerm_container_registry.acr.id
  subnet_id             = data.azurerm_subnet.aks_subnet.id
  tags                  = var.tags
  depends_on = [module.rg_aks-rbac]
  }
