# main.tf

module "us_east_1" {
  source = "./us-east-1"
  
  # Pass the necessary variables
  cidr_block             = var.cidr_block
  subnet_cidr_block      = var.subnet_cidr_block
  directory_password     = var.directory_password
  instance_type          = var.instance_type
  workspace_user_name    = var.workspace_user_name
  ami_us_east_1          = var.ami_us_east_1
  workspace_bundle_id_us_east_1 = var.workspace_bundle_id_us_east_1

}

module "us_west_2" {
  source = "./us-west-2"
  # Pass the required variables
  cidr_block             = var.cidr_block
  subnet_cidr_block      = var.subnet_cidr_block
  directory_password     = var.directory_password
  instance_type          = var.instance_type
  workspace_user_name    = var.workspace_user_name
  ami_us_west_2          = var.ami_us_west_2
  workspace_bundle_id_us_west_2 = var.workspace_bundle_id_us_west_2
}



module "ap_southeast_1" {
  source = "./ap-southeast-1"
  
  #Comment out or remove the unsupported arguments
  cidr_block             = var.cidr_block
  subnet_cidr_block      = var.subnet_cidr_block
  subnet_cidr_block_2    = var.subnet_cidr_block_2
  directory_password     = var.directory_password
  instance_type          = var.instance_type
  workspace_user_name    = var.workspace_user_name
  ami_ap_southeast_1     = var.ami_ap_southeast_1
  workspace_bundle_id_ap_southeast_1 = var.workspace_bundle_id_ap_southeast_1
}
