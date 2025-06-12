terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.92.0"
    }
  }

  backend "s3" {
    bucket = "roboshop-infra-remote-state"
    key = "roboshop-infra-dev-eks"
    region = "us-east-1"
    dynamodb_table = "roboshop-infra-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}