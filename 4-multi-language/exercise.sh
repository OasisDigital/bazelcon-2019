#!/bin/bash

set -e

bazel build ...
# bazel test ... --test_verbose_timeout_warnings
