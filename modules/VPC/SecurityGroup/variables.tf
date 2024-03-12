variable "vpc_id" {
  type        = string
  description = "DIC Prod VPC ID"
}

variable "security_group_name" {
  type        = string
  description = "DIC Prod Security Group Name"
}

variable "tag_name" {
  type        = string
  description = "DIC Prod SG Tag Name"
}

variable "sg_from_cidr" {
  type        = list
  description = "DIC Prod SG CIDR"
}
