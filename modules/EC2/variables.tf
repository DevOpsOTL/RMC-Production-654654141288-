variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "ami_id" {
  type        = string
  description = "AMI ID"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
}

variable "key_name" {
  type        = string
  description = "EC2 Key Pair"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM Instance Profile"
}

variable "tag_name" {
  type        = string
  description = "Tag Name"
}