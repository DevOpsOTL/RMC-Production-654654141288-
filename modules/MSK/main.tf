resource "aws_security_group" "dic-prod-msk-sg" {
  name_prefix = "dic-prod-msk-sg"
  vpc_id = var.vpc_id
  tags   = {
    Name = "MSK-SG"
  }
 
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS Inbound Traffice"
  }
 
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound traffice"
  }
}


resource "aws_msk_serverless_cluster" "dic-prod-msk-cluster" {
  cluster_name = var.msk_cluster_name

  vpc_config {
    subnet_ids         = [var.pub_sbnt_1a_id, var.pub_sbnt_1b_id]
    security_group_ids = [aws_security_group.dic-prod-msk-sg.id]
  }

  client_authentication {
    sasl {
      iam {
        enabled = true
      }
    }
  }
}