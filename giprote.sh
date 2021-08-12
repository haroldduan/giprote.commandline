#!/bin/bash
# Programmer:Harold.Duan
# Date:20200107
# Reason:Installing giprote scripts.


version_info() {
  # sh $(cd $(dirname $0); pwd -P)/copyright.sh "giprote"
  sh $giprote_dir/scripts/copyright.sh "giprote"
  cd $giprote_dir
  git branch | grep -E "[0-9].[0-9].[0-9]"
}

help_info() {
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
    https://github.com/EDITeam/giprote.commandline.git
  "
}

upgrade() {
  cd $giprote_dir
  echo "Upgrading..."
  remotes=$(git branch -r | grep -v "\->" | grep -E "[0-9].[0-9].[0-9]")
  # echo $remotes
  for remote in $remotes
  do
    # echo "$remote"
    git branch --track "${remote#origin/}" "$remote"
    max="0.0.0"
    temp="${remote#origin/}"
    # echo "$temp"
    if [ $temp \> $max ];then
      max=$temp
      # echo "$max"
    fi
  done
  git fetch --all
  git pull --all
  git checkout $max
  git branch | grep -E "[0-9].[0-9].[0-9]"
}

# echo $0
# echo $1
# echo $2
# echo "$@"
cur_path=$PWD
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
      sh $giprote_dir/scripts/initicomit.sh
    ;;
    "init --local-branch")
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
    "-u"|"--upgrade")
      upgrade
    ;;
    *) 
      help_info
  esac
fi
cd $cur_path