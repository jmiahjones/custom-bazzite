#!/bin/bash
set -ouex pipefail

# Clone llama.cpp source code (depth=1 keeps it fast)
git clone --depth=1 https://github.com/ggml-org/llama.cpp.git
cd llama.cpp

# Configure with CMAKE using your specific CPU flags
mkdir build
cmake -B build \
  -DGGML_VULKAN=ON \
  -DGGML_NATIVE=OFF \
  -DGGML_AVX2=ON \
  -DGGML_FMA=ON \
  -DGGML_BMI1=ON \
  -DGGML_BMI2=ON \
  -DGGML_SSE4_2=ON && \
  cmake --build build --config Release -j$(nproc)

ls -lah build/

# Copy binaries to the system path
cp -r build/bin/* /usr/bin/

# CLEANUP: Remove source and build tools to keep image size small
cd ../..
rm -rf llama.cpp
dnf5 remove -y cmake gcc-c++ make vulkan-devel glslc spirv-tools spirv-headers-devel
dnf5 clean all
