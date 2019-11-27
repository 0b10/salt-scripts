#!/bin/sh

__STORE="${HOME}/git-test";
__REPO="${__STORE}/user.js";
__REMOTE="https://github.com/pyllyukko/user.js.git";
__MAKE_TARGET="systemwide_user.js";
__DIST="systemwide_user.js";

[[ `whoami` == "root" ]] && echo "pulling firefox config as root, probably not a good idea" && return 1;

if [[ ! -d $__REPO ]]; then
    (
        mkdir -p $__STORE && \
        cd $__STORE && \
        git clone $__REMOTE;
    )
fi

(
    echo "pulling..."
    cd $__REPO && git pull && \
    make $__MAKE_TARGET
)
