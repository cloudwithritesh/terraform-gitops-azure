variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
  default     = "tfazrg1"
}

variable "location" {
  description = "Azure region for resources."
  type        = string
  default     = "southeast asia"
}

variable "vnet_name" {
  description = "Name of the Virtual Network."
  type        = string
  default     = "hubvnet1"
}

variable "subnet_name" {
  description = "Name of the Subnet."
  type        = string
  default     = "hubsubnet1"
}

variable "address_space" {
  description = "Address space for the Virtual Network."
  type        = string
  default     = "192.168.1.0/16"
}

variable "subnet_prefix" {
  description = "Address prefix for the Subnet."
  type        = string
  default     = "192.168.1.0/24"
}
