#Creating Azure RG
resource "azurerm_resource_group" "prod-rg1" {
  name     = "prod-rg1"
  location = "eastus"
}
