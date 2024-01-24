terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "resource-group" {
  source = "./resource-group"
  resource_group_location = var.resouce_group_location
  resource_group_name = var.resource_group_name
}

module "servicebus-namespace" {
  source = "./servicebus-namespace"
  namespace_name = var.namespace_name
  resource_group_name = module.resource-group.resource_group_name
  resource_group_location = module.resource-group.resource_group_location
  sku = var.namespace_sku
}

module "servicebus-queue" {
  source = "./servicebus-queue"
  for_each = var.queue_name_and_dlq

  dead_lettering_enabled = each.value
  queue_name = each.key

  namespace_id = module.servicebus-namespace.namespace_id
}

module "action-group" {
  source = "./action-group"
  resource_group_name = module.resource-group.resource_group_name
  action_group_name = var.action_group_name
  short_name = var.action_group_short_name
}

module "metric-alert" {
  source = "./metric-alert"
  for_each = var.alert_rule

  action_group_id = module.action-group.action_group_id
  alert_name = each.value.alert_name
  message_threshold = each.value.threshold
  namespace_id = module.servicebus-namespace.namespace_id
  resource_group_name = module.resource-group.resource_group_name
  aggregation = var.metric_aggregation
  metric_name = each.value.metric_name
  metric_namespace = var.metric_namespace
  operator = var.metric_operator
  dimension_name = var.dimension_name
  dimension_operator = var.dimension_operator
  dimension_values = each.value.queue_name_list
}
