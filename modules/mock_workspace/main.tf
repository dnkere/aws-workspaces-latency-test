resource "aws_security_group" "server_sg" {
  name = "${var.name}-server-sg"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ingress_cidr_blocks
  }

  tags = var.global_tags
}



# module "server_sg" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "5.1.2"

#   description = "Security group for ${var.name} servers"
#   name        = var.name
#   vpc_id      = var.vpc_id

#   ingress_with_self = [{
#     description = "Self ingress"
#     rule        = "all-all"
#   }]
#   ingress_cidr_blocks = var.ingress_cidr_blocks
 
#   egress_rules = ["all-all"]
# }

# module "mock_workspace" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "~> 5.7"

#   name               = "${var.name}-app"
#   ami                = data.aws_ssm_parameter.windows_server.value
#   ignore_ami_changes = true
#   instance_type      = var.instance_type
#   subnet_id          = var.subnet_id
#   vpc_security_group_ids = [module.server_sg.security_group_id]

#   disable_api_termination     = false # Enable deletion protection
#   create_iam_instance_profile = true
#   iam_role_name               = "${var.name}-app"
#   iam_role_use_name_prefix    = true
#   iam_role_policies           = { for k, v in data.aws_iam_policy.instance_permissions : k => v.arn }

#   monitoring    = true
#   ebs_optimized = true
#   root_block_device = [{
#     encrypted   = true
#     volume_size = 30
#   }]
# }

resource "aws_instance" "mock_workspace" {
  ami = data.aws_ssm_parameter.windows_server.value
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.server_sg.id]
  tags = var.global_tags
}

data "terraform_remote_state" "networking_stack" {
  backend = "s3"
  config = {
    bucket = "aws-workspaces-latency-test20241017161752423400000001"
    key    = "networking/terraform.tfstate"
    region = "us-east-1"
  }
}
