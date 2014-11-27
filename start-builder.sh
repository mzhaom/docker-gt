#!/bin/bash
ARCH=amd64
PORTAGE_DIR=/home/mzhao/gentoo/portage
CONFIG_DIR=/home/mzhao/gentoo/gentoo-builder/portage-config-amd64-kde-desktop
OVERLAY_DIR=/home/mzhao/gentoo/gentoo-builder/overlay-base
# Output directory
TARGET_DIR=/home/mzhao/gentoo/output-$ARCH
docker run --rm -t -i \
  -v ${PORTAGE_DIR}:/usr/portage \
  -v ${CONFIG_DIR}:/etc/portage \
  -v ${OVERLAY_DIR}:/overlay \
  -v ${TARGET_DIR}:/target \
  -h gentoo-${ARCH}-builder gentoo-${ARCH} /bin/bash
