#!/bin/bash

docs_root=${1}
repo=${2}
branch=${3:-main}

HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
action_path=$(dirname $HERE)

printf "Creating initial docs...\n"
cp -R ${action_path}/docs ${docs_root}

# Template variables in config
pieces=(${repo//// })
repo_name=${pieces[1]}
BASEURL="/${repo_name}"
sed -i "6 s,.*,baseurl: $BASEURL,g" "${docs_root}/_config.yml"
sed -i "7 s,.*,repo: ${repo},g" "${docs_root}/_config.yml"
sed -i "8 s,.*,branch: ${branch},g" "${docs_root}/_config.yml"
cat ${docs_root}/_config.yml
