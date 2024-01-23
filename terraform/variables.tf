variable "namespace_name" {
  default = "testns22"
  description = "The name of the Azure ServiceBus Namespace."
}
variable "queue_name" {
  default = "queue1"
  description = "The name of the ServiceBus Queue."
}
// Optional: Dead Letter Queue
variable "dead_lettering_enabled" {
  default = false
  description = "Whether or not dead letting is enabled on this queue."
}
// Optional: Monitoring
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
