resource "azurerm_storage_account" "devopsb25str001" {
  name                     = var.storageaccountname
  resource_group_name      = azurerm_resource_group.prod-rg1.name
  location                 = azurerm_resource_group.prod-rg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.environment
  }
}
