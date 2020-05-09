#!/bin/bash

set -ex
version=$1

vmajor=$(echo $version | cut -d. -f1)
vminor=$(echo $version | cut -d. -f2)
vpatch=$(echo $version | cut -d. -f3)

# versionCode is XYYYZZ
cmajor=$vmajor
cminor=$(printf "%03d" $vminor)
cpatch=$(printf "%02d" $vpatch)

code=${cmajor}${cminor}${cpatch}

rm -f manifest.xml
wget https://github.com/nova-video-player/aos-AVP/releases/download/v${version}/manifest.xml
for p in $(xmlstarlet sel -t -m //project -v ./@path -n manifest.xml);do
    rev=$(xmlstarlet sel -t -m //project'[@path="'$p'"]' -v ./@revision -n manifest.xml)
    (
        cd $p
        git fetch origin $rev
        git checkout $rev
    )
    git add $p
done
git commit -m "v${version}"
git push
git tag -a "v${version} c${code}" -m "v${version} release"
git push --tags

