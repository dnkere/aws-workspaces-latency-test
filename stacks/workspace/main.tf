<<<<<<< HEAD
module "use1_mock_workspace" {
  source = "../../modules/mock_workspace"
  providers = {
    aws = aws.use1
  }

  subnet_ids = module.use1_vpc.private_subnets
}

module "usw2_mock_workspace" {
  source = "../../modules/mock_workspace"
  providers = {
    aws = aws.usw2
  }
  subnet_ids = module.usw2_vpc.private_subnets
}

module "apse1_mock_workspace" {
  source = "../../modules/mock_workspace"
  providers = {
    aws = aws.apse1
  }
  subnet_ids = module.apse1_vpc.private_subnets
}

module "use1_workspace" {
  source = "../../modules/workspace"
  providers = {
    aws = aws.use1
  }

  bundle_id = data.aws_workspaces_bundle.value_windows_10.id
  user_name = "workspace-user"
  directory_id = module.use1_directory.directory_id
} 

module "apse1_workspace" {
  source = "../../modules/workspace"
  providers = {
    aws = aws.apse1
  }

  bundle_id = data.aws_workspaces_bundle.value_windows_10.id
  user_name = "workspace-user"
  directory_id = module.apse1_directory.directory_id
}
=======
# Add these data sources at the beginning of your main.tf file

data "aws_workspaces_bundle" "bundle_id" {
  bundle_id = "wsb-55rrhyyg1"
}

data "aws_directory_service_directory" "use1_directory" {
  provider     = aws.use1
  directory_id = data.terraform_remote_state.directory_stack.outputs.use1_directory_id
}

data "aws_directory_service_directory" "apse1_directory" {
  provider     = aws.apse1
  directory_id = data.terraform_remote_state.directory_stack.outputs.apse1_directory_id
}

module "use1_workspace" {
  source      = "../../modules/workspace"
  providers = {
    aws = aws.use1
  }
  subnet_ids  = data.terraform_remote_state.networking_stack.outputs.use1_private_subnets
  bundle_id   = data.aws_workspaces_bundle.bundle_id.id
  user_name   = "workspace-user"  
  workspace_user_password = data.aws_directory_service_directory.use1_directory.password  
  directory_id = data.aws_directory_service_directory.use1_directory.id

  global_tags = var.global_tags
  vpc_id      = data.terraform_remote_state.networking_stack.outputs.use1_vpc_id
}

module "apse1_workspace" {
  source      = "../../modules/workspace"
  providers = {
    aws = aws.apse1
  }
  subnet_ids  = data.terraform_remote_state.networking_stack.outputs.apse1_private_subnets
  bundle_id   = data.aws_workspaces_bundle.bundle_id.id
  user_name   = "workspace-user"
  workspace_user_password = data.aws_directory_service_directory.apse1_directory.password
  directory_id = data.aws_directory_service_directory.apse1_directory.id

  global_tags = var.global_tags
  vpc_id      = data.terraform_remote_state.networking_stack.outputs.apse1_vpc_id
}

>>>>>>> 30267b8 (latest)
