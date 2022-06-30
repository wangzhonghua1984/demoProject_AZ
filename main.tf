terraform {
  cloud {
    organization = "learn-terraform-jeffstan"
    workspaces {
      name = "demoProject_AZ"
    }
  }
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  version         = "~>2.0"
  subscription_id = var.SubscriptionID
  client_id       = var.ClientID
  client_secret   = var.ClientSecret
  tenant_id       = var.TenantID
}

resource "azurerm_resource_group" "myrg" {
  name     = "demorg"
  location = "East Asia"
  tags = {
    enviroment = "dev"
    source     = "terraform"
  }
}


