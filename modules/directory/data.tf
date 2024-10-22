data "aws_vpc" "this" {
  id = module.use1_vpc.vpc_id
}

data "aws_subnet" "this" {
  id = module.use1_vpc.private_subnets[0]
}


