#!/bin/sh

source "$(dirname $0)/constants.sh";

[[ `whoami` != "root" ]] && echo "creating a pull store requires root privileges" && exit 1;


if [[ ! -d $__PULL_STORE ]]; then
    echo "creating pull store @ ${__PULL_STORE}"
    
    mkdir -pm 700 $__PULL_STORE;
    chown user:user $__PULL_STORE;
fi

if [[ ! -d $__REPO_STORE ]]; then
    echo "creating repo store @ ${__REPO_STORE}"
    
    mkdir -pm 700 $__REPO_STORE;
    chown user:user $__REPO_STORE;
fi
