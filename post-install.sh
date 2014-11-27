#!/bin/bash

# Run inside a gentoo target to finish configuration

# Update nsscache
nsscache update --full
nsscache verify
