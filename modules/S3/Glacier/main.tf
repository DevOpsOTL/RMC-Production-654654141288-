resource "aws_glacier_vault" "dic-prod-archival" {
  name = var.vault_name

  tags = {
    Name = var.tag_name
  }
}