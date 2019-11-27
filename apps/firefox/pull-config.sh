#!/bin/sh

source "$(dirname $0)/constants.sh";

echo "Pulling a new firefox syspref..."

[[ `whoami` == "root" ]] && echo "pulling firefox config as root, probably not a good idea" && return 1;

if [[ !-d ]]; then
    (
        mkdir -p $__PULL_STORE || ( echo "unable to create pull store" && return 1);
    )
fi

if [[ ! -d $__REPO ]]; then
    (
        mkdir -p $__REPO_STORE && \
        cd $__REPO_STORE && \
        git clone $__REMOTE;
    )
fi

(
    cd $__REPO && git pull && \
    make -s $__MAKE_TARGET && \
    mv $__DIST "${__PULL_STORE}/syspref.js" && \
    echo "A new syspref.js was created @ ${__PULL_STORE}/syspref.js";
)
