resource "azurerm_shared_image_gallery" "image_gallery" {
  name                = var.image_gallery_name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location

  tags = var.common_tags
}