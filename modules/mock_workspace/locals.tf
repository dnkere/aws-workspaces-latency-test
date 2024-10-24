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

  

