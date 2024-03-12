resource "aws_security_group" "dic-prod-lambda-sg" {
  name_prefix = "dic-prod-lambda-sg"
  vpc_id = var.vpc_id
  tags   = {
    Name = "Lambda-SG"
  }
 
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "https traffice"
  }
 
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound traffice"
  }
}

resource "aws_iam_role" "dic-prod-lambda-role" {
  name = "dic-prod-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "dic-prod-lambda-policy" {
  name        = "dic-prod-lambda-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      Resource = ["arn:aws:logs:*:*:*"]
    },{
      Effect = "Allow"
      Action = [
        "ec2:CreateNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface"
      ]
      Resource = ["*"]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "dic-prod-lambda-role-policy" {
  policy_arn = aws_iam_policy.dic-prod-lambda-policy.arn
  role = aws_iam_role.dic-prod-lambda-role.name
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/python/index.py"
  output_path = "${path.module}/python/index.py.zip"
}

resource "aws_lambda_function" "dic-prod-function" {
  function_name     = "dic-prod-function"
  description       = "This is DIC Production Lambda Function."
  filename          = data.archive_file.lambda.output_path
  handler           = "index.lambda_handler"
  role              = aws_iam_role.dic-prod-lambda-role.arn
  runtime           = "python3.11"
  timeout           = 300
  vpc_config {
    subnet_ids = [var.pub_sbnt_1a_id, var.pub_sbnt_1b_id]
    security_group_ids = [aws_security_group.dic-prod-lambda-sg.id]
  }
}

