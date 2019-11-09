#!/bin/bash

set -e

bazel build ...
bazel test ... --test_verbose_timeout_warnings --test_output=errors
bazel run //app-one/src/main/java/com/example/myproject:hello-world
bazel run //app-one/src/main/java/com/example/myproject:hello-data
