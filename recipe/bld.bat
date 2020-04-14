mkdir build
cd build

cmake   -GNinja ^
        -DCMAKE_INSTALL_PREFIX="%PREFIX%" ^
        -DCMAKE_INSTALL_LIBDIR="%LIBRARY_LIB%" ^
        -DCMAKE_INSTALL_INCLUDEDIR="%LIBRARY_INC%" ^
        -DCMAKE_INSTALL_BINDIR="%LIBRARY_BIN%" ^
        -DCMAKE_INSTALL_DATADIR="%LIBRARY_PREFIX%" ^
        ..

cmake --build . --target install --config Release
