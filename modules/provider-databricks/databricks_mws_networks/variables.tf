variable "account_id" {
  description = "Account Id that could be found in the bottom left corner of Accounts Console"
}
variable "network_name" {
  description = "name under which this network is regisstered"
}
variable "vpc_id" {
  description = "aws_vpc id"
}
variable "subnet_ids" {
  description = "ids of aws_subnet"
}
variable "security_group_ids" {
  description = "ids of aws_security_group"
}
variable "vpc_endpoints" {
  description = "(Optional) - mapping of databricks_mws_vpc_endpoint for PrivateLink connections"
}