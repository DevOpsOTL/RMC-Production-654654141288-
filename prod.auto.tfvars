region            =  "ap-south-1"
bucket_name       =  "prism-cement-prod-bucket"
vpc_cidr          =  "10.10.0.0/20"
pub_sbnt_1a_cidr  =  "10.10.1.0/24"
pub_sbnt_1b_cidr  =  "10.10.2.0/24"
pri_sbnt_1a_cidr  =  "10.10.3.0/24"
pri_sbnt_1b_cidr  =  "10.10.4.0/24"
dic-prod-ecr      =  "dic-prod-ecr"
msk_cluster_name  =  "dic-prod-msk"

redis_instance_ami    = "ami-0da59f1af71ea4ad2"
redis_instance_type   = "t2.micro"
instance_key          = "dic-prod-key"