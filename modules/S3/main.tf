resource "aws_s3_bucket" "dic-prod-bucket" {
  bucket = var.bucket_name
}
