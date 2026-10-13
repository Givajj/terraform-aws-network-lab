terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.68.0"
    }
  }
}

provider "aws" {
  region = var.region_lab

  default_tags {
    tags = {
      Project     = "terraform-aws-network-lab"
      Environment = "lab"
      ManagedBy   = "Terraform"
    }
  }
}