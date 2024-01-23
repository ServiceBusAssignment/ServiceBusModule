variable "namespace_name" {
  type = string
  description = "The name of the Azure ServiceBus Namespace"
}

variable "queue_name" {
  type = string
  description = "The name of the ServiceBus Queue"
}

variable "dead_lettering_enabled" {
  type = bool
  description = "Whether or not dead letting is enabled on this queue."
}
