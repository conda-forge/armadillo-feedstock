cmake -GNinja ^
      -DCMAKE_INSTALL_PREFIX:PATH="%PREFIX%" ^
      -DCMAKE_INSTALL_LIBDIR:PATH="%LIBRARY_LIB%" ^
      -DCMAKE_INSTALL_INCLUDEDIR:PATH="%LIBRARY_INC%" ^
      -DCMAKE_INSTALL_BINDIR:PATH="%LIBRARY_BIN%" ^
      -DCMAKE_INSTALL_DATADIR:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_SMOKE_TEST=ON ^
      -S . -B build

cmake --build build

cmake --install build

set CTEST_OUTPUT_ON_FAILURE=1
cmake --build build --target test 
