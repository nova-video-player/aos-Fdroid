#!/bin/bash

set -ex
version=v4.43
rm -f manifest.xml
wget https://github.com/nova-video-player/aos-AVP/releases/download/$version/manifest.xml
for p in $(xmlstarlet sel -t -m //project -v ./@path -n manifest.xml);do
    rev=$(xmlstarlet sel -t -m //project'[@path="'$p'"]' -v ./@revision -n manifest.xml)
    (
        cd $p
        git fetch origin $rev
        git checkout $rev
    )
    git add $p
done
git commit -m $version
