#!/bin/bash

# this script processes local manifest.xml
# manifest.xml can be generated from repo checkout of NOVA via repo manifest -r > ../../aos-Fdroid/manifest.xml

#set -ex
version=$1

vmajor=$(echo $version | cut -d. -f1)
vminor=$(echo $version | cut -d. -f2)
vpatch=$(echo $version | cut -d. -f3)

# versionCode is XYYYZZ
cmajor=$vmajor
cminor=$(printf "%03d" $vminor)
cpatch=$(printf "%02d" $vpatch)

code=${cmajor}${cminor}${cpatch}

for p in $(xmlstarlet sel -t -m //project -v ./@path -n manifest.xml);do
    rev=$(xmlstarlet sel -t -m //project'[@path="'$p'"]' -v ./@revision -n manifest.xml)
    (
        cd $p
        git fetch origin $rev
        git checkout $rev
    )
    git add $p
done

echo git commit -m "v${version}"
echo git push
echo git tag -a "v${version}_c${code}" -m "v${version} release"
echo git push --tags

