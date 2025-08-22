output "public_key" {
  value = azurerm_ssh_public_key.this.public_key
}

output "public_key_id" {
  value = azurerm_ssh_public_key.this.id
}

output "private_key_path" {
  value = local_file.private_key.filename
}

output "private_key_pem" {
  value     = tls_private_key.this.private_key_pem
  sensitive = true
}
