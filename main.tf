/*  PROVIDER
===============================================================*/
provider "aws" {
  region = var.region
}

/* S3 BUCKET
===============================================================*/
# module "dic-prod-bucket" {
#     source        = "./modules/S3"
#     region        = var.region
#     bucket_name   = var.bucket_name
# }

/*  DIC PROD LOGS S3 BUCKET
===============================================================*/
# module "dic-prod-logs-bucket" {
#     source        = "./modules/S3"
#     region        = var.region
#     bucket_name   = "dic-prod-logs-bucket"
# }

# /*  DIC PROD GLACIER VAULT
# ==============================================================*/
# module "dic-prod-glacier-vault" {
#     source      = "./modules/S3/Glacier"
#     vault_name  = "dic-prod-vault"
#     tag_name    = "dic-prod-vault"
# }

# /*  DIC PROD VPC
# ===============================================================*/
# module "VPC" {
#     source              = "./modules/VPC"
#     region              = var.region
#     vpc_cidr            = var.vpc_cidr
#     pub_sbnt_1a_cidr    = var.pub_sbnt_1a_cidr
#     pub_sbnt_1b_cidr    = var.pub_sbnt_1b_cidr
#     pri_sbnt_1a_cidr    = var.pri_sbnt_1a_cidr
#     pri_sbnt_1b_cidr    = var.pri_sbnt_1b_cidr
# }

# /*  DIC PROD LAMBDA SECURITY GROUP
# ===============================================================*/
# module "Lambda_SG" {
#     source              = "./modules/VPC/SecurityGroup"
#     vpc_id              = module.VPC.vpc_id
#     security_group_name = "lambda-security-group"
#     tag_name            = "lambda-security-group"
#     sg_from_cidr        = ["10.10.0.0/20"]
# }

# /*  DIC PROD LAMBDA FUNCTION
# ==============================================================*/
# module "Lambda" {
#     source          = "./modules/Lambda"
#     region          = var.region
#     vpc_id          = module.VPC.vpc_id
#     pub_sbnt_1a_id  = module.VPC.prod-pub-sbnt-1a-id
#     pub_sbnt_1b_id  = module.VPC.prod-pub-sbnt-1b-id
# }

# /*  DIC PROD ECR 
# =============================================================*/
# module "ECR" {
#     source          = "./modules/ECR"
#     ecr_name        = var.dic-prod-ecr
# }

# /*  DIC PROD SSM ROLE 
# =============================================================*/
# module "IAM" {
#     source          = "./modules/IAM"
# }

# /*  DIC PROD REDIS INSTANCE SECURITY GROUP 
# =============================================================*/
# module "Redis_Instance_SG" {
#     source              = "./modules/VPC/SecurityGroup"
#     vpc_id              = module.VPC.vpc_id
#     security_group_name = "redis-security-group"
#     tag_name            = "redis-security-group"
#     sg_from_cidr        = ["10.10.0.0/20"]
# }

# /*  DIC PROD REDIS INSTANCE 
# =============================================================*/
# module "Redis_Instance" {
#     source                  = "./modules/EC2"
#     subnet_id               = module.VPC.prod-pub-sbnt-1a-id
#     ami_id                  = var.redis_instance_ami
#     instance_type           = var.redis_instance_type
#     key_name                = var.instance_key
#     iam_instance_profile    = module.IAM.iam_instance_profile_name
#     tag_name                = "dic-prod-redis"
# }

# /*  DIC PROD ELASTICACHE REDIS CLUSTER 
# =============================================================*/
# module "ElastiCache_Redis" {
#     source                  =  "./modules/ElastiCache"
#     pg_name                 =  "dic-prod-redis7-pg"
#     pg_description          =  "DIC Prod Redis7 Parameter Group."
#     pg_family               =  "redis7"
#     pg_tag_name             =  "dic-prod-redis7-pg.clustor.on"
#     pri_sbnt_1a_id          =   module.VPC.prod-pri-sbnt-1a-id
#     pri_sbnt_1b_id          =   module.VPC.prod-pri-sbnt-1b-id
#     security_group_ids      =   [module.Redis_Instance_SG.sg_id]
# }

/*  DIC PROD MSK CLUSTER 
=============================================================*/
# module "MSK" {
#     source              = "./modules/MSK"
#     msk_cluster_name    = var.msk_cluster_name
#     vpc_id              = module.VPC.vpc_id
#     pub_sbnt_1a_id      = module.VPC.prod-pub-sbnt-1a-id
#     pub_sbnt_1b_id      = module.VPC.prod-pub-sbnt-1b-id
# }