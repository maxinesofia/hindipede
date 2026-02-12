terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  fullname = "${var.last_name}-${var.first_name}"
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Engineer    = local.fullname
      ProjectCode = var.project_code
    }
  }
}
