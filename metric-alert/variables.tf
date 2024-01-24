variable "resource_group_name" {
  description = "The name of the Resource Group Name."
}
variable "alert_name" {
  description = "The name of the alert."
}
variable "namespace_id" {
  description = "The ID of the monitored queue."
}
variable "message_threshold" {
  description = "The threshold of total messages which triggers an alert."
}
variable "action_group_id" {
  description = "The ID of the Action Group associated with the alert."
}
variable "metric_name" {
  description = "The name of the metric."
}
variable "aggregation" {
  description = "The aggregation type of the metric."
}
variable "metric_namespace" {
  description = "The namespace of the metric."
}
variable "operator" {
  description = "The operator applied to the threshold to trigger an alert."
}
variable "dimension_name" {
  description = "The dimension name."
}
variable "dimension_operator" {
  description = "The operator applied to the dimension."
}
variable "dimension_values" {
  description = "A list describing the dimension values."
  type        = list(string)
}
