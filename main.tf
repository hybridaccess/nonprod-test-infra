resource "azurerm_resource_group" "this" {
  location = var.location
  name     = "${var.name}-rg"

  tags = {
    dept = "IT"
  }
}

module "cassandra" {
  source                 = "github.com/hybridaccess/tf-module-infra.git?ref=setup"
  environment            = var.environment
  azurerm_resource_group = azurerm_resource_group.this.name
  frontend_ip            = var.frontend_ip
  name                   = var.cassandra_cluster_name
  location               = var.location
  cassandra_vnet_id      = data.azurerm_virtual_network.nonprod.id
  cassandra_subnet_id    = data.azurerm_subnet.nonprod.id
  cassandra_node_sku     = var.cassandra_node_sku
}


