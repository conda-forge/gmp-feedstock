#!/bin/bash

chmod +x configure

./configure --prefix=$PREFIX --enable-cxx --enable-fat --host=$HOST

make
make check
make install
