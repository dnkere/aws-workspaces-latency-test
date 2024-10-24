locals {
  instance_permission_policies = {
    use1  = [ "AmazonSSMDirectoryServiceAccess",
      "AmazonSSMManagedInstanceCore",
      "AWSAccelerator-SessionManagerLogging",
      "CloudWatchAgentServerPolicy",
      "AmazonS3ReadOnlyAccess",]  // Replace with actual policies
    usw2  = [ "AmazonSSMDirectoryServiceAccess",
      "AmazonSSMManagedInstanceCore",
      "AWSAccelerator-SessionManagerLogging",
      "CloudWatchAgentServerPolicy",
      "AmazonS3ReadOnlyAccess",]
    apse1 = [ "AmazonSSMDirectoryServiceAccess",
      "AmazonSSMManagedInstanceCore",
      "AWSAccelerator-SessionManagerLogging",
      "CloudWatchAgentServerPolicy",
      "AmazonS3ReadOnlyAccess",]
  }

  name   = "mock-workspace"
}

locals {
  aws_instance_id = aws_instance.mock_workspace.id
}

  

