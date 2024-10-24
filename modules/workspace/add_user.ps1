param (
    [Parameter(Mandatory=$true)]
    [string]$UserName,

    [Parameter(Mandatory=$true)]
    [string]$Password,

    [Parameter(Mandatory=$true)]
    [string]$GivenName,

    [Parameter(Mandatory=$true)]
    [string]$Surname,

    [Parameter(Mandatory=$true)]
    [string]$DisplayName,

    [Parameter(Mandatory=$true)]
    [string]$OUPath
)

# Import the Active Directory module
Import-Module ActiveDirectory

# Convert the password to a secure string
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force

# Create the user
New-ADUser -SamAccountName $UserName `
           -UserPrincipalName "$UserName@$env:USERDNSDOMAIN" `
           -Name $DisplayName `
           -GivenName $GivenName `
           -Surname $Surname `
           -DisplayName $DisplayName `
           -AccountPassword $SecurePassword `
           -Enabled $true `
           -Path $OUPath `
           -PasswordNeverExpires $true `
           -ChangePasswordAtLogon $false

Write-Host "User $UserName created successfully."
