variable "name" {
  description = "(string, required) - the name of the script. It should be unique"
}
variable "source" {
  description = "- Path to script's source code on local filesystem. Conflicts with content_base64"
}
variable "content_base64" {
  description = "- The base64-encoded source code global init script. Conflicts with source. Use of content_base64 is discouraged, as it's increasing memory footprint of Terraform state and should only be used in exceptional circumstances"
}
variable "enabled" {
  description = "(bool, optional default: false) specifies if the script is enabled for execution, or not"
}