variable "location" { type = string }
variable "tags" { type = map(string) }

variable "bastion_vm_size" { type = string }
variable "bastion_admin_username" { type = string }

variable "os_disk_caching" { type = string }
variable "os_disk_storage_account_type" { type = string }

variable "image_publisher" { type = string }
variable "image_offer" { type = string }
variable "image_sku" { type = string }
variable "image_version" { type = string }

variable "public_ip_sku" { type = string }
variable "public_ip_allocation_method" { type = string }
variable "nic_private_ip_allocation" { type = string }