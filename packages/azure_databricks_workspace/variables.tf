# The name of the resource group for the Databricks workspace
variable "databricks_resource_group_name" {
  type = string
}

# The location of the resource group for the Databricks workspace
variable "databricks_resource_group_location" {
  type = string
}

# The name of the storage account for the Databricks workspace
variable "databricks_storage_account_name" {
  type = string
}

# The name of the virtual network for the Databricks workspace
variable "databricks_virtual_network_name" {
  type = string
}

# The address space for the virtual network for the Databricks workspace
variable "databricks_virtual_network_address_space" {
  type = list(string)
}

# The name of the subnet for the Databricks workspace
variable "databricks_subnet_name" {
  type = string
}

# The address prefix for the subnet for the Databricks workspace
variable "databricks_subnet_address_prefix" {
  type = string
}

# The name of the Databricks workspace
variable "databricks_workspace_name" {
  type = string
}

# The SKU for the Databricks workspace
variable "databricks_workspace_sku" {
  type = string
}
