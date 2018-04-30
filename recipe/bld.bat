mkdir build
cd build

REM Trick to avoid CMake/sh.exe error
ren "C:\Program Files\Git\usr\bin\sh.exe" _sh.exe

cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX="%PREFIX%" -DCMAKE_INSTALL_LIBDIR="%LIBRARY_LIB%" -DCMAKE_INSTALL_INCLUDEDIR="%LIBRARY_INC%" -DCMAKE_INSTALL_BINDIR="%LIBRARY_BIN%" -DCMAKE_INSTALL_DATADIR="%LIBRARY_PREFIX%"..

%LIBRARY_PREFIX%\mingw-w64\bin\mingw32-make
%LIBRARY_PREFIX%\mingw-w64\bin\mingw32-make install
