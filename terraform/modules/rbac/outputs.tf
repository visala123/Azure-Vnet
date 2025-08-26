output "role_assignment_ids" {
  description = "List of all role assignment resource IDs"
  value       = [for ra in azurerm_role_assignment.this : ra.id]
}