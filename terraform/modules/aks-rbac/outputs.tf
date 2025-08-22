output "acr_role_assignment_id" {
  description = "ID of the ACR Pull role assignment"
  value       = try(azurerm_role_assignment.acr_pull.id, null)
}

output "subnet_role_assignment_id" {
  description = "Role assignment ID for Network Contributor on the subnet"
  value       = try(azurerm_role_assignment.net_contrib[0].id, null)
}

# output "subnet_role_assignment_id" {
#   description = "ID of the Network Contributor role assignment"
#   value       = try(azurerm_role_assignment.net_contrib.id, null)
# }
