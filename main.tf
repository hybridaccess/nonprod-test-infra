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


