provider "aws" {
  region = var.region

}
module "aws_s3_bucket" {
  source                = "../../provider-aws/aws_s3_bucket"
  bucket                = var.bucket_name
  bucket_prefix         = ""
  force_destroy         = true
  versioning            = false
  count                 = var.create_s3_bucket == true ? 1 : 0
  databricks_account_id = "414351767826"

}
module "databricks_mws_credentials" {
  source           = "../../provider-databricks/databricks_mws_credentials"
  account_id       = var.account_id
  credentials_name = var.credentials_name
  role_arn         = var.role_arn
}

module "databricks_storage_configuration" {
  source                     = "../../provider-databricks/databricks_mws_storage_configurations"
  account_id                 = var.account_id
  storage_configuration_name = var.storage_configuration_name
  bucket_name                = var.bucket_name
  depends_on                 = [module.aws_s3_bucket]
}

module "databricks_mws_log_delivery" {
  source                   = "../../provider-databricks/databricks_mws_log_delivery/"
  account_id               = var.account_id
  config_name              = var.config_name
  log_type                 = var.log_type
  output_format            = var.log_type == "BILLABLE_USAGE" ? "CSV" : "JSON"
  credentials_id           = module.databricks_mws_credentials.id
  storage_configuration_id = module.databricks_storage_configuration.id
  workspace_ids_filter     = var.workspace_ids_filter == [] ? null : var.workspace_ids_filter
  delivery_path_prefix     = var.delivery_path_prefix
  delivery_start_time      = var.delivery_start_time
}

