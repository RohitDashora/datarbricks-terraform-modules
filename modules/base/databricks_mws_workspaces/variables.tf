variable "account_id" {
    type = string
    description = "Account Id that could be found in the bottom left corner of Accounts Console."
    }
variable "workspace_name" {
    type = string
    description = "name of the workspace, will appear on UI"
    }
variable "aws_region" {
    type = string
    description = "AWS region of VPC"
    }
variable "storage_configuration_id" {
    type = string
    description = "storage_configuration_id from storage configuration"
    }
variable "credentials_id" {
    type = string
    description = "credentials_id from credentials. could be modified after the workspace is running:"
    }
variable "network_id" {
    type = string
    description = "(Optional) network_id from networks. Modifying networks on running workspaces would require three separate terraform apply steps. could be modified after the workspace is running"
    }
variable "deployment_name" {
    type = string
    description = "(Optional) part of URL: https://<deployment-name>.cloud.databricks.com"
    }
variable "private_access_settings_id" {
    type = string
    description = "(Optional) Canonical unique identifier of databricks_mws_private_access_settings in Databricks Account"
    }
variable "storage_customer_managed_key_id" {
    type = string
    description = "(Optional) customer_managed_key_id from customer managed keys with use_cases set to STORAGE. This is used to encrypt the DBFS Storage & Cluster EBS Volumes.could be modified after the workspace is running:"
    }
variable "managed_services_customer_managed_key_id" {
    type = string
    description = "(Optional) customer_managed_key_id from customer managed keys with use_cases set to MANAGED_SERVICES. This is used to encrypt the workspace's notebook and secret data in the control plane."
    }