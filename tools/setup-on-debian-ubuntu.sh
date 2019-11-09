#!/bin/bash

# WARNING - this is a rough initial script to set up a Linux machine for use with Bazel.
# Barely tested. Don't expect this to do anything useful for you, unless you understand
# each step.

set -e

# Bazel does not need Node or Yarn, but I need them to work on various projects.

# Current Yarn APT repo on Debian.
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Set up Node APT repo on Debian.
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Most of this isn't necessary either, but is helpful for development needs.

sudo apt update
sudo apt install -y apt-transport-https
sudo apt install -y git yarn nodejs openjdk-11-jdk tig htop parallel pkg-config zip g++ zlib1g-dev unzip python3

# Consider the Bazel installer, to get Bash completion running easily.
# curl -sSL https://github.com/bazelbuild/bazel/releases/download/1.1.0/bazel-1.1.0-installer-linux-x86_64.sh >bazel_install.sh
# chmod +x bazel_install.sh
# ./bazel_install.sh --user

# Install Bazel CLI tools "manually". Sadly, as of late 2019 these are not released concurrently
# with Bazel itself, and have varying versions.

mkdir -p bin
curl -sSL https://github.com/bazelbuild/buildtools/releases/download/0.29.0/buildifier >bin/buildifier
curl -sSL https://github.com/bazelbuild/buildtools/releases/download/0.29.0/buildozer >bin/buildozer
curl -sSL https://github.com/bazelbuild/buildtools/releases/download/0.29.0/unused_deps >bin/unused_deps
curl -sSL https://github.com/bazelbuild/bazelisk/releases/download/v1.1.0/bazelisk-linux-amd64 >bin/bazelisk
curl -sSL https://github.com/bazelbuild/bazel-watcher/releases/download/v0.10.2/ibazel_linux_amd64 >bin/ibazel
cp bin/bazelisk bin/bazel
chmod +x bin/*
