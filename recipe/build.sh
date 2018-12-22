#!/bin/bash

chmod +x configure

./configure --prefix=$PREFIX --enable-cxx --enable-fat

make
make check
make install

# This overlaps with libgcc-ng:
rm -rf ${PREFIX}/share/info/dir
