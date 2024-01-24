resource "azurerm_servicebus_namespace" "ns" {
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  name                = var.namespace_name
  sku                 = var.sku
}
