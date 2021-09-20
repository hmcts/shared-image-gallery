resource "azurerm_shared_image_gallery" "image_gallery" {
  name                = var.image_gallery_name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location

  tags = module.ctags.common_tags
}

resource "azurerm_shared_image" "bastion-ubuntu" {
  name                = "bastion-ubuntu"
  gallery_name        = azurerm_shared_image_gallery.image_gallery.name
  resource_group_name = "bastion-packer"
  location            = azurerm_resource_group.image_gallery_rg.location
  os_type             = "Linux"

  identifier {
    publisher = "hmcts"
    offer     = "bastion-ubuntu"
    sku       = "18.04-LTS"
  }
}