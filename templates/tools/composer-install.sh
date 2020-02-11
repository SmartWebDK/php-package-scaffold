#!/usr/bin/env bash

cmdFlags="-n --no-progress"
installCmd="composer install"

if [[ "$2" != "" ]]; then
    githubAuthToken="$2"
    composerAuth="{\"github.com\": \"$githubAuthToken\"}"
    export COMPOSER_AUTH=${composerAuth}
fi

cmd="$installCmd $cmdFlags"

exec ${cmd}
