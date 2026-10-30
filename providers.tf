terraform {
  # backend "azurerm" {
  #   resource_group_name  = "tfstate-rg"
  #   storage_account_name = "tfstatefuturecloud2405"
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  # }
  cloud {
    # The name of your HCP Terraform organization
    organization = "your-hcp-org-name"

    # The workspace(s) you want to connect to
    workspaces {
      name = "your-workspace-name"

      # Alternative for multiple dynamic workspaces by prefix:
      # tags = ["prod", "web"]
    }
  }

  #   # ❌ THIS WILL FAIL
  # terraform {
  #   cloud {
  #     organization = var.my_org_name  # Error: Cannot reference named objects
  #     workspaces {
  #       name = local.workspace_name   # Error: Cannot reference named objects
  #     }
  #   }
  # }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
  # No explicit oidc attribute needed. OIDC is handled automatically in GitHub Actions with federated credentials.
}