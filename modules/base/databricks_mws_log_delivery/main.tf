resource "databricks_mws_log_delivery" "mws_log_delivery"{
account_id = var.account_id
config_name = var.config_name
log_type = var.log_type
output_format = var.output_format
credentials_id = var.credentials_id
storage_configuration_id = var.storage_configuration_id
workspace_ids_filter = var.workspace_ids_filter
delivery_path_prefix = var.delivery_path_prefix
delivery_start_time = var.delivery_start_time
}