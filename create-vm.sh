#!/bin/bash

ZONE=us-central1-f
INSTANCE=test-2
CPU=8
MEM=32G
DISK=64G
gcloud compute instances create ${INSTANCE} --zone ${ZONE} \
       --custom-cpu=${CPU} \
       --custom-memory=${MEM}
#        --boot-disk-size=${DISK}


# delete it
# gcloud compute instances delete my-instance --zone us-central1-a
