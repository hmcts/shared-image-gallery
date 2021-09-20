resource "azurerm_shared_image_gallery" "image_gallery" {
  name                = var.image_gallery_name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location

  tags = module.ctags.common_tags
}

resource "azurerm_shared_image" "bastion-ubuntu" {
  name                = var.image_name
  gallery_name        = azurerm_shared_image_gallery.image_gallery.name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location
  os_type             = "Linux"

  identifier {
    publisher = "hmcts"
    offer     = var.image_name
    sku       = "18.04-LTS"
  }
}

data "azurerm_image" "bastion-ubuntu" {
  name                = var.image_name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
}

data "azurerm_shared_image" "bastion-ubuntu" {
  name                = var.image_name
  gallery_name        = azurerm_shared_image_gallery.image_gallery.name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
}

resource "azurerm_shared_image_version" "image_version" {
  name                = "1.0.0"
  gallery_name        = azurerm_shared_image_gallery.image_gallery.name
  image_name          = data.azurerm_shared_image.bastion-ubuntu.name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location
  managed_image_id    = data.azurerm_image.bastion-ubuntu.id

  target_region {
    name                   = azurerm_resource_group.image_gallery_rg.location
    regional_replica_count = 2
  }
}