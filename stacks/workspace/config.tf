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
<<<<<<< HEAD
  required_version = "~> 1.7"
=======
  required_version = "1.6.6"
>>>>>>> 30267b8 (latest)

  backend "s3" {
    bucket         = "aws-workspaces-latency-test20241017161752423400000001"
    key            = "workspace/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "aws-workspaces-latency-test"
  }
}
