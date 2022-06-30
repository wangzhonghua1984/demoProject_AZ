terraform {

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group"  "myrg" {
  name = "demorg"
  location = "East Asia"
  tags = {
  enviroment= "dev"
  source = "terraform"
  }
}