terraform {
  required_version = "~> 0.12.23"
  required_providers {
    azurerm = "~> 2.15"
  }
}

provider "azurerm" {
  features {}
}
