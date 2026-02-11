variable "aws_region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "last_name" {
  type = string
}

variable "first_name" {
  type = string
}

variable "project_code" {
  type = string
}

variable "activity_name" {
  type = string
}
