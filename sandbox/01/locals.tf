locals {
    resource_group = var.managed_mode ? (
        azurerm_resource_group.rg[0]
    ) : (
        data.azurerm_resource_group.rg[0]
    )
}