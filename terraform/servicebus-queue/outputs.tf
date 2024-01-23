output "queue_id" {
  value = azurerm_servicebus_queue.queue.id
  description = "The ID of the created ServiceBus Queue."
}
