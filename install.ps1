<#
**** Genprof,means [GenerateProjectsFolders]'s abbreviation.
**** Programmer:Harold.Duan
**** Date:20200110
**** Reason:Installing giprote scripts.
#>

# echo $env:USERPROFILE
if (Test-Path "$env:USERPROFILE\.giprote")
{
    Remove-Item -Force -Recurse $env:USERPROFILE\.giprote
}
mkdir $env:USERPROFILE\.giprote
$giprote_dir="$env:USERPROFILE\.giprote"
# [environment]::SetEnvironmentvariable("Path", ";$giprote_dir", "User")
[environment]::SetEnvironmentvariable("giprote_dir", "$giprote_dir", "User")
# echo $giprote_dir
[environment]::GetEnvironmentvariable("giprote_dir", "User")
Copy-Item gpt.ps1 $giprote_dir
if (-not (Test-Path "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"))
{
    New-Item -Type file -Force $profile
}
Copy-Item .\scripts\Microsoft.PowerShell_profile.ps1 $env:USERPROFILE\Documents\WindowsPowerShell
& $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
