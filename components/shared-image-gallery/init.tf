terraform {
  required_version = ">= 1.0.0"
  backend "azurerm" {}
  required_providers {
    azurerm = "~> 5.5.0"
  }
}
