#!/bin/bash
#
# Usage:
#   run_dockerscript.sh Dockerscript
# NOTE: This should only run inside a container.

# Make all failures fatal.
set -e

function ds_die {
  echo "$1" 1>&2
  exit 1
}

function ds_check_proxy {
  # convert http://host:port/ to "host port"
  if [[ "$1" == "" ]]; then
    return 1
  fi
  nc_args=$(echo $1 | sed 's,http://,,; s,/,,g; s,:, ,')
  echo "HEAD / HTTP/1.1\n\n" | nc $nc_args | grep 'Server: squid'
  return $?
}

function ds_init {
  if [[ "$DOCKER_BUILD_INITED" == "1" ]]; then
    return
  fi
  
  if (( EUID != 0 )); then
    ds_die "You must be root to run this."
  fi

  if [[ $(grep :cpu: /proc/1/cgroup) == "3:cpu:/" ]]; then
    ds_die "You must be in a container to run this."
  fi
}

function ds_build {
  ds_die "Must override ds_build function in Dockerscript"
}

function ds_prune_image {
  # Truncate log files
  find var/log -type f -exec cp /dev/null {} \;
}

ds_init
source ${1?Must specify path to Dockerscript}
(ds_build)
ds_prune_image
