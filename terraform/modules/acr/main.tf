resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
  tags                = var.tags
}

#  network_rule_set {
#     default_action = "Deny"
#     virtual_network_subnet_ids = [var.aks_subnet_id] # use AKS subnet
#   }
