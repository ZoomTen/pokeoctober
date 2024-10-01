#!/usr/bin/env sh

VERSION=`git describe --tags --abbrev=8 --dirty='!' | awk -F "-" '{print $1}'`
cp ../pokecrystal/pokecrystal11.gbc baserom.gbc
make -j$(nproc) pokeoctober-v.${VERSION}.ips
