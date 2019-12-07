#!/bin/bash

set -e

exit

bazel build '...'
# bazel test '...' --test_verbose_timeout_warnings --test_output=errors
