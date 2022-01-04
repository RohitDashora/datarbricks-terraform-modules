
// this module is ONLY for creating s3 bucket compliant for Databricks root bucket or log delivery bucket, 
//if you have your enterprise s3 module please use that with specifications in the databricks documentation 

resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.bucket
  bucket_prefix = var.bucket == "" ? var.bucket_prefix : null
  acl           = var.acl
  tags          = var.tags
  versioning {
    enabled = var.versioning
  }
  force_destroy = var.force_destroy

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  depends_on = [
    aws_s3_bucket.s3_bucket
  ]
  bucket             = aws_s3_bucket.s3_bucket.id
  ignore_public_acls = true
}


data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    effect = "Allow"
    actions = ["s3:GetObject",
      "s3:GetObjectVersion",
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:PutObject",
    "s3:DeleteObject"]
    resources = [
      "${aws_s3_bucket.s3_bucket.arn}/*",
    aws_s3_bucket.s3_bucket.arn]
    principals {
      identifiers = ["arn:aws:iam::${var.databricks_account_id}:root"]
      type        = "AWS"
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  depends_on = [aws_s3_bucket_public_access_block.public_access_block,
    aws_s3_bucket.s3_bucket
  ]
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.iam_policy_document.json

}