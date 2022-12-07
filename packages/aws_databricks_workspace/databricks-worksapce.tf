# Import the AWS provider
provider "aws" {
  version = "~> 2.0"
}

# Import the Databricks provider
provider "databricks" {
  version = "~> 2.0"
  token   = var.databricks_token
  account = var.databricks_account
}

# Create the Databricks workspace
resource "databricks_workspace" "databricks" {
  name             = var.databricks_workspace_name
  resource_group   = var.databricks_resource_group
  managed_resource = var.databricks_managed_resource
  region           = var.databricks_region
  instance_pool_id = var.databricks_instance_pool_id
  s3_bucket        = aws_s3_bucket.databricks.bucket
  iam_profile_name = aws_iam_role.databricks.name
}
