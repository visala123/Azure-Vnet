output "aks_nsg_id" {
  value = azurerm_network_security_group.aks.id
}
output "bastion_nsg_id" {
  value = azurerm_network_security_group.bastion.id
}
