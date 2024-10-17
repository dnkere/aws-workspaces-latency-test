module "server_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  description = "Security group for ${local.name} servers"
  name        = local.name
  vpc_id      = local.vpc_id

  ingress_with_self = [{
    description = "Self ingress"
    rule        = "all-all"
  }]
  ingress_with_cidr_blocks = [
    {
      description = "Citrix environment RDP ingress"
      rule        = "rdp-tcp"
      cidr_blocks = "10.220.115.0/24"
    },
    {
      description = "Allow all intra-vpc traffic"
      rule        = "all-all"
      cidr_blocks = data.aws_vpc.this.cidr_block
    }
  ]
  ingress_with_source_security_group_id = [
    {
      description              = "All ingress from ${module.nlb.id}"
      rule                     = "all-all"
      source_security_group_id = module.nlb.security_group_id
    },
  ]
  egress_rules = ["all-all"]
}

module "server" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.7"

  name               = "${local.name}-app"
  ami                = data.aws_ssm_parameter.windows_server.value
  ignore_ami_changes = true
  instance_type      = var.instance_type
  subnet_id          = data.aws_subnet.this[0].id
  vpc_security_group_ids = distinct(concat(
    [module.server_sg.security_group_id],
    var.additional_instance_security_groups,
  ))

  disable_api_termination     = false # Enable deletion protection
  create_iam_instance_profile = true
  iam_role_name               = "${local.name}-app"
  iam_role_use_name_prefix    = true
  iam_role_policies           = { for k, v in data.aws_iam_policy.instance_permissions : k => v.arn }

  monitoring    = true
  ebs_optimized = true
  root_block_device = [{
    encrypted   = true
    volume_size = 30
  }]
}
