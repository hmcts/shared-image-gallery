data "azurerm_subscription" "subscription" {
  provider = azurerm.dts-management-prod-intsvc
}

data "azuread_service_principal" "jenkins-mi" {
  for_each     = toset(var.jenkins-mi)
  display_name = each.key
}

resource "azurerm_role_assignment" "jenkins-mi" {
  for_each             = toset(var.jenkins-mi)
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = "Reader"
  principal_id         = data.azuread_service_principal.jenkins-mi[each.key].id
}