#!/bin/bash
# Programmer:Harold.Duan
# Date:20200107
# Reason:giprote script.

version_info(){
  # sh $(cd $(dirname $0); pwd -P)/copyright.sh "giprote"
  sh $giprote_dir/scripts/copyright.sh "giprote"
  echo "gpt 1.2.2"
}

help_info(){
  echo "
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

# echo $0
# echo $1
# echo $2
# echo "$@"

if [[ -z "$@}" ]]
then
  # echo `giprote -h`
  version_info
  help_info
else
  case "$@" in
    "-v"|"--version")
      version_info
    ;;
    "-h"|"--help")
      help_info
    ;;
    "init --commit")
      #echo $PWD
      sh $giprote_dir/scripts/inticomit.sh
    ;;
    "--local-branch")
      sh $giprote_dir/scripts/initlobra.sh
    ;;
    "gen --prof")
      sh $giprote_dir/scripts/genprof.sh
    ;;
    "gen --readme")
      sh $giprote_dir/scripts/generademe.sh
    ;;
    "gen --ignore")
      sh $giprote_dir/scripts/genignore.sh
    ;;
    *) 
    help_info
  esac
fi