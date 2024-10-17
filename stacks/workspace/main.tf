module "use1_mock_workspace" {
  source = "../../modules/mock_workspace"
  providers = {
    aws = aws.use1
  }

  # Variables
}
