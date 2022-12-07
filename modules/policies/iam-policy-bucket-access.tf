# This code creates an IAM policy named "S3BucketAccessPolicy" that allows access to
# S3 buckets that match the specified pattern
# Define a variable to specify the pattern that S3 bucket names must match in order
# for the policy to allow access to them
variable "bucket_name_pattern" {
  type = string
}

resource "aws_iam_policy" "S3BucketAccessPolicy" {
  name        = "S3BucketAccessPolicy"
  description = "Policy that allows access to S3 buckets"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::*"
      ],
      "Condition": {
        "StringLike": {
          "s3:prefix": [
            "${var.bucket_name_pattern}"
          ]
        }
      }
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::*/*"
      ],
      "Condition": {
        "StringLike": {
          "s3:prefix": [
            "${var.bucket_name_pattern}"
          ]
        }
      }
    }
  ]
}
POLICY
}

