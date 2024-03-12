output "bucket_arn" {
  description = "The ARN of the bucket."
  value       =  aws_s3_bucket.dic-prod-bucket.arn
}