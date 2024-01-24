resource "azurerm_monitor_metric_alert" "metric-alert" {
  name                = var.alert_name
  resource_group_name = var.resource_group_name
  scopes              = [var.namespace_id]

  criteria {
    aggregation      = var.aggregation
    metric_name      = var.metric_name
    metric_namespace = var.metric_namespace
    operator         = var.operator
    threshold        = var.message_threshold

    dimension {
      name     = var.dimension_name
      operator = var.dimension_operator
      values   = var.dimension_values
    }
  }

  action {
    action_group_id = var.action_group_id
  }
}
