#!/bin/bash
ARCH=amd64
PORTAGE_DIR=/home/mzhao/gentoo/portage
CONFIG_DIR=/home/mzhao/gentoo/gentoo-builder/portage-config-amd64-kde-desktop
OVERLAY_DIR=/home/mzhao/gentoo/gentoo-builder/overlay-base
docker run --rm -t -i \
  -v ${PORTAGE_DIR}:/usr/portage \
  -v ${CONFIG_DIR}:/etc/portage \
  -v ${OVERLAY_DIR}:/overlay \
  -h gentoo-${ARCH}-builder gentoo-${ARCH} /bin/bash
