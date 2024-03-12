# Create an IAM policy

resource "aws_iam_policy" "dic-prod-ssm-policy" {
  name = "dic-prod-ssm-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:*",
          "ssm:*",
          "ec2messages:*",
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel",
          "cloudwatch:PutMetricData",
          "ec2:DescribeInstanceStatus",
          "ec2:DescribeInstanceStatus",
          "ds:CreateComputer",
          "ds:DescribeDirectories",
          "ds:CreateComputer",
          "ds:DescribeDirectories",
          "s3:GetBucketLocation",
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetEncryptionConfiguration",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads"
        ]
        Resource = "*"
      }
    ]
  })
}

# Create an IAM role
resource "aws_iam_role" "dic-prod-ssm-role" {
  name = "dic-prod-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "ssm_role_policy_attachment" {
  name = "Policy Attachement"
  policy_arn = aws_iam_policy.dic-prod-ssm-policy.arn
  roles       = [aws_iam_role.dic-prod-ssm-role.name]
}

# Create an IAM instance profile
resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "ssm_instance_profile"
  role = aws_iam_role.dic-prod-ssm-role.name
}