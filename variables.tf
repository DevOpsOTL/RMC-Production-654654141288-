variable "region" {
  type        = string
  description = "AWS Region."
  default     = ""
}

variable "bucket_name" {
  type        = string
  description = "AWS S3 Bucket Name."
  default     = ""
}

variable "vpc_cidr" {
  type        = string
  description = "AWS VPC CIDR Range."
  default     = ""
}

variable "pub_sbnt_1a_cidr" {
  type        = string
  description = "Public Subnet AZ 1a CIDR."
}

variable "pub_sbnt_1b_cidr" {
  type        = string
  description = "Public Subnet AZ 1b CIDR."
}

variable "pri_sbnt_1a_cidr" {
  type        = string
  description = "Private Subnet AZ 1a CIDR."
}

variable "pri_sbnt_1b_cidr" {
  type        = string
  description = "Private Subnet AZ 1b CIDR."
}

variable "dic-prod-ecr" {
  type        = string
  description = "Private ECR Repository."
}

variable "msk_cluster_name" {
  type        = string
  description = "DIC Prod MSK Cluster Name"
}

variable "redis_instance_ami" {
  type        = string
  description = "Redis Instance AMI."
}

variable "redis_instance_type" {
  type        = string
  description = "Redis Instance Type"
}

variable "instance_key" {
  type        = string
  description = "Instnace Key"
}
