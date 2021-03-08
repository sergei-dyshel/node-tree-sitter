#!/usr/bin/env bash

set -e
set -x

remote=$1
commit=$2
dst=$3

mkdir -p $dst
cd $dst

if [[ -n "$(ls)" ]]; then
    echo "Directory $dst is not empty"
    exit 1
fi

# make a new blank repository in the current directory
git init

# add a remote
git remote add origin $remote

# fetch a commit (or branch or tag) of interest
# Note: the full history up to this commit will be retrieved unless
#       you limit it with '--depth=...' or '--shallow-since=...'
git fetch origin $commit --depth=1

# reset this repository's master branch to the commit of interest
git reset --hard FETCH_HEAD
