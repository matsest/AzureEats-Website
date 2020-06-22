terraform {
  required_version = "~> 0.12.23"
  required_providers {
    azurerm = "~> 2.15"
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatesamats"
    container_name       = "hashiconf2020"
    key                  = "challenge-1.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
