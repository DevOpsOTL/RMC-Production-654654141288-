resource "aws_security_group" "dic-prod-sg" {
  name_prefix = var.security_group_name
  vpc_id = var.vpc_id
  tags   = {
    Name = var.tag_name
  }
 
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.sg_from_cidr
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