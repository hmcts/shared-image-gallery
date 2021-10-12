provider "azuread" {
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}