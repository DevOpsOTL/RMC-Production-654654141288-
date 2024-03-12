provider "aws" {
  alias  = "dr_aws"
  region = "ap-southeast-1"
}


resource "aws_elasticache_parameter_group" "dic-prod-elasticache" {
  name          = var.pg_name
  family        = var.pg_family
  description   = var.pg_description
  tags          = {
    Name        = var.pg_tag_name
  }
  parameter {
    name  = "cluster-enabled"
    value = "yes"
  }
}

resource "aws_elasticache_subnet_group" "dic-prod-sbnt-group" {
  name       = "dic-prod-sbnt-group"
  subnet_ids = [var.pri_sbnt_1a_id, var.pri_sbnt_1b_id]
}  

/*
resource "aws_elasticache_replication_group" "dic-prod-replication-group" {
  replication_group_id       = "dic-redis-cluster"
  description                = "dic prod redis cluster"
  node_type                  = "cache.r5.large"
  engine_version             =  "7.0"
  multi_az_enabled           =  false
  port                       = 6379
  parameter_group_name       = aws_elasticache_parameter_group.dic-prod-elasticache.name
  subnet_group_name          = aws_elasticache_subnet_group.dic-prod-sbnt-group.name
  security_group_ids         = var.security_group_ids
  automatic_failover_enabled = true

  num_node_groups            = 1
  replicas_per_node_group    = 1
}

resource "aws_elasticache_global_replication_group" "dic-global_store" {
  global_replication_group_id_suffix  = "redis-cluster-dr"
  primary_replication_group_id        = aws_elasticache_replication_group.dic-prod-replication-group.id
  depends_on = [
    aws_elasticache_replication_group.dic-prod-replication-group,
  ]
}

resource "aws_elasticache_replication_group" "secondary" {
  provider = aws.dr_aws

  replication_group_id        = "dic-redis-secondary"
  description                 = "secondary replication group"
  automatic_failover_enabled  = true
  global_replication_group_id = aws_elasticache_global_replication_group.dic-global_store.global_replication_group_id
  security_group_ids          = ["sg-0fc1f51602d4378f8"]
}

*/




/* NOT REQUIRED TO UNCOMMENT */

# resource "aws_elasticache_cluster" "dic-prod-redis-cluster" {
#   cluster_id           = "dic-prod-redis"
#   engine               = "redis"
#   node_type            = "cache.t2.micro"
#   num_cache_nodes      = 1
#   parameter_group_name = aws_elasticache_parameter_group.dic-prod-elasticache.name
#   subnet_group_name    = aws_elasticache_subnet_group.dic-prod-sbnt-group.name
#   engine_version       = "7.0"
#   port                 = 6379
# }