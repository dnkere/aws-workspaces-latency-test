
resource "aws_workspaces_directory" "latency_test_directory" {
  directory_id = aws_directory_service_directory.latency_test_directory.id
  subnet_ids   = var.subnet_ids

  tags = {
    Name = "latency-test-directory"
  }

  self_service_permissions {
    change_compute_type  = true
    increase_volume_size = true
    rebuild_workspace    = true
    restart_workspace    = true
    switch_running_mode  = true
  }

  workspace_access_properties {
    device_type_android    = "ALLOW"
    device_type_chromeos   = "ALLOW"
    device_type_ios        = "ALLOW"
    device_type_linux      = "DENY"
    device_type_osx        = "ALLOW"
    device_type_web        = "DENY"
    device_type_windows    = "DENY"
    device_type_zeroclient = "DENY"
  }

  workspace_creation_properties {
    custom_security_group_id            = aws_security_group.workspace_sg.id
    enable_internet_access              = true
    enable_maintenance_mode             = true
    user_enabled_as_local_administrator = true
  }

  depends_on = [
    aws_security_group.workspace_sg,
  ]
}

resource "aws_directory_service_directory" "latency_test_directory" {
  name     = "corp.latency.com"
  password = var.directory_password
  size     = "Small"

  vpc_settings {
    vpc_id = data.aws_vpc.this.id
    subnet_ids = var.subnet_ids
  }
}

data "aws_iam_policy_document" "workspaces" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["workspaces.amazonaws.com"]
    }
  }
}

# resource "aws_iam_role" "workspaces_default" {
#   name               = "workspaces_DefaultRole"
#   assume_role_policy = data.aws_iam_policy_document.workspaces.json
# }

# resource "aws_iam_role_policy_attachment" "workspaces_default_service_access" {
#   role       = aws_iam_role.workspaces_default.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonWorkSpacesServiceAccess"
# }

# resource "aws_iam_role_policy_attachment" "workspaces_default_self_service_access" {
#   role       = aws_iam_role.workspaces_default.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonWorkSpacesSelfServiceAccess"
# }

resource "aws_security_group" "workspace_sg" {
  vpc_id = data.aws_vpc.this.id
  name = "workspace-sg"
  description = "Security group for workspace"
  tags = {
    Name = "workspace-sg"
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
