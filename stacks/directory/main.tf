module "use1_directory" {
  source = "../../modules/directory"
  providers = {
    aws = aws.use1
  }
  
  directory_password = var.directory_password
  subnet_ids         = [
    data.terraform_remote_state.networking_stack.outputs.use1_private_subnets[0],
    data.terraform_remote_state.networking_stack.outputs.use1_private_subnets[1]
  ]
  vpc_id             = data.terraform_remote_state.networking_stack.outputs.use1_vpc_id
}

module "apse1_directory" {
  source = "../../modules/directory"
  providers = {
    aws = aws.apse1
  }
  directory_password = var.directory_password
  subnet_ids         = [
    data.terraform_remote_state.networking_stack.outputs.apse1_private_subnets[0],
    data.terraform_remote_state.networking_stack.outputs.apse1_private_subnets[1]
  ]
  vpc_id             = data.terraform_remote_state.networking_stack.outputs.apse1_vpc_id
}
