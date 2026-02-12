variable "aws_region" {
  type        = string
  description = "The AWS region where resources will be deployed"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "last_name" {
  type        = string
  description = "Last name of the engineer"
}

variable "first_name" {
  type        = string
  description = "First name of the engineer"
}

variable "project_code" {
  type        = string
  description = "The code assigned to this specific project"
}

variable "activity_name" {
  type        = string
  description = "The name of the current activity or exercise"
}