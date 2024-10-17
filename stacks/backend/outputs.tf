output "bucket_id" {
  value = module.state_bucket.s3_bucket_id
}

output "lock_table_id" {
  value = aws_dynamodb_table.state_lock.id
}
