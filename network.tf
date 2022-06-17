resource "azurerm_virtual_network" "this" {
  address_space       = ["172.16.0.0/16"]
  location            = azurerm_resource_group.this.location
  name                = "${var.name}-vnet"
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  name                 = "${var.name}-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["172.16.1.0/24"]
}