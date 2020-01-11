<#
**** Genprof,means [GenerateProjectsFolders]'s abbreviation.
**** Programmer:Harold.Duan
**** Date:20200110
**** Reason:giprote scripts.
#>

# echo $env:USERPROFILE
# Write-Output $args

function version_info() {
    # sh $(cd $(dirname $0); pwd -P)/copyright.sh "giprote"
    # sh $env:giprote_dir/scripts/copyright.sh "giprote"
    # Set-Location $env:giprote_dir
    # Get-Location
    # git branch | grep -E "[0-9].[0-9].[0-9]"
}

function help_info() {
    Write-Output "
Usage: 
    gpt -h|--help                  Show help message
    gpt -v|--version               Print out the installed version of gpt
    gpt init                       Init repo
        --commit                     Init repo commit
        --local-branch               Init repo local branch
    gpt gen                        Generate source
        --prof                       Generate source project folders
        --readme                     Generate source README.md
        --ignore                     Generate source .gitignore
    gpt -u|--upgrade               Upgrade to the latest version.
  
Example:
    gpt init --commit              Init current repo commit
    gpt init --local-branch        Init current repo local branch
    gpt gen --prof                 Generate source project folders
    gpt gen --readme               Generate source README.md
Note:
    If you have some problems,you can pull iusses to this repo:
        http://rds.avatech.com.cn:7070/harold.duan/giprote.commandline
"
}

function upgrade() {
    
}

$cur_path = ($pwd -replace "Path","")
# Write-Output $cur_path
Set-Location $env:giprote_dir
if($args) {
    # Write-Output $args
    switch ($args) {
        { "-v","--version" -contains $_ } { version_info; break }
        { "-h","--help" -contains $_ } { help_info; break }
        { "init --commit" -contains $_ } { .\scripts\initicomit.ps1; break }
        { "init --local-branch" -contains $_ } { .\scripts\initilobra.ps1; break }
        { "gen --prof" -contains $_ } { .\scripts\genprof.ps1 break }
        { "gen --readme" -contains $_ } { .\scripts\generademe.ps1 break }
        { "gen --ignore" -contains $_ } { .\scripts\genignore.ps1 break }
        { "-u","--upgrade" -contains $_ } { upgrade; break }
        Default { help_info }
    }
}
else {
    Write-Output "Fuck!"
}
Set-Location $cur_path