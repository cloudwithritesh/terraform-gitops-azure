module "storage_account" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "0.10.0"

  name      = var.name
  location  = var.location
  parent_id = var.parent_id
  tags      = var.tags

  account_sku_name           = var.account_sku_name
  enable_telemetry           = false
  https_traffic_only_enabled = true
  shared_access_key_enabled  = false
}