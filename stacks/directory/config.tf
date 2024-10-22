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
  required_version = "~> 1.7"

  backend "s3" {
    bucket         = "aws-workspaces-latency-test20241017161752423400000001"
    key            = "directory/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "aws-workspaces-latency-test"
  }
}
