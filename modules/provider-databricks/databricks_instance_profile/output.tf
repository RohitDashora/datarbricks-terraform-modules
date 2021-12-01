output "id" {
  value       = databricks_instance_profile.instance_profile.id
  description = " ARN for EC2 Instance Profile, that is registered with Databricks."
}