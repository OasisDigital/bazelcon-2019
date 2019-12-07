#!/bin/bash

set -e
# Avoid certain problems under MSYS on Windows
export MSYS_NO_PATHCONV=1
export MSYS2_ARG_CONV_EXCL="*"

bazel build '...'
bazel test '...' --test_verbose_timeout_warnings --test_output=errors

bazel run //app-one/src/main/java/com/example/myproject:hello-world
bazel run //app-one/src/main/java/com/example/myproject:hello-data

# See a list of targets:
# bazel query '...'

# See a diagram of the those tarage (on a Mac with graphviz installed)
# bazel query --output=graph ... | dot -Tpng >temp.png ; open temp.png
