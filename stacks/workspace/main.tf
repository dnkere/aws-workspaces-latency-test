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
