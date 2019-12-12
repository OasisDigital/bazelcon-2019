#!/bin/bash

set -e
# Avoid certain problems under MSYS on Windows
export MSYS_NO_PATHCONV=1
export MSYS2_ARG_CONV_EXCL="*"

bazel build '...'
bazel test '...' --test_verbose_timeout_warnings --test_output=errors

# bazel run //time-server
# bazel run //fx-server
# bazel run //client

# http://localhost:5432/
# http://localhost:8005/
