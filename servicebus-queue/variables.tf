variable "queue_name" {
  description = "The name of the ServiceBus Queue."
}
variable "namespace_id" {
  description = "The ID of the ServiceBus Namespace."
}
variable "dead_lettering_enabled" {
  description = "Whether or not dead letting is enabled on this queue."
}
