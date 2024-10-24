#EC2 Instance for Mock Workspace
module "use1_mock_workspace" {
  providers = {
    aws = aws.use1
  }
  source = "../../modules/mock_workspace"
  name = "use1-mock-workspace"
  subnet_id = data.terraform_remote_state.networking_stack.outputs.use1_private_subnets[0]
  vpc_id = data.terraform_remote_state.networking_stack.outputs.use1_vpc_id
  instance_permission_policies = data.instance_permission_policies.instance_permission_policies
  global_tags = var.global_tags
  ingress_cidr_blocks = data.terraform_remote_state.networking_stack.outputs.use1_vpc_cidr_block
  region = "us-east-1"
}

module "usw2_mock_workspace" {
  providers = {
    aws = aws.usw2
  }
  source = "../../modules/mock_workspace"
  name = "usw2-mock-workspace"
  subnet_id = data.terraform_remote_state.networking_stack.outputs.usw2_private_subnets[0]
  vpc_id = data.terraform_remote_state.networking_stack.outputs.usw2_vpc_id
  instance_permission_policies = data.instance_permission_policies.instance_permission_policies
  global_tags = var.global_tags
  ingress_cidr_blocks = data.terraform_remote_state.networking_stack.outputs.usw2_vpc_cidr_block
  region = "us-west-2"
}

module "apse1_mock_workspace" {
  providers = {
    aws = aws.apse1
  }
  source = "../../modules/mock_workspace"
  name = "apse1-mock-workspace"
  subnet_id = data.terraform_remote_state.networking_stack.outputs.apse1_private_subnets[0]
  vpc_id = data.terraform_remote_state.networking_stack.outputs.apse1_vpc_id
  instance_permission_policies = data.instance_permission_policies.instance_permission_policies
  global_tags = var.global_tags
  ingress_cidr_blocks = data.terraform_remote_state.networking_stack.outputs.apse1_vpc_cidr_block
  region = "ap-southeast-1"
}


module "use1_server_sg" {
  source = "terraform-aws-modules/security-group/aws"
  providers = {
    aws = aws.use1
  }
  name = "mock-workspace-sg"
  description = "Security group for mock workspace"
  vpc_id = data.terraform_remote_state.networking_stack.outputs.use1_vpc_id
  ingress_cidr_blocks = data.terraform_remote_state.networking_stack.outputs.use1_vpc_cidr_block
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
  ingress_cidr_blocks = data.terraform_remote_state.networking_stack.outputs.usw2_vpc_cidr_block
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
  ingress_cidr_blocks = data.terraform_remote_state.networking_stack.outputs.apse1_vpc_cidr_block
  tags = var.global_tags
}
