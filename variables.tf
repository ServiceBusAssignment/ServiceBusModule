# Resource Group
variable "resouce_group_location" {
  default = "Germany West Central"
  description = "The location of the Resource Group."
}
variable "resource_group_name" {
  default = "myTFResourceGroup"
  description = "The name of the Resource Group."
}
# ServiceBus Namespace
variable "namespace_name" {
  default = "testns22"
  description = "The name of the Azure ServiceBus Namespace."
}
variable "namespace_sku" {
  default = "Standard"
  description = "The Stock Keeping Unit Tier of the ServiceBus Namespace."
}
# ServiceBus Queue
variable "queue_names" {
  default = ["queue1", "queue2"]
  description = "List of names of the ServiceBus Queues."
  type = list(string)
}
# Dead Letter Queue
variable "dead_lettering_enabled" {
  default = {
    "queue1" = false
    "queue2" = true
  }
  description = "Map to describe which queue has dead letter support when a message expires. Correlates with queue_names."
  type = map(bool)
}
# Action Group
variable "action_group_name" {
  default = "action-group-0"
  description = "The name of the Action Group"
}
variable "action_group_short_name" {
default = "p0action"
description = "The short name of the Action Group."
}
# Alert
variable "alert_message_threshold" {
  default = 10
  description = "The threshold of total messages which triggers an alert."
}
variable "alert_name" {
  default = "alert1"
  description = "The name of the alert."
}
# Metric for above alert
variable "metric_name" {
  default = "Messages"
  description = "The name of the metric."
}
variable "metric_aggregation" {
  default = "Average"
  description = "The aggregation type of the metric."
}
variable "metric_namespace" {
  default = "Microsoft.ServiceBus/Namespaces"
  description = "The namespace of the metric."
}
variable "metric_operator" {
  default = "GreaterThan"
  description = "The operator applied to the threshold to trigger an alert."
}
