#!/usr/bin/env bash

mkdir -p build
cd build

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
if [[ `uname` != 'Darwin' ]]; then
    # need to update LD_LIBRARY_PATH for libarmadillo.so to be found by main
    export LD_LIBRARY_PATH="${PREFIX}/lib:${LD_LIBRARY_PATH}"
fi
cd ${SRC_DIR}/tests && make && ./main
