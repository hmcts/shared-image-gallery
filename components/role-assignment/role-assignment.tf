data "azurerm_subscription" "subscription" {
  provider = azurerm.dts-management-prod-intsvc
}

data "azuread_service_principal" "jenkins" {
  for_each     = toset(var.jenkins-mi)
  display_name = each.key
}

resource "azurerm_role_assignment" "jenkins_read" {
  for_each             = toset(var.jenkins_mi)
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = "Reader"
  principal_id         = data.azuread_service_principal.jenkins[each.key].id
}