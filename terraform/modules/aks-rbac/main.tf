resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = var.aks_kubelet_object_id
}

resource "azurerm_role_assignment" "net_contrib" {
  count                = var.grant_network_contributor_on_subnet ? 1 : 0
  scope                = var.subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = var.aks_kubelet_object_id
}
