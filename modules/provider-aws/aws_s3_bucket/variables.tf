
variable "bucket" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be less than or equal to 63 characters in length."
}
variable "bucket_prefix" {
  description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be less than or equal to 37 characters in length."
}
variable "acl" {
  default     = "private"
  description = "(Optional) The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write. Defaults to private. Conflicts with grant."
}


variable "tags" {
  type = map(any)
  default = {
    comment = " managed by terraform "
  }
  description = "(Optional) A map of tags to assign to the bucket. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
variable "force_destroy" {
  type        = bool
  description = "(Optional, Default:false) A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
}

variable "versioning" {
  type        = bool
  description = "A state of versioning "
}

variable "databricks_account_id" {
  description = "(required) databricks account id, please check databricks documentation for this"
}