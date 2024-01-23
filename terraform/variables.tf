variable "resouce_group_location" {
  default = "Germany West Central"
  description = "The location of the Resource Group."
}
variable "resource_group_name" {
  default = "myTFResourceGroup"
  description = "The name of the Resource Group."
}
variable "namespace_name" {
  default = "testns22"
  description = "The name of the Azure ServiceBus Namespace."
}
variable "queue_name" {
  default = "queue1"
  description = "The name of the ServiceBus Queue."
}
# Optional: Dead Letter Queue
variable "dead_lettering_enabled" {
  default = false
  description = "Whether or not this queue has dead letter support when a message expires."
}
# Optional: Monitoring
variable "action_group_name" {
  default = "action-group-0"
  description = "The name of the Action Group"
}
variable "action_group_short_name" {
default = "p0action"
description = "The short name of the Action Group."
}
variable "alert_message_threshold" {
  default = 10
  description = "The threshold of total messages which triggers an alert."
}
variable "alert_name" {
  default = "alert1"
  description = "The name of the alert."
}
