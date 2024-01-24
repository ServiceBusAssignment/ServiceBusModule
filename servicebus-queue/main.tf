resource "azurerm_servicebus_queue" "queue" {
  name         = var.queue_name
  namespace_id = var.namespace_id
  dead_lettering_on_message_expiration = var.dead_lettering_enabled
}
