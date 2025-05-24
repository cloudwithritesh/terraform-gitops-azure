terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatefuturecloud2405"
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