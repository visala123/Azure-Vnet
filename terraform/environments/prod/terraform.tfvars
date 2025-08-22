rg_name  = "rg-prod-aks"
location = "eastus2"

tags = {
  environment = "prod"
  owner       = "platform-team"
  criticality = "high"
}

# VNet
vnet_name              = "vnet-prod"
vnet_address_space     = ["10.30.0.0/16"]
aks_subnet_name        = "snet-aks"
aks_subnet_prefixes    = ["10.30.1.0/23"] # larger for prod
bastion_subnet_name    = "snet-bastion"
bastion_subnet_prefixes= ["10.30.3.0/24"]

enable_bastion_ssh_inbound = false         # usually false; reach via VPN/allow-list
bastion_ssh_source_ranges  = ["10.0.0.0/8"] # if true, restrict tightly

# ACR
acr_name = "prodacrrevinci" # ensure global uniqueness yourself
acr_sku  = "Standard"

# Log Analytics / Monitor
log_analytics_workspace_name = "law-prod-aks"
log_analytics_sku            = "Standalone"
log_analytics_retention_days = 7
enable_azure_monitor         = true

# Bastion VM
bastion_name                = "vm-bastion-prod"
bastion_vm_size             = "Standard_B2ms"
bastion_admin_username      = "azureuser"
#bastion_ssh_public_key_path = "~/.ssh/id_rsa.pub"

# AKS
aks_name           = "aks-prod"
aks_dns_prefix     = "aksprod"
kubernetes_version = "1.29.7"
network_plugin     = "azure"
service_cidr       = "10.31.0.0/16"
dns_service_ip     = "10.31.0.10"

system_node_count  = 2
system_vm_size     = "Standard_DS2_v2"

user_node_count    = 4
user_vm_size       = "Standard_DS4_v2"

# Outbound
managed_outbound_ip_count          = 2
grant_network_contributor_on_subnet = true
