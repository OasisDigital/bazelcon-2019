#!/bin/bash

set -e

# The easiest command: build everything. Bazel uses ... for the
# "everything" wildcard.

# But... some shells helpful convert ... to ../.. by default (!),
# so for compatibility always quote your ... Bazel wildcard.

bazel build '...'

# If you are on Windows, you'll need to ask MSYS to not mangle
# Bazel targets, which it confuses for paths.

export MSYS_NO_PATHCONV=1
export MSYS2_ARG_CONV_EXCL="*"

bazel build //groceries:groceries
bazel build //groceries

# to run the server:
# bazel run //groceries
