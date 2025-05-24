terraform {
  backend "azurerm" {
    resource_group_name  = "<storage_resource_group>"
    storage_account_name = "<storage_account_name>"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
  # No explicit oidc attribute needed. OIDC is handled automatically in GitHub Actions with federated credentials.
}