variable "region" {
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

variable "instance_type" {
  type = string
}

# Tagging Variables
variable "lastname" {
  type = string
}

variable "fullname" {
  type = string
}

variable "project_code" {
  type = string
}