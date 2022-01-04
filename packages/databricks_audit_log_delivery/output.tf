// Credential config

output "mws_credential_id" {
  value       = module.audit_log-delivery.mws_credential_id
  description = "Canonical unique identifier for the mws credentials."
}
output "mws_credential_creation_time" {
  value       = module.audit_log-delivery.mws_credential_creation_time
  description = "(Integer) time of credentials registration"
}
output "mws_credential_credentials_id" {
  value       = module.audit_log-delivery.mws_credential_credentials_id
  description = "(String) identifier of credentials"
}

// storage config
output "mws_storage_configuration_id" {
  value       = module.audit_log-delivery.mws_storage_configuration_id
  description = "Canonical unique identifier for the mws storage configurations."
}
output "storage_configuration_id" {
  value       = module.audit_log-delivery.storage_configuration_id.storage_configuration_id
  description = "(String) id of storage config to be used for"
}

//log config
output "log_delivery_config_id" {
  value       = module.audit_log-delivery.log_delivery_config_id
  description = "- Databricks log delivery configuration ID."
}
