#!/bin/bash

genkernel --udev --lvm --zfs --oldconfig --makeopts=-j8 all
