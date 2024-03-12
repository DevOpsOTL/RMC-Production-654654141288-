output "iam_instance_profile_name" {
  description = "IAM Role Instance Profile."
  value       = aws_iam_instance_profile.ssm_instance_profile.name
}