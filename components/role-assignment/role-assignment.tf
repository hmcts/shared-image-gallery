data "azurerm_subscription" "subscription" {
  provider = azurerm.dts-management-prod-intsvc
}

data "azuread_service_principal" "cftptl_jenkins" {
  display_name = "jenkins-cftptl-intsvc-mi"
}

resource "azurerm_role_assignment" "cftptl_jenkins" {
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = "Reader"
  principal_id         = data.azuread_service_principal.cftptl_jenkins.id
}

data "azuread_service_principal" "cftsbox_jenkins" {
  display_name = "jenkins-cftsbox-intsvc-mi"
}

resource "azurerm_role_assignment" "cftsbox_jenkins" {
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = "Reader"
  principal_id         = data.azuread_service_principal.cftsbox_jenkins.id
}

data "azuread_service_principal" "sdsptl_jenkins" {
  display_name = "jenkins-ptl-mi"
}

resource "azurerm_role_assignment" "sdsptl_jenkins" {
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = "Reader"
  principal_id         = data.azuread_service_principal.sdsptl_jenkins.id
}