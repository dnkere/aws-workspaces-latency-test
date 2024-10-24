data "terraform_remote_state" "networking_stack" {
  backend = "s3"

  config = {
    bucket         = "aws-workspaces-latency-test20241017161752423400000001"
    key            = "networking/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "aws-workspaces-latency-test"
  }
}

data "terraform_remote_state" "directory_stack" {
  backend = "s3"
  config = {
    bucket         = "aws-workspaces-latency-test20241017161752423400000001"
    key            = "directory/terraform.tfstate"
    region         = "us-east-1"
  }
}

