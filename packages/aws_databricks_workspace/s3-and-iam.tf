# Configure the AWS provider
provider "aws" {
  version = "~> 2.0"
}

# Create an S3 bucket for the Databricks workspace
resource "aws_s3_bucket" "databricks" {
  bucket = "databricks-bucket"
  acl    = "private"

  tags = {
    Name = "databricks-bucket"
  }
}

# Create an IAM role for the Databricks workspace
resource "aws_iam_role" "databricks" {
  name = "databricks-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
