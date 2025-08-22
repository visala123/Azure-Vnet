#variable "rg_name"    { type = string }
variable "location"   { type = string }
variable "tags"       { type = map(string) }
#variable "bastion_name"               { type = string }
variable "bastion_vm_size"            { type = string }
variable "bastion_admin_username"     { type = string }

