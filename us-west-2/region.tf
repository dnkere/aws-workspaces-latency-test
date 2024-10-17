# us-west-1/region.tf

provider "aws" {
  region = "us-west-2"
}

# VPC configuration
resource "aws_vpc" "us_west_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "latency-lab-vpc-us-west-2"
  }
}

# Subnet configuration
resource "aws_subnet" "us_west_subnet_1" {
  vpc_id            = aws_vpc.us_west_vpc.id
  cidr_block        = "10.1.3.0/24"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "us_west_subnet_2" {
  vpc_id            = aws_vpc.us_west_vpc.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-west-2b"
}

resource "aws_internet_gateway" "us_west_igw" {
  vpc_id = aws_vpc.us_west_vpc.id
}

resource "aws_route_table" "us_west_route_table" {
  vpc_id = aws_vpc.us_west_vpc.id
}

resource "aws_route" "us_west_route" {
  route_table_id         = aws_route_table.us_west_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.us_west_igw.id
}

resource "aws_route_table_association" "us_central_route_assoc" {
  subnet_id      = aws_subnet.us_west_subnet_1.id
  route_table_id = aws_route_table.us_west_route_table.id
}

# Security Group for EC2
resource "aws_security_group" "us_west_ec2_sg" {
  vpc_id = aws_vpc.us_west_vpc.id

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
resource "aws_instance" "us_west_ec2" {
  ami           = "ami-03d138c886cbbfad4"  # Update this to a valid AMI ID for us-west-2
  instance_type = var.instance_type
  subnet_id              = aws_subnet.us_west_subnet_1.id
  vpc_security_group_ids = [aws_security_group.us_west_ec2_sg.id]

  tags = {
    Name = "latency-test-ec2-us-west-2"
  }
}

# Directory for WorkSpaces
resource "aws_directory_service_directory" "us_west_workspaces_directory" {
  name     = "latency-lab-us-west-2.local"
  password = var.directory_password
  size     = "Small"

  vpc_settings {
    vpc_id     = aws_vpc.us_west_vpc.id
    subnet_ids = [aws_subnet.us_west_subnet_1.id, aws_subnet.us_west_subnet_2.id]
  }
}

# WorkSpace for Latency Testing
resource "aws_workspaces_workspace" "us_west_workspace" {
  directory_id = aws_directory_service_directory.us_west_workspaces_directory.id
  bundle_id    = var.workspace_bundle_id_us_west_2
  user_name    = var.workspace_user_name

  # Add a dependency to ensure the directory is created first
  depends_on = [aws_directory_service_directory.us_west_workspaces_directory]
  timeouts {
    create = "30m"
  }
}

output "us_west_2_directory_id" {
  value = aws_directory_service_directory.us_west_workspaces_directory.id
}
