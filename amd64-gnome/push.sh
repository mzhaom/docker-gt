#!/bin/bash
gsutil -m rsync -d -r packages gs://genbin/amd64/amd64-gnome/packages
gsutil -m acl -r ch -u AllUsers:R gs://genbin/amd64
