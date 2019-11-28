#!/bin/sh

source "$(dirname $0)/../constants.sh";

__FIREFOX_STORE="${__PULL_STORE}/firefox"
__REPO="${__REPO_STORE}/user.js";
__REMOTE="https://github.com/pyllyukko/user.js.git";
__MAKE_TARGET="systemwide_user.js";
__DIST="systemwide_user.js";