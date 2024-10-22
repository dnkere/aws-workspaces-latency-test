locals {
  use1_directory_password = "password"
}

locals {
  apse1_directory_password = "password"
}

locals {
  use1_subnet_ids = module.use1_vpc.private_subnets
}

locals {
  apse1_subnet_ids = module.apse1_vpc.private_subnets
}
