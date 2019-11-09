#!/bin/bash

set -e

bazel build ...
bazel test ... --test_verbose_timeout_warnings --test_output=errors
bazel run :hello-world
bazel run :hello-data
