variable "name"                { type = string }
variable "location"            { type = string }
variable "resource_group_name" { type = string }
variable "subnet_id"           { type = string }
variable "vm_size"             { type = string }
variable "admin_username"      { type = string }
variable "ssh_public_key"      { type = string } # pass the *public key content*
variable "tags" {
  type    = map(string)
  default = {}
}
