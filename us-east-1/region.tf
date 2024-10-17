# us-east-1/region.tf

provider "aws" {
  region = "us-east-1"
}

# VPC configuration
resource "aws_vpc" "us_east_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "latency-lab-vpc-us-east-1"
  }
}

resource "aws_subnet" "us_east_subnet" {
  vpc_id            = aws_vpc.us_east_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "us_east_subnet_2" {
  vpc_id            = aws_vpc.us_east_vpc.id
  cidr_block        = "10.1.2.0/24"  // Make sure this doesn't overlap with other subnets
  availability_zone = "us-east-1b"  // Different AZ from the first subnet
}

resource "aws_internet_gateway" "us_east_igw" {
  vpc_id = aws_vpc.us_east_vpc.id
}

resource "aws_route_table" "us_east_route_table" {
  vpc_id = aws_vpc.us_east_vpc.id
}

resource "aws_route" "us_east_route" {
  route_table_id         = aws_route_table.us_east_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.us_east_igw.id
}

resource "aws_route_table_association" "us_east_route_assoc" {
  subnet_id      = aws_subnet.us_east_subnet.id
  route_table_id = aws_route_table.us_east_route_table.id
}

# Security Group for EC2
resource "aws_security_group" "us_east_ec2_sg" {
  vpc_id = aws_vpc.us_east_vpc.id

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
resource "aws_instance" "us_east_ec2" {
  ami           = var.ami_us_east_1
  instance_type = var.instance_type
  subnet_id              = aws_subnet.us_east_subnet.id
  vpc_security_group_ids = [aws_security_group.us_east_ec2_sg.id]

  tags = {
    Name = "latency-test-ec2-us-east-1"
  }
}

# Directory for WorkSpaces
resource "aws_directory_service_directory" "us_east_workspaces_directory" {
  name     = "latency-lab-us-east-1.local"
  password = var.directory_password
  size     = "Small"

  vpc_settings {
    vpc_id     = aws_vpc.us_east_vpc.id
    subnet_ids = [aws_subnet.us_east_subnet.id, aws_subnet.us_east_subnet_2.id]
  }
}

# WorkSpace for Latency Testing
resource "aws_workspaces_workspace" "us_east_workspace" {
  directory_id = aws_directory_service_directory.us_east_workspaces_directory.id
  bundle_id    = var.workspace_bundle_id_us_east_1
  user_name    = var.workspace_user_name

  # Add a dependency to ensure the directory is created first
  depends_on = [aws_directory_service_directory.us_east_workspaces_directory]
  timeouts {
    create = "30m"
  }
}
