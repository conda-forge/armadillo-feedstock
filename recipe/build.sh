#!/usr/bin/env bash

mkdir -p build
cd build

 cmake .. \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DCMAKE_PREFIX_PATH="${PREFIX}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR="lib" \

make -j${CPU_COUNT}
make install
cd ${SRC_DIR}/tests && make LIB_FLAGS="$LDFLAGS -larmadillo" && ./main
