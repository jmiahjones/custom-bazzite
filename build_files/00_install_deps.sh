#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Pull caddy in
dnf5 install -y dnf5-plugins
dnf5 copr enable @caddy/caddy

### Install packages
dnf5 install -y \
  rocm-smi \
  podman-compose caddy \
  git cmake gcc-c++ make vulkan-devel glslc spirv-tools spirv-headers-devel

# also install other fun things
dnf5 install -y  incus qemu-kvm virt-manager

