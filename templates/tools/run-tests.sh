#!/usr/bin/env bash

workingDir="$(pwd)"

if [[ "$1" != "" ]]; then
    vendorDirName="$1"
else
    vendorDirName="vendor"
fi

if [[ "$2" != "" ]]; then
    testsDirName="$2"
else
    testsDirName="tests"
fi

testsDir="$workingDir/$testsDirName"

if [[ ! -d ${testsDir} ]]; then
    echo "no dir containing tests"
else
    vendorDir="$workingDir/$vendorDirName"
    phpUnit="$vendorDir/bin/phpunit"
    autoload="$vendorDir/autoload.php"

    if [[ ! -d ${vendorDir} ]] ; then
        echo "invalid vendor dir '$vendorDir'"
        validVendorDir=false
    else
        validVendorDir=true
    fi

    if [[ ! -f ${autoload} ]] ; then
        echo "missing autoload file '$autoload'"
        validAutoload=false
    else
        validAutoload=true
    fi

    if [[ ! -f ${phpUnit} ]] ; then
        echo "missing PHPUnit binary '$phpUnit'"
        validPhpUnit=false
    else
        validPhpUnit=true
    fi

    if [[ ${validAutoload} ]] && [[ ${validPhpUnit} ]] ; then
        php ${phpUnit} ${testsDir} --bootstrap=${autoload}
    fi
fi
