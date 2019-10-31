#!/bin/bash

set -e

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

sudo apt update
sudo apt install -y apt-transport-https
sudo apt install -y git yarn nodejs openjdk-11-jdk tig htop parallel pkg-config zip g++ zlib1g-dev unzip python3

# curl -sSL https://github.com/bazelbuild/bazel/releases/download/1.1.0/bazel-1.1.0-installer-linux-x86_64.sh >bazel_install.sh
# chmod +x bazel_install.sh
# ./bazel_install.sh --user

# IBazel
# https://github.com/bazelbuild/bazel-watcher/releases/download/v0.10.2/ibazel_linux_amd64

mkdir -p bin
curl -sSL https://github.com/bazelbuild/buildtools/releases/download/0.29.0/buildifier >bin/buildifier
curl -sSL https://github.com/bazelbuild/buildtools/releases/download/0.29.0/buildozer >bin/buildozer
curl -sSL https://github.com/bazelbuild/buildtools/releases/download/0.29.0/unused_deps >bin/unused_deps
curl -sSL https://github.com/bazelbuild/bazelisk/releases/download/v1.1.0/bazelisk-linux-amd64 >bin/bazelisk
cp bin/bazelisk bin/bazel
chmod +x bin/*

# du -h --max-dep=1
