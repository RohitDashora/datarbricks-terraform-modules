
variable "region" {
  type        = string
  description = "(required) Aws Region where you want to deploy"
}
variable "account_id" {
  description = "Account Id that could be found in the bottom left corner of Accounts Console."
}
variable "credentials_name" {
  description = "(Required) name of credentials to register"
}
variable "role_arn" {
  description = "(Required) ARN of cross-account role to deliver logs to s3 bucket"
}

variable "bucket_name" {
  description = "name of AWS S3 bucket for log,  create_s3_bucket variable will help you set the flag on wether to create the bucet or not "
}
variable "storage_configuration_name" {
  description = "name under which this storage configuration is stored"
}

variable "config_name" {
  description = "The optional human-readable name of the log delivery configuration. Defaults to empty."
}
variable "log_type" {
  default     = "BILLABLE_USAGE"
  description = "The type of log delivery. BILLABLE_USAGE and AUDIT_LOGS are supported."
}
variable "delivery_start_time" {
  default     = "2019-03"
  description = "(Optional) The optional start month and year for delivery, specified in YYYY-MM format. Defaults to current year and month. Usage is not available before 2019-03."
}
variable "delivery_path_prefix" {
  description = "(Required) Defaults to empty, which means that logs are delivered to the root of the bucket. The value must be a valid S3 object key. It must not start or end with a slash character."
}