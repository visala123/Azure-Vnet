variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "subnet_id" { type = string }
variable "vm_size" { type = string }
variable "admin_username" { type = string }
variable "ssh_public_key" { type = string }

variable "os_disk_caching" { 
  type = string 
 default = "ReadWrite"
  }
variable "os_disk_storage_account_type" { 
  type = string
    default = "Standard_LRS"
     }

variable "image_publisher" { 
  type = string
 default = "Canonical" 
 }
variable "image_offer" { 
  type = string
 default = "0001-com-ubuntu-server-jammy"
  }
variable "image_sku" {
  type = string
 default = "22_04-lts"
  }
variable "image_version" { 
  type = string
   default = "latest" 
   }

variable "public_ip_sku" {
   type = string
 default = "Standard"
  }
variable "public_ip_allocation_method" { 
  type = string
 default = "Static"
  }
variable "nic_private_ip_allocation" { 
  type = string
 default = "Dynamic" 
 }

variable "tags" {
  type = map(string)
 default = {} 
 }