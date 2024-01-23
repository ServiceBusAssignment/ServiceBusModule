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
