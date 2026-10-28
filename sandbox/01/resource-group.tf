resource "azurerm_resource_group" "rg" {
    count = var.managed_mode ? 1 : 0
    name = var.resource_group_name
    location = var.location
}

data "azurerm_resource_group" "rg" {
    count = var.managed_mode ? 0 : 1
    name = var.resource_group_name
}