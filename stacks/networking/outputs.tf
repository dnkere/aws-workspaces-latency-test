output "use1_vpc_id" {
  value = module.use1_vpc.vpc_id
}

output "apse1_vpc_id" {
  value = module.apse1_vpc.vpc_id
}

output "use1_private_subnets" {
  value = module.use1_vpc.private_subnets
}

output "apse1_private_subnets" {
  value = module.apse1_vpc.private_subnets
}
