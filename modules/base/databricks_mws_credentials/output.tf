output "id" {
    value = databricks_mws_credentials.mws_credential.id
    desdescription = "Canonical unique identifier for the mws credentials."
    }
output "creation_time" {
    value = databricks_mws_credentials.mws_credential.creation_time
    desdescription = "(Integer) time of credentials registration"
    }
output "credentials_id" {
    value = databricks_mws_credentials.mws_credential.credentials_id
    desdescription = "(String) identifier of credentials"
    }