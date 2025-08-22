location               = "eastus"
tags = {
  environment = "dev"
  owner       = "platform-team"
}
aks_dns_prefix     = "aksdev"
kubernetes_version = "1.32"     # pick a supported version in your region
network_plugin     = "azure"
service_cidr       = "10.21.0.0/16"
dns_service_ip     = "10.21.0.10"

system_node_count  = 1
system_vm_size     = "Standard_B2s"  # "Standard_DS2_v2"

user_node_count    = 1
user_vm_size       = "Standard_B2s"  #"Standard_DS3_v2"
log_analytics_sku            = "Free"
log_analytics_retention_days = 7
enable_azure_monitor  = true

# Outbound
managed_outbound_ip_count          = 1
grant_network_contributor_on_subnet = true
