output "id" {
  value          = databricks_mws_credentials.mws_credential.id
  description = "Canonical unique identifier for the mws credentials."
}
output "creation_time" {
  value          = databricks_mws_credentials.mws_credential.creation_time
  description = "(Integer) time of credentials registration"
}
output "credentials_id" {
  value          = databricks_mws_credentials.mws_credential.credentials_id
  description = "(String) identifier of credentials"
}