#!/bin/bash
ARCH=amd64
PORTAGE_DIR=$PWD/portage
CONFIG_DIR=$PWD/etc-portage
OVERLAY_DIR=$PWD/overlay
# Output directory
# TARGET_DIR=/home/mzhao/gentoo/output-$ARCH
set -x
docker run --rm -t -i \
  -v ${PORTAGE_DIR}:/usr/portage \
  -v $PWD/packages:/usr/portage/packages \
  -v ${CONFIG_DIR}:/etc/portage \
  -v ${OVERLAY_DIR}:/tmp/overlay \
  -h $(basename $PWD) gentoo-mini-cooper /bin/bash
