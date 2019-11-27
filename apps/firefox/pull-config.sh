#!/bin/sh

__STORE="${HOME}/git";
__REPO="${__STORE}/user.js";
__REMOTE="https://github.com/pyllyukko/user.js.git";

[[ `whoami` == "root" ]] && echo "pulling firefox config as root, probably not a good idea" && return 1;

[[ -d $__REPO ]] || mkdir -p $__STORE;


