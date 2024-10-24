data "aws_iam_policy" "instance_permissions" {
  for_each = var.instance_permission_policies
  name = each.value
}

data "aws_subnet" "subnet" {
  id = var.subnet_id
}

data "aws_ssm_parameter" "windows_server" {
  name = "/aws/service/ami-windows-server-2022-english-full-base"
}

data "aws_ssm_parameter" "windows_server_2019" {
  name = "/aws/service/ami-windows-server-2019-english-full-base"
}

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "instance_permission_policies" "instance_permission_policies" {
  for_each = var.instance_permission_policies
  name = each.value
}

data "ingress_cidr_blocks" "ingress_cidr_blocks" {
  for_each = var.ingress_cidr_blocks
  cidr_block = each.value
}


