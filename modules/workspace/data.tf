data "aws_workspaces_bundle" "value_windows_10" {
  bundle_id = "wsb-bh8rsxt14" # Value with Windows 10 (English)
}
data "aws_kms_key" "workspaces" {
  key_id = "alias/aws/workspaces"
}
