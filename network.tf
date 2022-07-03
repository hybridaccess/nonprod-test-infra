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

resource "azurerm_subnet" "isesubnet1" {
  name                 = "isesubnet1"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["172.16.0.0/27"]

  delegation {
    name = "ise"
    service_delegation {
      name = "Microsoft.Logic/integrationServiceEnvironments"
    }
  }
}

resource "azurerm_subnet" "isesubnet2" {
  name                 = "isesubnet1"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["172.16.0.32/27"]
}

resource "azurerm_subnet" "isesubnet3" {
  name                 = "isesubnet1"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["172.16.0.64/27"]
}

resource "azurerm_subnet" "isesubnet4" {
  name                 = "isesubnet1"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["172.16.0.96/27"]
}
