locals {
  instance_permission_policies = setunion(
    toset([
      "AmazonSSMDirectoryServiceAccess",
      "AmazonSSMManagedInstanceCore",
      "AWSAccelerator-SessionManagerLogging",
      "CloudWatchAgentServerPolicy",
      "AmazonS3ReadOnlyAccess",
    ]),
    var.instance_permission_policies
  )

  name   = "dbfreedom"
  vpc_id = data.aws_subnet.this[0].vpc_id
}
