output "id" {
  description = "Resource ID of the storage account."
  value       = module.storage_account.resource_id
}

output "name" {
  description = "Name of the storage account."
  value       = module.storage_account.name
}