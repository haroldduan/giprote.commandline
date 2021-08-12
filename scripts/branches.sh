#!/bin/bash
# Programmer:Harold.Duan
# Date:20210911
# Reason:API operator module.
CONF=$giprote_dir/scripts/config/.conf
source $CONF
# echo "srv_url = $srv_url"
# echo "user_token = $user_token"
# echo "header_text = $header_text"
# echo "header_token = $header_token"
# echo "header_cntnt = $header_cntnt"
# echo "api_root = $api_root"
# echo "path_repo = $path_repo"
# echo "path_user = $path_user"

# function get_json_value()
# {
#   local json=$1
#   local key=$2
#   if [[ -z "$3" ]]; then
#     local num=1
#   else
#     local num=$3
#   fi
#   local value=$(echo "${json}" | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'${key}'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p)
#   echo ${value}
# }

cnt_debug="{
        \"branch_name\": \"debug\",
        \"enable_push\": false,
        \"enable_push_whitelist\": false,
        \"enable_merge_whitelist\": true,
        \"merge_whitelist_usernames\": [
            \"harold.duan\",
            \"pancy.fan\",
            \"shuo.liu\",
            \"zero.zhang\"
        ],
        \"enable_status_check\": true
    }"
cnt_dev="{
        \"branch_name\": \"dev\",
        \"enable_push\": false,
        \"enable_push_whitelist\": false,
        \"enable_merge_whitelist\": true,
        \"merge_whitelist_usernames\": [
            \"harold.duan\",
            \"pancy.fan\",
            \"shuo.liu\",
            \"zero.zhang\"
        ],
        \"enable_status_check\": true
    }"
cnt_master="{
        \"branch_name\": \"master\",
        \"enable_push\": false,
        \"enable_push_whitelist\": false,
        \"enable_merge_whitelist\": true,
        \"merge_whitelist_usernames\": [
            \"harold.duan\",
            \"pancy.fan\",
            \"shuo.liu\",
            \"zero.zhang\"
        ],
        \"enable_status_check\": true
    }"

set_key_value() {
  local key=${1}
  local value=${2}
  echo $value
  if [ -n $value ]; then
    sed -i "" -e "s/$key=/$key=$value/g" $CONF
  fi
}

function get_repo_path(){
  repo_url=$(git config --get remote.origin.url)
  # echo $repo_url
  # echo $(echo $repo_url | grep "^(:7070/)$/.git")
  url="https://github.com/"
  # url=$srv_url
  suffix=".git"
  if [[ $repo_url =~ $url ]];
  then
    repo_git=${repo_url#$url}
    # echo $repo_git
    echo ${repo_git%*$suffix}
    return $?
  fi
}

function get_user_token(){
  if [ -z "$user_token" ];
  then
    read -p "Enter the [User Access Tokens] generate by AVATech Gitea system...> " temp_token
    # echo $temp_token
    set_key_value "user_token" "$temp_token"
    source $CONF
  fi
}

function branch_protections(){
#   echo "curl -X GET $srv_url$api_root$path_repo$1 -H "$header_text" -H "$header_token" -H "$header_cntnt""
#   echo $(curl -X GET $srv_url$api_root$path_repo$1 -H "$header_text" -H "$header_token" -H "$header_cntnt")
#   get_json_value $(curl -s GET $srv_url$api_root$path_repo$1 -H "$header_text" -H "$header_token" -H "$header_cntnt") "id"
#   id=$(curl -s GET $srv_url$api_root$path_repo$1 -H "$header_text" -H "$header_token" -H "$header_cntnt" | jq '.id')
#   echo $id
#   echo "curl -X POST $srv_url$api_root$path_repo$1/branch_protections -H "$header_text" -H "$header_token" -H "$header_cntnt" -d $content"
#   echo owner_repo = $1
  curl -s POST $srv_url$api_root$path_repo$1/branch_protections -H "$header_text" -H "$header_token" -H "$header_cntnt" -d "$cnt_dev"
  curl -s POST $srv_url$api_root$path_repo$1/branch_protections -H "$header_text" -H "$header_token" -H "$header_cntnt" -d "$cnt_debug"
  curl -s POST $srv_url$api_root$path_repo$1/branch_protections -H "$header_text" -H "$header_token" -H "$header_cntnt" -d "$cnt_master"
}

repo_path=$(get_repo_path)
# echo $repo_path
if [ -z "$repo_path" ];
then
  echo "This repo is not exists in AVATech's Gitea system!"
else
  get_user_token
  # echo $user_token
  if [ -z "$user_token" ];
  then
    echo "[User Access Tokens] is invalid!"
  else
    branch_protections $repo_path
  fi
fi