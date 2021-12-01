resource "databricks_global_init_script" "init_script" {
  name           = var.name
  source         = var.source
  content_base64 = var.content_base64
  enabled        = var.enabled
}

