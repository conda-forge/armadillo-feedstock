#!/usr/bin/env bash

mkdir -p build
cd build

# remove --as-needed (copied from conda-forge/suitesparse-feedstock#41)
# conda compilers strip links that aren't used by default,
# even if explicitly given.
# This may result in undefined symbols
# when libraries are intended to bundle others they may
# not use themselves (e.g. umfpack bundling cholmod)
export LDFLAGS=${LDFLAGS/-Wl,--as-needed/}

if [[ `uname` == 'Darwin' ]]; then

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DCMAKE_MACOSX_RPATH="ON" \
        -DCMAKE_INSTALL_RPATH="${PREFIX}/lib"

else

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DCMAKE_INSTALL_LIBDIR="lib"
fi

make
make install
cd ${SRC_DIR}/tests && make && ./main
