#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Pull caddy in
dnf5 install -y dnf5-plugins
dnf5 copr enable @caddy/caddy

### Install packages
dnf5 install -y \
  rocm-smi fish \
  podman-compose caddy \
  git \
  incus incus-agent qemu-kvm qemu-img virt-manager
