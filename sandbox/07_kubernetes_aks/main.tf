data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name
  node_resource_group = var.node_resource_group

  default_node_pool {
    name       = "system"
    node_count = var.system_node_count
    vm_size    = "Standard_DS2_v2"
    type       = "VirtualMachineScaleSets"
    # availability_zones  = [1, 2, 3] 
    auto_scaling_enabled = false
  }

  identity {
    type = "SystemAssigned"
  }

  # required in azurerm v5; Manual keeps the node pools defined above
  node_provisioning_profile {
    mode = "Manual"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet" # azure (CNI)
  }
}