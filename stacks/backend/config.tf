provider "aws" {
  region = var.region

  default_tags {
    tags = var.global_tags
  }
}

terraform {
  required_version = "~> 1.7"

  backend "s3" {
    bucket         = "aws-workspaces-latency-test20241017161752423400000001"
    key            = "backend/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "aws-workspaces-latency-test"
  }
}
