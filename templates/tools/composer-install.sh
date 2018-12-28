#!/usr/bin/env bash

workingDir="$(pwd)"

cmdFlags="-n --no-progress"
installCmd="composer install"

if [[ "$1" != "" ]]; then
    vendorDirName="$1"
else
    vendorDirName="vendor"
fi

vendorDir="$vendorDirName"

if [[ ! -d ${vendorDir} ]] ; then
    echo "invalid vendor dir '$vendorDir'"
    exit
fi

export COMPOSER_VENDOR_DIR=${vendorDir}

if [[ "$2" != "" ]]; then
    githubAuthToken="$2"
    composerAuth="{\"github.com\": \"$githubAuthToken\"}"
    export COMPOSER_AUTH=${composerAuth}
fi

cmd="$installCmd $cmdFlags"

${cmd}
