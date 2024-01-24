# Resource Group
variable "resouce_group_location" {
  default     = "Germany West Central"
  description = "The location of the Resource Group."
}
variable "resource_group_name" {
  default     = "myTFResourceGroup"
  description = "The name of the Resource Group."
}
# ServiceBus Namespace
variable "namespace_name" {
  default     = "testns22"
  description = "The name of the Azure ServiceBus Namespace."
}
variable "namespace_sku" {
  default     = "Standard"
  description = "The Stock Keeping Unit Tier of the ServiceBus Namespace."
}
# ServiceBus Queue & Dead Letter Queue
variable "queue_name_and_dlq" {
  default = {
    "queue1" = false
    "queue2" = true
  }
  description = "Map Service Bus Queue names (string) as key and the respective dead_lettering_enabled value (bool) as value."
  type        = map(bool)
}
# Action Group
variable "action_group_name" {
  default     = "action-group-0"
  description = "The name of the Action Group"
}
variable "action_group_short_name" {
  default     = "p0action"
  description = "The short name of the Action Group."
}
# Alert
variable "alert_rule" {
  description = "Map of alert rules. Describes the desired alert name, metric (by name), threshold, and list of queues to monitor."
  type        = map(object({
    alert_name         = string
    metric_name        = string
    threshold          = number
    dimension_operator = string
    queue_name_list    = list(string)
  }))
  default = {
    rule1 = {
      alert_name         = "testAlert"
      metric_name        = "Messages"
      threshold          = 10
      dimension_operator = "Include"
      queue_name_list    = ["queue1"]
    }
    rule2 = {
      alert_name         = "testAlert2"
      metric_name        = "DeadletteredMessages"
      threshold          = 0
      dimension_operator = "Include"
      queue_name_list    = ["queue2"]
    }
  }
}
variable "dimension_name" {
  default     = "EntityName"
  description = "The dimension name."
}
# Metric for above alert
variable "metric_aggregation" {
  default     = "Average"
  description = "The aggregation type of the metric."
}
variable "metric_namespace" {
  default     = "Microsoft.ServiceBus/Namespaces"
  description = "The namespace of the metric."
}
variable "metric_operator" {
  default     = "GreaterThan"
  description = "The operator applied to the threshold to trigger an alert."
}
