module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  builtFrom   = var.builtFrom
}

resource "azurerm_resource_group" "image_gallery_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = module.ctags.common_tags
}