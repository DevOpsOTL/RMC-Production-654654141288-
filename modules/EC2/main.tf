resource "aws_instance" "dic-prod-instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  iam_instance_profile =  var.iam_instance_profile
  tags = {
    Name = var.tag_name
  }
}