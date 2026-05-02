# ============================================================
# Create-ADUsers.ps1
# Reads new_users.csv and creates AD accounts for each person
# ============================================================

Import-Module ActiveDirectory

$csvPath = "C:\Scripts\AD-User-Management\new_users.csv"

$defaultPassword = ConvertTo-SecureString "Welcome123!" -AsPlainText -Force

$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    $username = ($user.FirstName[0] + $user.LastName).ToLower()

    $displayName = "$($user.FirstName) $($user.LastName)"

    $ouPath = "OU=$($user.OU),DC=mydomain,DC=local"

    if (Get-ADUser -Filter {SamAccountName -eq $username} -ErrorAction SilentlyContinue) {
        Write-Host "SKIPPED: $username already exists" -ForegroundColor Yellow
    }
    else {
        New-ADUser `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -Name $displayName `
            -SamAccountName $username `
            -UserPrincipalName "$username@mydomain.local" `
            -Department $user.Department `
            -Title $user.JobTitle `
            -Path $ouPath `
            -AccountPassword $defaultPassword `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Write-Host "CREATED: $displayName ($username) in OU: $($user.OU)" -ForegroundColor Green
    }
}

Write-Host "`nDone! Check Active Directory Users and Computers to verify." -ForegroundColor Cyan