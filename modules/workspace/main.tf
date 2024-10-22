resource "aws_workspaces_workspace" "latency_test_workspace" {
  directory_id = module.directory.directory_id
  bundle_id    = data.aws_workspaces_bundle.value_windows_10.id
  user_name    = "workspace-user"

  root_volume_encryption_enabled = true
  user_volume_encryption_enabled = true
  volume_encryption_key          = data.aws_kms_key.workspaces.arn

  workspace_properties {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = {
    Name = "latency-test-workspace"
  }
}

