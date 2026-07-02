# Cluster AKS (Kubernetes gestionado en Azure)
# sku_tier = "Free" obligatorio para cuenta estudiante
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-casopractico2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akscp2marco"
  sku_tier            = "Free"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = { environment = "casopractico2" }
}

# Rol AcrPull: permite al kubelet del AKS hacer pull del ACR privado
# IMPORTANTE: va al kubelet_identity, NO al plano de control
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}
