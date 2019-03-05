#!/bin/bash
# Abort on Error
set -e

wget http://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.bz2
tar xjvf nasm-2.14.02.tar.bz2
cd nasm-2.14.02
./autogen.sh
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
PATH="$HOME/bin:$PATH" make
sudo make install
