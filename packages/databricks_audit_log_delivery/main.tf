
module "audit_log-delivery" {
  source                     = "../../modules/unit/databricks_log_delivery/"
  account_id                 = var.account_id
  config_name                = var.config_name
  credentials_name           = var.credentials_name
  delivery_path_prefix       = var.delivery_path_prefix
  role_arn                   = var.role_arn
  storage_configuration_name = var.storage_configuration_name
  log_type                   = var.log_type
  delivery_start_time        = var.delivery_start_time
  region                     = var.region
}