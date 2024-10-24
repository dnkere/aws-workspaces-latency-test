resource "aws_workspaces_workspace" "latency_test_workspace" {
<<<<<<< HEAD
  directory_id = module.directory.directory_id
  bundle_id    = data.aws_workspaces_bundle.value_windows_10.id
  user_name    = "workspace-user"

  root_volume_encryption_enabled = true
  user_volume_encryption_enabled = true
  volume_encryption_key          = data.aws_kms_key.workspaces.arn

  workspace_properties {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
=======
  directory_id = var.directory_id
  bundle_id    = var.bundle_id
  user_name    = var.user_name
  user_volume_encryption_enabled = true
  root_volume_encryption_enabled = true
  volume_encryption_key          = "alias/aws/workspaces"

  workspace_properties {
    compute_type_name                         = "STANDARD"
    user_volume_size_gib                      = 50
>>>>>>> 30267b8 (latest)
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

<<<<<<< HEAD
  tags = {
    Name = "latency-test-workspace"
  }
}

=======
  tags = var.global_tags
}

resource "null_resource" "create_user" {
  provisioner "local-exec" {
    command = <<EOT
      powershell.exe -File ${path.module}/add_user.ps1 `
        -UserName ${var.user_name} `
        -Password ${var.workspace_user_password} `
        -GivenName ${var.given_name} `
        -Surname ${var.surname} `
        -DisplayName "${var.given_name} ${var.surname}" `
        -OUPath "OU=Users,OU=Tapestry,OU=AWS,OU=Tapestry,DC=tapestry,DC=com"
    EOT
  }

  triggers = {
    user_name = var.user_name
  }
}

resource "aws_ssm_document" "add_ad_user" {
  name            = "AddADUser"
  document_type   = "Command"
  document_format = "YAML"
  content         = <<DOC
schemaVersion: '2.2'
description: 'Add user to Active Directory'
parameters:
  UserName:
    type: String
    description: 'Username for the new AD user'
  Password:
    type: String
    description: 'Password for the new AD user'
  GivenName:
    type: String
    description: 'Given name for the new AD user'
  Surname:
    type: String
    description: 'Surname for the new AD user'
  DisplayName:
    type: String
    description: 'Display name for the new AD user'
  OUPath:
    type: String
    description: 'OU path for the new AD user'
mainSteps:
  - action: 'aws:runPowerShellScript'
    name: 'addADUser'
    inputs:
      runCommand:
        - |
          Import-Module ActiveDirectory
          $SecurePassword = ConvertTo-SecureString '{{ Password }}' -AsPlainText -Force
          New-ADUser -SamAccountName '{{ UserName }}' `
                     -UserPrincipalName '{{ UserName }}@$env:USERDNSDOMAIN' `
                     -Name '{{ DisplayName }}' `
                     -GivenName '{{ GivenName }}' `
                     -Surname '{{ Surname }}' `
                     -DisplayName '{{ DisplayName }}' `
                     -AccountPassword $SecurePassword `
                     -Enabled $true `
                     -Path '{{ OUPath }}' `
                     -PasswordNeverExpires $true `
                     -ChangePasswordAtLogon $false
          Write-Host "User {{ UserName }} created successfully."
DOC
}

resource "aws_ssm_association" "add_ad_user" {
  name = aws_ssm_document.add_ad_user.name

  targets {
    key    = "InstanceIds"
    values = [var.ad_instance_id]  # You'll need to provide this variable
  }

  parameters = {
    UserName    = var.user_name
    Password    = var.workspace_user_password
    GivenName   = var.given_name
    Surname     = var.surname
    DisplayName = "${var.given_name} ${var.surname}"
    OUPath      = "OU=Users,OU=Tapestry,OU=AWS,OU=Tapestry,DC=tapestry,DC=com"
  }
}
>>>>>>> 30267b8 (latest)
