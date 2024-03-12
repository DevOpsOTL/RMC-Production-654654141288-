output "dic-prod-ecr-url" {
  description = "DIC Prod ECR URL"
  value       = aws_ecr_repository.dic-prod-ecr.repository_url
}