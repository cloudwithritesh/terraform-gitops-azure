variable "resource_group_id" {
  description = "Resource ID of the resource group that will contain the storage account."
  type        = string
}

variable "location" {
  description = "Azure region for the storage account."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique name of the Azure Storage Account."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the storage account."
  type        = map(string)
  default     = {}
}

# variable "resource_group_name" {
#   description = "Name of the Azure Resource Group."
#   type        = string
#   default     = "tfazrg1"
# }

# variable "location" {
#   description = "Azure region for resources."
#   type        = string
#   default     = "southeast asia"
# }

# variable "vnet_name" {
#   description = "Name of the Virtual Network."
#   type        = string
#   default     = "hubvnet1"
# }

# variable "subnet_name" {
#   description = "Name of the Subnet."
#   type        = string
#   default     = "hubsubnet1"
# }

# variable "address_space" {
#   description = "Address space for the Virtual Network."
#   type        = string
#   default     = "192.168.0.0/16"
# }

# variable "subnet_prefix" {
#   description = "Address prefix for the Subnet."
#   type        = string
#   default     = "192.168.1.0/24"
# }
