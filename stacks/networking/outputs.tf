output "use1_vpc_id" {
  value = module.use1_vpc.vpc_id
}

output "apse1_vpc_id" {
  value = module.apse1_vpc.vpc_id
}

output "usw2_vpc_id" {
  value = module.usw2_vpc.vpc_id
}

output "use1_private_subnets" {
  value = module.use1_vpc.private_subnets
}

output "usw2_private_subnets" {
  value = module.usw2_vpc.private_subnets
}

output "apse1_private_subnets" {
  value = module.apse1_vpc.private_subnets
}

output "use1_vpc_cidr_block" {
  value = module.use1_vpc.vpc_cidr_block
}

output "apse1_vpc_cidr_block" {
  value = module.apse1_vpc.vpc_cidr_block
}

output "usw2_vpc_cidr_block" {
  value = module.usw2_vpc.vpc_cidr_block
}
