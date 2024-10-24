data "aws_workspaces_bundle" "value_windows_10" {
  bundle_id = "wsb-bh8rsxt14" # Value with Windows 10 (English)
}
data "aws_kms_key" "workspaces" {
  key_id = "alias/aws/workspaces"
}
<<<<<<< HEAD
=======

data "aws_directory_service_directory" "latency_test_directory" {
  directory_id = var.directory_id
}

data "aws_workspaces_bundle" "bundle_id" {
  bundle_id = var.bundle_id
}

data "aws_subnet" "subnet_ids" {
  for_each = toset(var.subnet_ids)
  id       = each.value
}

data "aws_vpc" "vpc_id" {
  id = var.vpc_id
}






>>>>>>> 30267b8 (latest)
