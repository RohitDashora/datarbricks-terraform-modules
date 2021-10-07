resource "databricks_mws_credentials" "mws_credential" {
  account_id       = var.account_id
  credentials_name = var.credentials_name
  role_arn         = var.role_arn
}