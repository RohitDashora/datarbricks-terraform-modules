// Credential config

output "mws_credential_id" {
  value          = module.databricks_mws_credentials.id
  description = "Canonical unique identifier for the mws credentials."
}
output "mws_credential_creation_time" {
  value          = module.databricks_mws_credentials.creation_time
  description = "(Integer) time of credentials registration"
}
output "mws_credential_credentials_id" {
  value          = module.databricks_mws_credentials.credentials_id
  description = "(String) identifier of credentials"
}