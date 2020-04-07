### Nova Fdroid repo

#### Overview

This git repo is part of NOVA opeN sOurce Video plAyer, a video player software for Android.
Please see the entry point repo: https://github.com/nova-video-player/aos-AVP

This repo contains a version for the entire project based on git submodule structure (not repo) and is suited for continuous integration or Fdroid publication process.

#### Update process

Clone the overall project with:
```
git clone --recursive https://github.com/nova-video-player/aos-Fdroid
```
Align with latest release published here https://github.com/nova-video-player/aos-AVP/releases. For instance if v4.46 is the new version:
```
cd aos-Fdroid
./update.sh v4.46
git push
```

NOVA is a fork of the open source project Archos Video Player Community Edition available here https://github.com/archos-sa/aos-AVP
