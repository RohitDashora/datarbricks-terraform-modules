output "id" {
  value       = databricks_mws_workspaces.mws_workspace.id
  description = "Canonical unique identifier for the workspace."
}
output "workspace_status_message" {
  value       = databricks_mws_workspaces.mws_workspace.workspace_status_message
  description = "(String) updates on workspace status"
}
output "workspace_status" {
  value       = databricks_mws_workspaces.mws_workspace.workspace_status
  description = "(String) workspace status"
}
output "creation_time" {
  value       = databricks_mws_workspaces.mws_workspace.creation_time
  description = "(Integer) time when workspace was created"
}
output "workspace_url" {
  value       = databricks_mws_workspaces.mws_workspace.workspace_url
  description = "(String) URL of the workspace"
}