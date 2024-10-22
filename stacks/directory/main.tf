module "directory" {
  source = "/Users/daiquannkere/src/Tapestry/aws-workspaces-latency-test/modules/directory"
  providers = {
    aws = aws.use1
  }
  directory_password = var.directory_password
  subnet_ids         = module.use1_vpc.private_subnets
}

module "apse1_directory" {
  source = "/Users/daiquannkere/src/Tapestry/aws-workspaces-latency-test/modules/directory"
  providers = {
    aws = aws.apse1
  }
  directory_password = var.directory_password
  subnet_ids         = module.apse1_vpc.private_subnets
}
