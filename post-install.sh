#!/bin/bash

# Run inside a gentoo target to finish configuration

# Update nsscache
nsscache update --full
nsscache verify

# Setup timezone
echo "US/Pacific" > /etc/timezone

# Generate locale
cat <<EOF > /etc/locale.gen
en_US ISO-8859-1
en_US.UTF-8 UTF-8
EOF

locale-gen
