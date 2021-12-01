resource "databricks_instance_profile" "instance_profile" {
  instance_profile_arn     = var.instance_profile_arn
  is_meta_instance_profile = var.is_meta_instance_profile
  skip_validation          = var.skip_validation
}