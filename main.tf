# # Terraform module for Azure Resource Group, VNET, and Subnet

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}

module "spoke1" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = "spoke1-vnet"
  subnet_name         = "spoke1-subnet"
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}

module "spoke2" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = "spoke2-vnet"
  subnet_name         = "spoke2-subnet"
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}

# Creating 3 tier architecture - Web, Application, and Database tiers - http, 
