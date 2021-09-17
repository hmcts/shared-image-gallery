resource "azurerm_shared_image_gallery" "image_gallery" {
  name                = var.image_gallery_name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location

  tags = module.ctags.common_tags
}

resource "azurerm_shared_image" "bastion-packer" {
  name                = "bastion-packer"
  gallery_name        = azurerm_shared_image_gallery.image_gallery.name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location
  os_type             = "Linux"

  identifier {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
  }
}