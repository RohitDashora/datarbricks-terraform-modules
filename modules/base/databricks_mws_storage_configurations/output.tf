output "id" {
    value = databricks_mws_storage_configurations.stotage_configuration.id
    description = "Canonical unique identifier for the mws storage configurations."
    }
output "storage_configuration_id" {
    value = databricks_mws_storage_configurations.stotage_configuration.storage_configuration_id
    description = "(String) id of storage config to be used for"
    }