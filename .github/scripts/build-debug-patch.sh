#!/usr/bin/env sh

VERSION=`git describe --tags --abbrev=8 --dirty='!' | awk -F "-" '{print $1}'`
cp ../pokecrystal/pokecrystal11.gbc baserom.gbc
make -j$(nproc) IPSPATCH="../flips/flips" IPSPATCH_COMMAND="--create" pokeoctober-v.${VERSION}-debug.ips
