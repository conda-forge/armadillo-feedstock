cmake -GNinja ^
      -DCMAKE_INSTALL_PREFIX="%PREFIX%" ^
      -DCMAKE_INSTALL_LIBDIR="%LIBRARY_LIB%" ^
      -DCMAKE_INSTALL_INCLUDEDIR="%LIBRARY_INC%" ^
      -DCMAKE_INSTALL_BINDIR="%LIBRARY_BIN%" ^
      -DCMAKE_INSTALL_DATADIR="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_SMOKE_TEST=ON ^
      -S . -B build

cmake --build build

cmake --install build

set CTEST_OUTPUT_ON_FAILURE=1
cmake --build build --target test 
