#!/bin/bash
# Programmer:Harold.Duan
# Date:20210911
# Reason:API operator module.
cur_path=$(cd $(dirname $0); pwd -P)
source $cur_path/config/.conf
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

branch_protections $1