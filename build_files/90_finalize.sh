#!/bin/bash
set -ouex pipefail

rm -rf llama.cpp
systemctl enable podman.socket

