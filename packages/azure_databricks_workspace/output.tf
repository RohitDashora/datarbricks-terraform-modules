# The ID of the Databricks workspace
output "databricks_workspace_id" {
  value = azurerm_databricks_workspace.databricks.id
}

# The URL of the Databricks workspace
output "databricks_workspace_url" {
  value = azurerm_databricks_workspace.databricks.workspace_url
}

# The primary key of the Databricks workspace
output "databricks_workspace_primary_key" {
  value = azurerm_databricks_workspace.databricks.primary_key
}

# The secondary key of the Databricks workspace
output "databricks_workspace_secondary_key" {
  value = azurerm_databricks_workspace.databricks.secondary_key
}
