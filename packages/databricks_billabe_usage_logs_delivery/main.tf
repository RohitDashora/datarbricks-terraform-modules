provider "databricks" {

}

module "usage_log-delivery" {
  source = "../../../modules/unit/databricks_log_delivry"

}