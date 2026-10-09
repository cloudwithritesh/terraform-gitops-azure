variable "name" {
  description = "Globally unique name of the storage account."
  type        = string
}

variable "location" {
  description = "Azure region where the storage account will be deployed."
  type        = string
}

variable "parent_id" {
  description = "Resource ID of the parent resource group."
  type        = string
}

variable "account_sku_name" {
  description = "Storage account SKU."
  type        = string
  default     = "Standard_LRS"
}

variable "tags" {
  description = "Tags to apply to the storage account."
  type        = map(string)
  default     = {}
}