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
}

module "servicebus-queue" {
  source = "./servicebus-queue"
  queue_name = var.queue_name
  namespace_id = module.servicebus-namespace.namespace_id
  dead_lettering_enabled = var.dead_lettering_enabled
}


module "action-group" {
  source = "./action-group"
  resource_group_name = module.resource-group.resource_group_name
  action_group_name = var.action_group_name
  short_name = var.action_group_short_name
}

module "metric-alert" {
  source = "./metric-alert"
  action_group_id = module.action-group.action_group_id
  alert_name = var.alert_name
  message_threshold = var.alert_message_threshold
  namespace_id = module.servicebus-namespace.namespace_id
  resource_group_name = module.resource-group.resource_group_name
}
