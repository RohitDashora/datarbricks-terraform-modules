# Configure the Azure provider
provider "azurerm" {
  version = "~>2.0"
}

# Create a resource group for the Databricks workspace
resource "azurerm_resource_group" "databricks" {
  name     = "databricks-rg"
  location = "eastus"
}

# Create a storage account for the Databricks workspace
resource "azurerm_storage_account" "databricks" {
  name                     = "databricksstorageaccount"
  resource_group_name      = azurerm_resource_group.databricks.name
  location                 = azurerm_resource_group.databricks.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create a virtual network for the Databricks workspace
resource "azurerm_virtual_network" "databricks" {
  name                = "databricks-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.databricks.location
  resource_group_name = azurerm_resource_group.databricks.name
}

# Create a subnet for the Databricks workspace
resource "azurerm_subnet" "databricks" {
  name                 = "databricks-subnet"
  resource_group_name  = azurerm_resource_group.databricks.name
  virtual_network_name = azurerm_virtual_network.databricks.name
  address_prefix       = "10.0.1.0/24"
}

# Create a Databricks workspace
resource "azurerm_databricks_workspace" "databricks" {
  name                = "databricks-workspace"
  location            = azurerm_resource_group.databricks.location
  resource_group_name = azurerm_resource_group.databricks.name
  sku_name            = "standard"

  storage_account {
    name     = azurerm_storage_account.databricks.name
    access_key = azurerm_storage_account.databricks.primary_access_key
    is_default = true
  }

  network {
    subnet_id = azurerm_subnet.databricks.id
  }
}
