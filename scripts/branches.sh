#!/bin/bash
# Programmer:Harold.Duan
# Date:20210911
# Reason:API operator module.
cur_path=$(cd $(dirname $0); pwd -P)
source $cur_path/config/.conf
echo "srv_url = $srv_url"
echo "user_token = $user_token"
echo "header_text = $header_text"
echo "header_token = $header_token"
echo "header_cntnt = $header_cntnt"
echo "api_root = $api_root"
echo "path_repo = $path_repo"
echo "path_user = $path_user"

branch_protections(){
  echo "curl -X GET $srv_url$api_root$path_repo$1 -H $header_text -H $header_token -H $header_cntnt"
  echo $(curl -X GET $srv_url$api_root$path_repo$1 -H "$header_text" -H "$header_token" -H "$header_cntnt")
  echo owner_repo = $1
}

branch_protections $1

content='[
    {
        "branch_name": "debug",
        "enable_push": false,
        "enable_push_whitelist": false,
        "push_whitelist_usernames": [],
        "push_whitelist_teams": [],
        "push_whitelist_deploy_keys": false,
        "enable_merge_whitelist": true,
        "merge_whitelist_usernames": [
            "harold.duan",
            "pancy.fan",
            "shuo.liu",
            "zero.zhang"
        ],
        "merge_whitelist_teams": [],
        "enable_status_check": true,
        "status_check_contexts": null,
        "required_approvals": 0,
        "enable_approvals_whitelist": false,
        "approvals_whitelist_username": [],
        "approvals_whitelist_teams": [],
        "block_on_rejected_reviews": false,
        "block_on_outdated_branch": false,
        "dismiss_stale_approvals": false,
        "require_signed_commits": false,
        "protected_file_patterns": ""
    },
    {
        "branch_name": "dev",
        "enable_push": false,
        "enable_push_whitelist": false,
        "push_whitelist_usernames": [],
        "push_whitelist_teams": [],
        "push_whitelist_deploy_keys": false,
        "enable_merge_whitelist": true,
        "merge_whitelist_usernames": [
            "harold.duan",
            "pancy.fan",
            "shuo.liu",
            "zero.zhang"
        ],
        "merge_whitelist_teams": [],
        "enable_status_check": true,
        "status_check_contexts": null,
        "required_approvals": 0,
        "enable_approvals_whitelist": false,
        "approvals_whitelist_username": [],
        "approvals_whitelist_teams": [],
        "block_on_rejected_reviews": false,
        "block_on_outdated_branch": false,
        "dismiss_stale_approvals": false,
        "require_signed_commits": false,
        "protected_file_patterns": ""
    },
    {
        "branch_name": "master",
        "enable_push": false,
        "enable_push_whitelist": false,
        "push_whitelist_usernames": [],
        "push_whitelist_teams": [],
        "push_whitelist_deploy_keys": false,
        "enable_merge_whitelist": true,
        "merge_whitelist_usernames": [
            "harold.duan",
            "pancy.fan",
            "shuo.liu",
            "zero.zhang"
        ],
        "merge_whitelist_teams": [],
        "enable_status_check": true,
        "status_check_contexts": null,
        "required_approvals": 0,
        "enable_approvals_whitelist": false,
        "approvals_whitelist_username": [],
        "approvals_whitelist_teams": [],
        "block_on_rejected_reviews": false,
        "block_on_outdated_branch": false,
        "dismiss_stale_approvals": false,
        "require_signed_commits": false,
        "protected_file_patterns": ""
    }
]'