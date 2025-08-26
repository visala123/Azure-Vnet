variable "assignments" {
description = <<EOT
List of role assignments.
Each object requires:
- scope                (resource ID to assign role on)
- role_definition_name (e.g., "AcrPull", "Network Contributor", "Virtual Machine Administrator Login")
- principal_id         (AAD object ID of user/SP/identity)
Optional:
- condition
- condition_version
- skip_sp_check
EOT

  type = list(object({
    scope                = string
    role_definition_name = string
    principal_id         = list(string)
    condition            = optional(string)
    condition_version    = optional(string)
    skip_sp_check        = optional(bool)
  }))
}