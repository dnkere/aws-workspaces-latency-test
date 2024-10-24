#EC2 Instance for Mock Workspace
module "use1_mock_workspace" {
  source     = "../../modules/mock_workspace"
  providers  = {
    aws = aws.use1
  }
  subnet_id           = data.terraform_remote_state.networking_stack.outputs.use1_private_subnets[0]
  vpc_id              = data.terraform_remote_state.networking_stack.outputs.use1_vpc_id
  ami                 = data.aws_ami.latest_windows_use1.id
  ingress_cidr_blocks = [data.terraform_remote_state.networking_stack.outputs.use1_vpc_cidr_block]
  global_tags         = var.global_tags
  instance_type       = var.instance_type
  instance_id         = module.use1_mock_workspace.instance_id
}

module "usw2_mock_workspace" {
  source     = "../../modules/mock_workspace"
  providers  = {
    aws = aws.usw2
  }
  subnet_id           = data.terraform_remote_state.networking_stack.outputs.usw2_private_subnets[0]
  vpc_id              = data.terraform_remote_state.networking_stack.outputs.usw2_vpc_id
  ami                 = data.aws_ami.latest_windows_usw2.id
  ingress_cidr_blocks = [data.terraform_remote_state.networking_stack.outputs.usw2_vpc_cidr_block]
  global_tags         = var.global_tags
  instance_type       = var.instance_type
  instance_id         = module.usw2_mock_workspace.instance_id
}

module "apse1_mock_workspace" {
  source     = "../../modules/mock_workspace"
  providers  = {
    aws = aws.apse1
  }
  subnet_id           = data.terraform_remote_state.networking_stack.outputs.apse1_private_subnets[0] 
  vpc_id              = data.terraform_remote_state.networking_stack.outputs.apse1_vpc_id
  ami                 = data.aws_ami.latest_windows_apse1.id
  ingress_cidr_blocks = [data.terraform_remote_state.networking_stack.outputs.apse1_vpc_cidr_block]
  global_tags         = var.global_tags
  instance_type       = var.instance_type
  instance_id         = module.apse1_mock_workspace.instance_id
}

module "use1_server_sg" {
  source = "terraform-aws-modules/security-group/aws"
  providers = {
    aws = aws.use1
  }
  name = "mock-workspace-sg"
  description = "Security group for mock workspace"
  vpc_id = data.terraform_remote_state.networking_stack.outputs.use1_vpc_id
  ingress_cidr_blocks = [data.terraform_remote_state.networking_stack.outputs.use1_vpc_cidr_block]
  tags = var.global_tags
} 

module "usw2_server_sg" {
  source = "terraform-aws-modules/security-group/aws"
  providers = {
    aws = aws.usw2
  }
  name = "mock-workspace-sg"
  description = "Security group for mock workspace"
  vpc_id = data.terraform_remote_state.networking_stack.outputs.usw2_vpc_id
  ingress_cidr_blocks = [data.terraform_remote_state.networking_stack.outputs.usw2_vpc_cidr_block]
  tags = var.global_tags
}

module "apse1_server_sg" {  
  source = "terraform-aws-modules/security-group/aws"
  providers = {
    aws = aws.apse1
  }
  name = "mock-workspace-sg"
  description = "Security group for mock workspace"
  vpc_id = data.terraform_remote_state.networking_stack.outputs.apse1_vpc_id
  ingress_cidr_blocks = [data.terraform_remote_state.networking_stack.outputs.apse1_vpc_cidr_block]
  tags = var.global_tags
}
