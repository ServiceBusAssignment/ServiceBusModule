output "namespace_id" {
  value = azurerm_servicebus_namespace.ns.id
  description = "The ID of the ServiceBus Namespace."
}
