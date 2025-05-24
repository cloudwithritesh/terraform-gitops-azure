# Terraform module for Azure Resource Group, VNET, and Subnet

module "network" {
  source = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}
