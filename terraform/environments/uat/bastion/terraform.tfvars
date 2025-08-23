location = "eastus"

tags = {
  environment = "uat"
 }

bastion_vm_size        = "Standard_B2s"
bastion_admin_username = "azureuser"

os_disk_caching              = "ReadWrite"
os_disk_storage_account_type = "Standard_LRS"

image_publisher = "Canonical"
image_offer     = "0001-com-ubuntu-server-jammy"
image_sku       = "22_04-lts"
image_version   = "latest"

public_ip_sku             = "Standard"
public_ip_allocation_method = "Static"
nic_private_ip_allocation   = "Dynamic"