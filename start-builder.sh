#!/bin/bash
ARCH=amd64
PORTAGE_DIR=$PWD/portage
CONFIG_DIR=$PWD/etc-portage
OVERLAY_DIR=$PWD/overlay
USR_SRC_DIR=$PWD/usr-src
test -d ${USR_SRC_DIR} || mkdir -p ${USR_SRC_DIR}
IMG=${DOCKER_IMG:-gentoo-mini-cooper}
# Output directory
# TARGET_DIR=/home/mzhao/gentoo/output-$ARCH
set -x
if [ -d $PWD/packages ]; then
    PKG_DIR=$PWD/packages
#elif [ -d /gfs/lab-0/home/mzhao/$(basename $PWD)/packages ]; then
#    PKG_DIR=/gfs/lab-0/home/mzhao/$(basename $PWD)/packages
else
    echo "No package dir found"
    exit 1
fi
set -x
docker run --rm -t -i \
  -v ${PORTAGE_DIR}:/usr/portage \
  -v ${USR_SRC_DIR}:/usr/src \
  -v ${PKG_DIR}:/usr/portage/packages \
  -v ${CONFIG_DIR}:/etc/portage \
  -v ${OVERLAY_DIR}:/tmp/overlay \
  -h $(basename $PWD) ${IMG} /bin/bash
rsync -azv $PWD/packages /gfs/lab-0/home/mzhao/$(basename $PWD)/
