variable "region" {
  type        = string
  description = "AWS Region."
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