data "azurerm_resource_group" "nonprod" {
  name = "nonprod-infra"
}

data "azurerm_virtual_network" "nonprod" {
  name                = "nonprod-vnet"
  resource_group_name = data.azurerm_resource_group.nonprod.name
}

data "azurerm_subnet" "nonprod" {
  name                 = "default"
  resource_group_name  = data.azurerm_resource_group.nonprod.name
  virtual_network_name = data.azurerm_virtual_network.nonprod.name
}