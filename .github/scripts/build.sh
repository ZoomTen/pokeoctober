#!/usr/bin/env sh

cp ../pokecrystal/pokecrystal11.gbc baserom.gbc
make -j$(nproc) pokeoctober-v.`git describe --always --abbrev=8 --dirty='!' | awk -F "-" '{print $1}'`.ips
