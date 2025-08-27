# General / Environment
location = "eastus"

tags = {
  environment = "prod"
  }
  
  # AKS Cluster
aks_dns_prefix     = "aksdev"
kubernetes_version = "1.32"      # pick a supported version in your region
private_cluster_enable = true
network_plugin     = "azure"
service_cidr       = "10.20.0.0/24"
dns_service_ip     = "10.20.0.30"
outbound_type      = "loadBalancer"
managed_outbound_ip_count = 1

# System Node Pool (#systempool)
system_node_count     = 1
system_vm_size        = "Standard_B2s"
nodepool_identity_type     = "SystemAssigned"
nodepool_os_disk_size_gb   = 128
nodepool_type              = "VirtualMachineScaleSets"

# User Node Pool (#userpool)
user_node_count        = 1
user_vm_size           = "Standard_B2s"
nodepool_mode          = "User"
nodepool_labels        = {
  purpose = "user"
}
nodepool_taints        = [
  "sku=user:NoSchedule"
]

# Azure Monitor / Log Analytics
enable_azure_monitor         = true
log_analytics_sku            = "PerGB2018"
log_analytics_retention_days = 30

# Optional / Network
grant_network_contributor_on_subnet = true