variable "name" {
  description = "Name of the bucket"
}

variable "databricks_account_id" {
  type        = string
  default     = "414351767826"
  description = "Default databricks AWS Account ID"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources created"
}

variable "versioning" {
  default     = false
  description = "Either or not apply versioning for root bucket"
}

variable "force_destroy" {
  default     = false
  description = <<EOF
    Allows bucket to be destroyed by terraform even if it has data.
    It is discouraged to enable this option for critical data buckets.
  EOF
}

variable "region" {
  description = "Region where bucket is located"
}
