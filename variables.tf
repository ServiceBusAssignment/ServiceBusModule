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
# ServiceBus Queue
variable "queue_names" {
  default     = ["queue1"]
  description = "List of names of the ServiceBus Queues."
  type        = list(string)
}
# Dead Letter Queue
variable "dead_lettering_enabled" {
  default = {
    "queue1" = false
    "queue2" = true
  }
  description = "Map to describe which queue has dead letter support when a message expires. Correlates with queue_names."
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
    alert_name = string
    metric_name = string
    threshold   = number
    queue_name_list  = list(string)
  }))
  default = {
    rule1 = {
      alert_name = "testAlert"
      metric_name = "Messages"
      threshold   = 10
      queue_name_list  = ["queue1"]
    },
  }
}
variable "dimension_name" {
  default     = "EntityName"
  description = "The dimension name."
}
variable "dimension_operator" {
  default     = "Include"
  description = "The operator applied to the dimension."
}
variable "dimension_values" {
  default     = ["queue2"]
  description = "A list describing the dimension values."
  type        = list(string)
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
