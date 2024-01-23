variable "queue_name" {
  type = string
  description = "The name of the ServiceBus Queue"
}

variable "namespace_id" {
  type = string
  description = "The ID of the ServiceBus Namespace"
}

variable "dead_lettering_enabled" {
  type = bool
  description = "Whether or not dead letting is enabled on this queue."
}

