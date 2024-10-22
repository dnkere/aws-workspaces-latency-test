data "aws_vpc" "this" {
  id = module.use1_vpc.vpc_id
}

data "aws_subnet" "this" {
  id = module.use1_vpc.private_subnets[0]
}

data "aws_ssm_parameter" "windows_server" {
  name = "/aws/service/ami-windows-latest/Windows_Server-2016-English-Full-Base"
}

data "aws_iam_policy" "instance_permissions" {
  for_each = local.instance_permission_policies
  name     = each.value
}
