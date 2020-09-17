#!/usr/bin/env bash

if [[ $(uname) == "Linux" ]]; then
  export LDFLAGS="$LDFLAGS -Wl,-rpath-link,$PREFIX/lib"
fi

cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DCMAKE_PREFIX_PATH="${PREFIX}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DALLOW_OPENBLAS_MACOS=ON \
        -DALLOW_BLAS_LAPACK_MACOS=ON \
        -DCMAKE_INSTALL_LIBDIR="lib"

cmake --build build -j${CPU_COUNT}
cmake --install build

cd tests && make LIB_FLAGS="$LDFLAGS -larmadillo" && ./main
