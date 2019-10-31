#!/bin/bash
set -e

find . -maxdepth 2 -name WORKSPACE \( -execdir bazel clean \; -o -execdir bazel shutdown \; \)

find . -maxdepth 3 -name 'bazel-*' -type l -print -delete

find . -maxdepth 2 -name package.json -execdir rm -rf node_modules \;
