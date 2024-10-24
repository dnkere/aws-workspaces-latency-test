data "terraform_remote_state" "networking_stack" {
  backend = "s3"

  config = {
    bucket         = "aws-workspaces-latency-test20241017161752423400000001"
    key            = "networking/terraform.tfstate"
    region         = "us-east-1"
  }
}

data "aws_ami" "latest_windows_use1" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}

data "aws_ami" "latest_windows_usw2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }   
}

data "aws_ami" "latest_windows_apse1" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }
}
