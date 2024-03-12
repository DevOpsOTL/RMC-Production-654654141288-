output "sg_id" {
  description = "The ID of Security Group"
  value       = aws_security_group.dic-prod-sg.id
}