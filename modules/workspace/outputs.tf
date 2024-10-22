output "workspace_id" {
  value = module.aws_workspaces.aws_workspaces_workspace.latency_test_workspace.id
}

output "workspace_user_name" {
  value = module.aws_workspaces.aws_workspaces_workspace.latency_test_workspace.user_name
}

output "workspace_directory_id" {
  value = module.aws_workspaces.aws_workspaces_workspace.latency_test_workspace.directory_id
}

output "workspace_bundle_id" {
  value = module.aws_workspaces.aws_workspaces_workspace.latency_test_workspace.bundle_id
}
