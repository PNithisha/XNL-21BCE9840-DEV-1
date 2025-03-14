provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "multi-cloud-aks"
  location            = "East US"
  resource_group_name = "k8s-resource-group"
  dns_prefix          = "multicloud"

  default_node_pool {
    name       = "default"
    node_count = 2
  }

  identity {
    type = "SystemAssigned"
  }
}
