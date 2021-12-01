output "id" {
  value       = databricks_mws_networks.networks.id
  description = "Canonical unique identifier for the mws networks."
}
output "network_id" {
  value       = databricks_mws_networks.networks.network_id
  description = "(String) id of network to be used for databricks_mws_workspace resource."
}
output "vpc_status" {
  value       = databricks_mws_networks.networks.vpc_status
  description = "(String) VPC attachment status"
}
output "workspace_id" {
  value       = databricks_mws_networks.networks.workspace_id
  description = "(Integer) id of associated workspace"
}