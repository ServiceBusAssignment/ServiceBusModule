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
