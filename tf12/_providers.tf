provider "azuread" {
  # version         = "0.3.1"
  tenant_id       = "TENANT"
  subscription_id = "SUB"
}

provider "azurerm" {
  # version         = "1.21"
  tenant_id       = "TENANT"
  subscription_id = "SUB" 

  skip_provider_registration = true
}

