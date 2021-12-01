variable "instance_profile_arn" {
  description = "(Required) ARN attribute of aws_iam_instance_profile output, the EC2 instance profile association to AWS IAM role. This ARN would be validated upon resource creation."
}
variable "is_meta_instance_profile" {
  description = "(Optional) Whether the instance profile is a meta instance profile. Used only in IAM credential passthrough."
}
variable "skip_validation" {
  description = "(Optional) For advanced usage only. If validation fails with an error message that does not indicate an IAM related permission issue, (e.g. “Your requested instance type is not supported in your requested availability zone”), you can pass this flag to skip the validation and forcibly add the instance profile."
}