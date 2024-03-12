resource "aws_ecr_repository" "dic-prod-ecr" {
  name                 = var.ecr_name
  tags    = {
    Name  = "dic-prod-ecr"
  }
}