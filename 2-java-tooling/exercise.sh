#!/bin/bash

set -e

bazel build ...
bazel test ... --test_verbose_timeout_warnings
bazel run :hello-world
bazel run :hello-data
