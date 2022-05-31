# Resource Group
resource "azurerm_resource_group" "aks_resource_group"{
    name        = lower(var.resource_group_name)
    location    = lower(var.resource_group_location)
}

data "azuread_group" "aks_administrators" {
    display_name      = "Mediawiki_Non-Prod Owners"
    security_enabled  = true
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
    name                = lower(var.aks_cluster_name)
    location            = azurerm_resource_group.aks_resource_group.location
    resource_group_name = azurerm_resource_group.aks_resource_group.name
    dns_prefix          = lower(var.aks_cluster_dns_prefix)

    default_node_pool {
      name            = "default"
      node_count      = 2
      vm_size         = "Standard_D2_v2"
      os_disk_size_gb = 30
    }

  # Identity (System Assigned or Service Principal)
  identity {
    type              = "SystemAssigned"
  }

# RBAC and Azure AD Integration Block
  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed                 = true
      admin_group_object_ids  = [data.azuread_group.aks_administrators.id]
    }
  }
  tags = local.tags
}