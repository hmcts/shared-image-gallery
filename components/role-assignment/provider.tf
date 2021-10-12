provider "azuread" {
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}

provider "azurerm" {
  alias           = "dts-management-prod-intsvc"
  subscription_id = "2b1afc19-5ca9-4796-a56f-574a58670244"
  features {}
  skip_provider_registration = "true"
}