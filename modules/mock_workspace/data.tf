data "aws_iam_policy" "instance_permissions" {
  for_each = toset([
    "AmazonSSMManagedInstanceCore",
    "CloudWatchAgentServerPolicy",
    "AmazonS3ReadOnlyAccess",
    "AmazonSSMDirectoryServiceAccess"
  ])
  name = each.value
}

data "aws_ami" "latest_windows" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}