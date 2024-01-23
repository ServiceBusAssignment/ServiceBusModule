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
  source = "../terraform/resource-group"
  resource_group_location = "Germany West Central"
  resource_group_name = "myTFResourceGroup"
}

module "servicebus-namespace" {
  source = "../terraform/servicebus-namespace"
  namespace_name = "namespace-a"
  resource_group_location = module.resource-group.resource_group_location
  resource_group_name = module.resource-group.resource_group_name
}

module "queue-1" {
  source = "../terraform/servicebus-queue"
  dead_lettering_enabled = false
  namespace_id = module.servicebus-namespace.namespace_id
  queue_name = "Queue1"
}

module "queue-2" {
  source = "../terraform/servicebus-queue"
  dead_lettering_enabled = false
  namespace_id = module.servicebus-namespace.namespace_id
  queue_name = "Queue2"
}
