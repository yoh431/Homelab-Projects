# ============================================================
# Disable-ADUsers.ps1
# Reads leavers.csv and disables their AD accounts
# ============================================================

Import-Module ActiveDirectory

$csvPath = "C:\Scripts\AD-User-Management\leavers.csv"
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    $username = ($user.FirstName[0] + $user.LastName).ToLower()

    $adUser = Get-ADUser -Filter {SamAccountName -eq $username} -ErrorAction SilentlyContinue

    if ($adUser) {
        Disable-ADAccount -Identity $username

        Move-ADObject -Identity $adUser.DistinguishedName `
            -TargetPath "OU=Disabled Users,DC=mydomain,DC=local"

        Write-Host "DISABLED and MOVED: $username" -ForegroundColor Red
    }
    else {
        Write-Host "NOT FOUND: $username - check the CSV" -ForegroundColor Yellow
    }
}

Write-Host "`nDone! Disabled accounts moved to Disabled Users OU." -ForegroundColor Cyan