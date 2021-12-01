resource "databricks_mws_workspaces" "mws_workspace" {
  account_id                               = var.account_id
  managed_services_customer_managed_key_id = var.managed_services_customer_managed_key_id
  deployment_name                          = var.deployment_name
  workspace_name                           = var.workspace_name
  aws_region                               = var.aws_region
  storage_configuration_id                 = var.storage_configuration_id
  private_access_settings_id               = var.private_access_settings_id
  network_id                               = var.network_id
  credentials_id                           = var.credentials_id
  storage_customer_managed_key_id          = var.storage_customer_managed_key_id

}