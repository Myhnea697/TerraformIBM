resource "azurerm_virtual_network" "virtualNetwork" {
  name                = "virtualNetwork-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subNetwork" {
  name                 = "subNetwork"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtualNetwork.name
  address_prefixes     = ["10.0.3.0/24"]
}

