# 🚀 Automating Azure Infrastructure Deployment with Terraform, GitHub Actions & OIDC

## 📋 Agenda

- Introduction to Infrastructure as Code (IaC)
- Terraform Overview
- GitHub Actions CI/CD
- OIDC Authentication with Azure
- Putting It All Together: Workflow Demo
- Best Practices
- Q&A

---

## 🌍 What is Infrastructure as Code (IaC)?

- **IaC** allows you to manage and provision infrastructure using code.
- **Benefits**:
  - Repeatable deployments
  - Scalable environments
  - Version-controlled infrastructure
- **Popular Tools**: Terraform, Bicep, Pulumi
- **Why Terraform?**
  - Cloud-agnostic
  - Mature ecosystem
  - Declarative configuration language (HCL)

---

## 🔧 Terraform Overview

- **Key Concepts**:
  - Providers, Resources, Variables, Outputs, Modules
- **Execution Flow**:
  1. `terraform init`
  2. `terraform plan`
  3. `terraform apply`
- **Azure Provider Example**:

  ```hcl
  provider "azurerm" {
    features {}
  }

  resource "azurerm_resource_group" "example" {
    name     = "example-resources"
    location = "East US"
  }
  ```

---

## ☁️ Setting Up Terraform for Azure

- Authenticate using Azure CLI: `az login`
- Use remote backend:
  - Azure Storage Account
  - Supports state locking and history
- Organize resources with modules and environments

---

## ⚙️ GitHub Actions Overview

- CI/CD platform natively integrated with GitHub
- **Key Components:**
  - Workflow: YAML file triggered on events
  - Job: Set of steps
  - Step: Single task (run or action)
  - Runner: Host that runs the workflow
- Reusable via GitHub Marketplace

---

## 🔐 Why Use OIDC for Azure Auth?

- **Problem:** Secrets can leak; token rotation is painful
- **Solution:** OpenID Connect (OIDC) provides short-lived tokens without secrets
- **Benefits:**
  - Zero secrets in GitHub
  - Improved security posture
  - Easy to set up federated trust with Azure

---

## 🔄 OIDC Flow: GitHub → Azure

1. GitHub Action triggers → requests OIDC token
2. GitHub's OIDC provider issues JWT
3. Azure verifies identity and trust
4. Token exchanged for Azure AD access token

---

## 🛠️ Configuring Azure for OIDC

**Step 1:** Register App or Use Managed Identity  
**Step 2:** Create Federated Credential

```azurecli
az ad app federated-credential create --id <app-id> \
  --parameters '{
    "name": "github-oidc",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:<owner>/<repo>:ref:refs/heads/main",
    "description": "OIDC Trust for GitHub"
  }'
```

**Step 3:** Assign Required Roles

```azurecli
az role assignment create \
  --assignee-object-id <object-id> \
  --role Contributor \
  --scope /subscriptions/<sub-id>/resourceGroups/<rg>
```

---

## 🧪 GitHub Actions Workflow Example

```yaml
name: Terraform Deploy

permissions:
  id-token: write
  contents: read

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Azure Login with OIDC
        uses: azure/login@v1
        with:
          client-id: ${{ secrets.AZURE_CLIENT_ID }}
          tenant-id: ${{ secrets.AZURE_TENANT_ID }}
          subscription-id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}

      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan

      - name: Terraform Apply
        run: terraform apply -auto-approve
```

---

## 🏗️ Reference Architecture

```plain
GitHub Actions --> OIDC Token --> Azure Federated Credential --> Terraform --> Azure Infrastructure
```
- GitHub authenticates with OIDC → Azure
- Terraform uses short-lived token to deploy
- Secure CI/CD with no secrets

---

## 💡 Best Practices

- Use remote backend with state locking
- Enable role-based access control (RBAC)
- Create separate environments: dev, staging, prod
- Use `terraform validate`, `tflint`, `checkov`
- Use GitHub environments & approval gates

---

## 🧪 Live Demo (Optional)

- Demo GitHub workflow in action
- Deploys:
  - Azure Resource Group
  - Storage Account
- Validate deployed resources via Azure Portal or CLI