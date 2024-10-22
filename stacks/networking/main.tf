#https://github.com/terraform-aws-modules/terraform-aws-vpc/blob/master/main.tf

module "use1_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.13"
  providers = {
    aws = aws.use1
  }

  name = "latency-lab-vpc"
  cidr = "10.87.0.0/20"
  public_subnets = [
    "10.87.0.0/23",
    "10.87.2.0/23",
  ]
  private_subnets = [
    "10.87.4.0/23",
    "10.87.6.0/23",
  ]
  azs = [
    "use1-az4",
    "use1-az6",
  ]
  enable_dns_hostnames   = true
  enable_nat_gateway     = true
  one_nat_gateway_per_az = true

  enable_flow_log = false
}

module "usw2_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.13"
  providers = {
    aws = aws.usw2
  }

  name = "latency-lab-vpc"
  cidr = "10.88.0.0/20"
  public_subnets = [
    "10.88.0.0/23",
    "10.88.2.0/23",
  ]
  private_subnets = [
    "10.88.4.0/23",
    "10.88.6.0/23",
  ]
  azs = [
    "usw2-az1",
    "usw2-az2",
  ]
  enable_dns_hostnames   = true
  enable_nat_gateway     = true
  one_nat_gateway_per_az = true

  enable_flow_log = false
}

module "apse1_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.13"
  providers = {
    aws = aws.apse1
  }

  name = "latency-lab-vpc"
  cidr = "10.90.0.0/20"
  public_subnets = [
    "10.90.0.0/23",
    "10.90.2.0/23",
  ]
  private_subnets = [
    "10.90.4.0/23",
    "10.90.6.0/23",
  ]
  azs = [
    "apse1-az1",
    "apse1-az2",
  ]
  enable_dns_hostnames   = true
  enable_nat_gateway     = true
  one_nat_gateway_per_az = true

  enable_flow_log = false
}
