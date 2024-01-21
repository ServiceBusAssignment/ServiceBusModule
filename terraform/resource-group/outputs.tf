output "resource_group_location" {
  value = azurerm_resource_group.rm.location
  description = "The location of the Resource Group"
}
output "resource_group_name" {
  value = azurerm_resource_group.rm.name
  description = "The name of the Resource Group"
}

