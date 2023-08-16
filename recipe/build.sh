#!/usr/bin/env bash

if [[ $(uname) == "Linux" ]]; then
  export LDFLAGS="$LDFLAGS -Wl,-rpath-link,$PREFIX/lib"
fi

cmake ${CMAKE_ARGS} -S . -B build \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DCMAKE_PREFIX_PATH="${PREFIX}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DALLOW_OPENBLAS_MACOS=ON \
        -DALLOW_BLAS_LAPACK_MACOS=ON \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DBUILD_SMOKE_TEST=ON

cmake --build build -j${CPU_COUNT}
cmake --install build
if [[ "${cross_target_platform}" == "${build_platform}" || "${CMAKE_CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
    CTEST_OUTPUT_ON_FAILURE=1 cmake --build build --target test
fi

