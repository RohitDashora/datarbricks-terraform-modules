provider "databricks" {

}

module "audit_log-delivery" {
  source = "../../../modules/unit/databricks_log_delivry"

}