resource "azurerm_monitor_metric_alert" "metric-alert" {
  name                = var.alert_name
  resource_group_name = var.resource_group_name
  scopes              = [var.namespace_id]

  criteria {
    aggregation      = "Average"
    metric_name      = "Messages"
    metric_namespace = "Microsoft.ServiceBus/Namespaces"
    operator         = "GreaterThan"
    threshold        = var.message_threshold
  }

  action {
    action_group_id = var.action_group_id
  }
}
