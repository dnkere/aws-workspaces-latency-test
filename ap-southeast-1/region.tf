# ap-southeast-1/region.tf

provider "aws" {
  region = "ap-southeast-1"
}

# VPC configuration
resource "aws_vpc" "ap_southeast_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "latency-test-vpc-ap-southeast-1"
  }
}

resource "aws_subnet" "ap_southeast_subnet" {
  vpc_id            = aws_vpc.ap_southeast_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.ap_southeast_vpc.cidr_block, 8, 1)
  availability_zone = "ap-southeast-1a"
}

resource "aws_subnet" "ap_southeast_subnet_2" {
  vpc_id            = aws_vpc.ap_southeast_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.ap_southeast_vpc.cidr_block, 8, 2)
  availability_zone = "ap-southeast-1b"
}

resource "aws_internet_gateway" "ap_southeast_igw" {
  vpc_id = aws_vpc.ap_southeast_vpc.id
}

resource "aws_route_table" "ap_southeast_route_table" {
  vpc_id = aws_vpc.ap_southeast_vpc.id
}

resource "aws_route" "ap_southeast_route" {
  route_table_id         = aws_route_table.ap_southeast_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ap_southeast_igw.id
}

resource "aws_route_table_association" "ap_southeast_route_assoc" {
  subnet_id      = aws_subnet.ap_southeast_subnet.id
  route_table_id = aws_route_table.ap_southeast_route_table.id
}

# Security Group for EC2
resource "aws_security_group" "ap_southeast_ec2_sg" {
  vpc_id = aws_vpc.ap_southeast_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "ap_southeast_ec2" {
  ami           = var.ami_ap_southeast_1
  instance_type = var.instance_type
  subnet_id              = aws_subnet.ap_southeast_subnet.id
  vpc_security_group_ids = [aws_security_group.ap_southeast_ec2_sg.id]

  tags = {
    Name = "latency-test-ec2-ap-southeast-1"
  }
}

# Directory for WorkSpaces
resource "aws_directory_service_directory" "ap_southeast_workspaces_directory" {
  name     = "latency-lab-ap-southeast-1.local"
  password = var.directory_password
  size     = "Small"
  type     = "SimpleAD"

  vpc_settings {
    vpc_id     = aws_vpc.ap_southeast_vpc.id
    subnet_ids = [aws_subnet.ap_southeast_subnet.id, aws_subnet.ap_southeast_subnet_2.id]
  }
}

# WorkSpace for Latency Testing
resource "aws_workspaces_workspace" "ap_southeast_workspace" {
  directory_id = aws_directory_service_directory.ap_southeast_workspaces_directory.id
  bundle_id    = var.workspace_bundle_id_ap_southeast_1
  user_name    = var.workspace_user_name

  # Add a dependency to ensure the directory is created first
  depends_on = [aws_directory_service_directory.ap_southeast_workspaces_directory]
}
