output "id"                 { value = azurerm_kubernetes_cluster.this.id }
output "name"               { value = azurerm_kubernetes_cluster.this.name }
output "kubelet_object_id"  { value = try(azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id, null) }
output "private_fqdn"       { value = azurerm_kubernetes_cluster.this.private_fqdn }
