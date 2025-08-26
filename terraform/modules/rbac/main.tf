resource "azurerm_role_assignment" "this" {
  for_each = {
    for idx, assignment in var.assignments :
    "${assignment.role_definition_name}-${assignment.principal_id}-${idx}" => assignment
  }

  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.principal_id

  condition             = try(each.value.condition, null)
  condition_version     = try(each.value.condition_version, null)
  skip_service_principal_aad_check = try(each.value.skip_sp_check, false)
}

