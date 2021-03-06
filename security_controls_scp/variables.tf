#-----security_controls_scp/variables.tf----#
variable "target_id" {
  description = "The Root ID, Organizational Unit ID, or AWS Account ID to apply SCPs."
  type        = string
}

variable "region_lockdown" {
  description = "The AWS region(s) you want to restrict resources to."
  type        = list(string)
  default = [
    "us-east-1",
    "us-east-2",
    "us-west-1"
  ]
}

variable "ami_creator_account" {
  description = "The AWS account ID that is responsible for creating and sharing EC2 AMIs."
  type        = string
}

variable "ami_tag_key" {
  description = "The Resource Tag Key to lockdown AMIs for ABAC."
  type        = string
}

variable "ami_tag_value" {
  description = "The Resource Tag Value to lockdown AMIs for ABAC."
  type        = string
}

variable "imdsv2_max_hop" {
  description = "The maximum hop allowed for an IMDSv2 token."
  default     = 1
  type        = number
}