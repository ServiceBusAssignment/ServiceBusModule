resource "azurerm_monitor_action_group" "monitor-action-group" {
  name                = "MessageAlertsAction"
  resource_group_name = var.resource_group_name
  short_name          = var.short_name
}
