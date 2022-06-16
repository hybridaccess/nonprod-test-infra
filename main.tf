resource "azurerm_resource_group" "this" {
  location = var.location
  name     = "${var.name}-rg"

  tags = {
    dept = "IT"
  }
}

module "cassandra" {
  source                 = "github.com/hybridaccess/tf-module-cassandra.git?ref=master"
  environment            = var.environment
  azurerm_resource_group = data.azurerm_resource_group
  lb_frontend_ip         = var.frontend_ip
  name                   = var.cassandra_cluster_name
  location               = var.location
  cassandra_vnet_id      = data.azurerm_virtual_network.nonprod.id
  cassandra_subnet_id    = data.azurerm_subnet.nonprod.id
  node_sku               = var.cassandra_node_sku
}


