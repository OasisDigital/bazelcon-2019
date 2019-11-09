#!/bin/bash

set -e

bazel build ...

# No test for this one yet.
# bazel test ... --test_verbose_timeout_warnings --test_output=errors

# In separate windows:
# bazel run :frontend
# bazel run :service
# visit http://localhost:8080
