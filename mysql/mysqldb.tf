provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "bharathrg" {
  name     = "bharathrg"
  location = "eastus"
}

resource "azurerm_mysql_flexible_server" "mysqldbnew1" {
  name                   = "mysqldb-flexible-server"
  resource_group_name    = azurerm_resource_group.bharathrg.name
  location               = azurerm_resource_group.bharathrg.location
  administrator_login    = "bharat"
  administrator_password = "bharat@123"
  sku_name               = "B_Standard_B1s"
}

resource "azurerm_mysql_flexible_database" "mysqldbnew" {
  name                = "mysqldb"
  resource_group_name = azurerm_resource_group.bharathrg.name
  server_name         = azurerm_mysql_flexible_server.mysqldbnew1.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
