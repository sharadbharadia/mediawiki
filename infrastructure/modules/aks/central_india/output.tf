# Resource Group Outputs
output "location" {
  value = azurerm_resource_group.aks_resource_group.location
}

output "resource_group_id" {
  value = azurerm_resource_group.aks_resource_group.id
}

output "resource_group_name" {
  value = azurerm_resource_group.aks_resource_group.name
}

# Azure AKS Outputs
output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}