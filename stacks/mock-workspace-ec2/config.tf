terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.73.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "use1"

  default_tags {
    tags = var.global_tags
  }
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "apse1"

  default_tags {
    tags = var.global_tags
  }
}

provider "aws" {
  region = "us-west-2"
  alias  = "usw2"

  default_tags {
    tags = var.global_tags
  }
}

terraform {
  required_version = "~> 1.6.6"

  backend "s3" {
    bucket         = "aws-workspaces-latency-test20241017161752423400000001"
    key            = "mock-workspace-ec2/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "aws-workspaces-latency-test"
  }
}
