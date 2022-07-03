resource "azurerm_resource_group" "this" {
  location = var.location
  name     = "${var.name}-rg"

  tags = {
    dept = "IT Dept"
  }
}

module "cassandra" {
  source                 = "github.com/hybridaccess/tf-module-infra.git?ref=master"
  environment            = var.environment
  azurerm_resource_group = azurerm_resource_group.this.name
  frontend_ip            = var.frontend_ip
  name                   = var.cassandra_cluster_name
  location               = var.location
  cassandra_vnet_id      = azurerm_virtual_network.this.id
  cassandra_subnet_id    = azurerm_subnet.this.id
  cassandra_node_sku     = var.cassandra_node_sku
}

module "ise" {
  source              = "github.com/hybridaccess/tf-module-azure-ise.git?ref=master"
  resource_group_name = azurerm_resource_group.this.name
  name                = "hax-ise"
  location            = var.location
  virtual_network_subnet_ids = [
    azurerm_subnet.isesubnet1.id,
    azurerm_subnet.isesubnet2.id,
    azurerm_subnet.isesubnet3.id,
    azurerm_subnet.isesubnet4.id
  ]
}

