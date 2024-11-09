provider "azurerm" {
  features {}
}

# Declare Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "bharathrg"                # Choose a unique name for your resource group
  location = "Central US"               # Choose an appropriate region (ensure it supports PostgreSQL Flexible Server)
}

# Create PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "flexible_server" {
  name                   = "flexibleserver"                   # Choose a unique name for your server
  resource_group_name    = azurerm_resource_group.rg.name     # Reference to the resource group
  location               = azurerm_resource_group.rg.location # Reference to the location of the resource group
  administrator_login    = "citus"                            # Admin login name
  administrator_password = "bharath@123"                      # Admin password
  version                = "16"                               # PostgreSQL version
  sku_name               = "GP_Standard_D2s_v3"               # Choose appropriate SKU
  storage_mb             = 32768                              # Storage size in MB

  public_network_access_enabled = true  # Set to false if you don't want public access

  tags = {
    Environment = "Development"          # Add tags as needed
  }
}

# Create PostgreSQL Database in Flexible Server
resource "azurerm_postgresql_flexible_server_database" "postgracedatabase" {
  name       = "postgracedb"                                      # Database name
  server_id  = azurerm_postgresql_flexible_server.flexible_server.id  # Reference to the PostgreSQL server
}
