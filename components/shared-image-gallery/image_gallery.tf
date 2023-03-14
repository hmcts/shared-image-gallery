resource "azurerm_shared_image_gallery" "image_gallery" {
  name                = var.image_gallery_name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location

  tags = module.ctags.common_tags
}

resource "azurerm_shared_image" "shared_image" {
  for_each            = var.images
  name                = each.key
  gallery_name        = azurerm_shared_image_gallery.image_gallery.name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location
  os_type             = "Linux"
  hyper_v_generation  = each.value.vm_generation

  identifier {
    publisher = "hmcts"
    offer     = each.key
    sku       = each.value.sku
  }
}

resource "azurerm_managed_disk" "managed_disk" {
  for_each             = var.images
  name                 = "${each.key}-disk"
  location             = azurerm_resource_group.image_gallery_rg.location
  resource_group_name  = azurerm_resource_group.image_gallery_rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
}

resource "azurerm_snapshot" "snapshot" {
  for_each            = var.images
  name                = "${each.key}-snapshot"
  location            = azurerm_resource_group.image_gallery_rg.location
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  create_option       = "Copy"
  source_uri          = azurerm_managed_disk.managed_disk[each.key].id
}

resource "azurerm_shared_image_version" "image_version" {
  for_each            = var.images
  name                = "1.0.0"
  gallery_name        = azurerm_shared_image_gallery.image_gallery.name
  image_name          = azurerm_shared_image.shared_image[each.key].name
  resource_group_name = azurerm_resource_group.image_gallery_rg.name
  location            = azurerm_resource_group.image_gallery_rg.location
  os_disk_snapshot_id = azurerm_snapshot.snapshot[each.key].id

  target_region {
    name                   = azurerm_resource_group.image_gallery_rg.location
    regional_replica_count = 1
  }
}