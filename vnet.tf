#Creating Virtual networks
resource "azurerm_virtual_network" "eastus-vnet-01" {
name = "eastus-vnet-01"
resource_group_name = azurerm_resource_group.prod-rg1.name
address_space       = ["10.1.0.0/16"]
location            = azurerm_resource_group.prod-rg1.location
}


resource "azurerm_virtual_network" "eastus-vnet-02" {
name = "eastus-vnet-02"
resource_group_name = azurerm_resource_group.prod-rg1.name
address_space       = ["10.2.0.0/16"]
location            = azurerm_resource_group.prod-rg1.location
}

resource "azurerm_virtual_network" "eastus-vnet-03" {
name = "eastus-vnet-03"
resource_group_name = azurerm_resource_group.prod-rg1.name
address_space       = ["10.3.0.0/16"]
location            = azurerm_resource_group.prod-rg1.location
}
