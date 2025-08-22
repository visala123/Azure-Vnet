resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_ssh_public_key" "this" {
  name                = var.ssh_key_name
  resource_group_name = var.resource_group_name
  location            = var.location
  public_key          = tls_private_key.this.public_key_openssh
}

resource "local_file" "private_key" {
  content          = tls_private_key.this.private_key_pem
  filename         = "${path.module}/${var.ssh_key_name}.pem"
  file_permission  = "0600"
}
