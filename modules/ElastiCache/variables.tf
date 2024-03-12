variable "pg_name" {
  type        = string
  description = "Name of Parameter group"
}

variable "pg_description" {
  type        = string
  description = "Description of Parameter Group"
}

variable "pg_tag_name" {
  type        = string
  description = "Tag Name"
}

variable "pg_family" {
  type        = string
  description = "Family of Parameter Group"
}

variable "pri_sbnt_1a_id" {
  type        = string
  description = "DIC Prod Pri Sbnt 1a ID"
}

variable "pri_sbnt_1b_id" {
  type        = string
  description = "DIC Prod Pri Sbnt 1b ID"
}

variable "security_group_ids" {
  type        = list
  description = "DIC Prod SG ID"
}

