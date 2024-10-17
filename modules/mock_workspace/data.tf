data "aws_vpc" "this" {
  id = data.aws_subnet.this[0].vpc_id
}

data "aws_subnet" "this" {
  count = length(var.subnet_ids)
  id    = var.subnet_ids[count.index]
}

data "aws_ssm_parameter" "windows_server" {
  name = "/aws/service/ami-windows-latest/Windows_Server-2016-English-Full-Base"
}

data "aws_iam_policy" "instance_permissions" {
  for_each = local.instance_permission_policies
  name     = each.value
}
