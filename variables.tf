variable "environment" {
  description = "Which environment"
  type        = string
  default     = "nonprod"
}

variable "cassandra_node_sku" {
  description = "Cassandra cluster node sku"
  type        = string
  default     = "Standard_D8s_v4"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "name" {
  type    = string
  default = "cassandra"
}

variable "frontend_ip" {
  type    = string
  default = "10.1.0.100"
}


variable "cassandra_vnet_id" {
  description = "Cassandra vnet id"
  type        = any
  default     = ""
}

variable "cassandra_subnet_id" {
  description = "Cassandra subnet id"
  type        = any
  default     = ""
}

variable "cassandra_cluster_name" {
  description = "Cassandra cluster name"
  type        = string
  default     = "cassandra-cl"
}

variable "cassandra_enabled" {
  description = "Enable Cassandra for specific stages."
  type        = bool
  default     = false
}

variable "cassandra_lb_frontend_ip" {
  description = "Static private IP address of load balancer frontend IP address"
  type        = string
  default     = ""
}

variable "cassandra_external_seed_nodes" {
  description = "List of IP address of seed nodes from existing cluster to be added to this cluster"
  type        = list(string)
  default     = []
}

variable "cassandra_enable_hybrid_cluster" {
  description = "Determines whether the managed cluster will be updated with seed nodes IP addresses and gossip Certificates from the existing cluster"
  type        = bool
  default     = false
}
