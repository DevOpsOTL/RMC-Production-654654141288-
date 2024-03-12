output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.dic-prod-vpc.id
}

output "prod-pub-sbnt-1a-id" {
  description = "The ID Public Subnet AZ 1a"
  value       = aws_subnet.prod-pub-sbnt-1a.id
}

output "prod-pub-sbnt-1b-id" {
  description = "The ID of Public Subnet AZ 1b"
  value       = aws_subnet.prod-pub-sbnt-1b.id
}

output "prod-pri-sbnt-1a-id" {
  description = "The ID of Private Subnet AZ 1a"
  value       = aws_subnet.prod-pri-sbnt-1a.id
}

output "prod-pri-sbnt-1b-id" {
  description = "The ID of Private Subnet AZ 1b"
  value       = aws_subnet.prod-pri-sbnt-1b.id
}