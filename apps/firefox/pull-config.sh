#!/bin/sh

source "$(dirname $0)/constants.sh";
source "$(dirname $0)/../constants.sh";

echo "Pulling a new firefox syspref..."

[[ `whoami` == "root" ]] && echo "pulling firefox config as root, probably not a good idea" && exit 1;

if [[ !-d ]]; then
    (
        mkdir -p $__FIREFOX_STORE || ( echo "unable to create pull store" && exit 1);
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
    mv $__DIST "${__FIREFOX_STORE}/syspref.js" && \
    echo "A new syspref.js was created @ ${__FIREFOX_STORE}/syspref.js";
)
