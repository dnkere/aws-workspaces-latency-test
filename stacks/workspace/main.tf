module "use1_mock_workspace" {
  source = "../../modules/mock_workspace"
  providers = {
    aws = aws.use1
  }

  subnet_ids = module.use1_vpc.private_subnets

  # Variables
}

