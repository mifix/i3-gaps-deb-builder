#!/bin/bash

DEBEMAIL="github@mifix.com"
DEBFULLNAME="Christian Mayer"

TIMESTAMP="$(date +%Y%m%d%H%M%S)"


if [ -z "$1" ];then
  git pull

  DEBEMAIL="$DEBEMAIL" DEBFULLNAME="$DEBFULLNAME" \
      debchange --preserve --dist=unstable --local=mifix+${TIMESTAMP} "New upstream."

  dpkg-buildpackage -us -uc


  cd /opt

  find . -maxdepth 1 -type f -print0 | xargs -0 -i cp -v {} /build

fi


exec "$@"
