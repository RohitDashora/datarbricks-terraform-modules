module "databricks_mws_credentials" {
  source = "../../base/databricks_mws_credentials"
   account_id       = var.account_id
  credentials_name = var.credentials_name
  role_arn         = var.role_arn
}

module "databricks_storage_configuration" {
  source = "../../base/databricks_mws_storage_configurations"
   account_id                 = var.account_id
  storage_configuration_name = var.storage_configuration_name
  bucket_name                = var.bucket_name
}

module "name" {
  source = "../../base/databricks_mws_log_delivery/"
  account_id               = var.account_id
  config_name              = var.config_name
  log_type                 = var.log_type
  output_format            = var.log_type == "BILLABLE_USAGE"?"CSV" : "JSON"
  credentials_id           = module.databricks_mws_credentials.id
  storage_configuration_id = module.databricks_storage_configuration.id
  workspace_ids_filter     = var.workspace_ids_filter == "" ? null : var.workspace_ids_filter
  delivery_path_prefix     = var.delivery_path_prefix
  delivery_start_time      = var.delivery_start_time
}
