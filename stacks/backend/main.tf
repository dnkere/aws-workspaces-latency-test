module "state_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.1"

  bucket_prefix = var.bucket_prefix

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning = {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "deletion_protection_policy" {
  bucket = module.state_bucket.s3_bucket_id
  policy = jsonencode({
    Version = "2008-10-17",
    "Statement" : {
      "Action" : "s3:DeleteBucket"
      "Effect" : "Deny"
      "Resource" : module.state_bucket.s3_bucket_arn
      "Principal" : {
        "AWS" : "*"
      }
    }
  })
}

resource "aws_dynamodb_table" "state_lock" {
  name         = var.lock_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
