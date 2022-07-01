terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.11.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.SubscriptionID
  client_id       = var.ClientID
  client_secret   = var.ClientSecret
  tenant_id       = var.TenantID
  
  features {}
}

locals {
  tags ={
    owner   = "wzh"
    project = "terraform_learning"
  }
}

resource "azurerm_resource_group" "resouregroup" {
  name     = "myterraform_rg"
  location = var.Location
  tags =  local.tags
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = var.RGName
  resource_group_name      = azurerm_resource_group.resouregroup.name
  location                 = azurerm_resource_group.resouregroup.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.tags
}