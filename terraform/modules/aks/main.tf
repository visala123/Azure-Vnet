# Private AKS with managed NAT for outbound
resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  private_cluster_enabled = var.private_cluster_enable     #true

  identity {
    type =var.nodepool_identity_type   #"SystemAssigned"
  }

  default_node_pool {
    name           = var.system_nodepool_name  #"systempool"
    #mode           = "System"
    vm_size        = var.system_vm_size
    node_count     = var.system_node_count
    vnet_subnet_id = var.subnet_id
    orchestrator_version = var.kubernetes_version
    os_disk_size_gb      = var.nodepool_os_disk_size_gb ##128
    type                 = var.nodepool_type   #"VirtualMachineScaleSets"
  }

  network_profile {
    network_plugin   = var.network_plugin
    service_cidr     = var.service_cidr
    dns_service_ip   = var.dns_service_ip
    outbound_type    = var.outbound_type   #"loadBalancer"
    nat_gateway_profile {
      managed_outbound_ip_count = var.managed_outbound_ip_count
    }
  }

  # Azure Monitor / Container insights
  dynamic "oms_agent" {
    for_each = var.enable_azure_monitor ? [1] : []
    content {
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [ default_node_pool[0].node_count ]
  }
}

# User Pool - tainted to keep system pods away
resource "azurerm_kubernetes_cluster_node_pool" "userpool" {
  name                  = var.user_nodepool_name #userpool
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = var.user_vm_size
  node_count            = var.user_node_count
  vnet_subnet_id        = var.subnet_id
  mode                  = var.nodepool_mode #"User"
  node_labels           = var.nodepool_labels   #{ purpose = "user" }
  node_taints           = var.nodepool_taints    #["sku=user:NoSchedule"]
  orchestrator_version  = var.kubernetes_version
  tags                  = var.tags
}

# Role: AcrPull for kubelet identity
locals {
  kubelet_object_id = try(azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id, null)
}

