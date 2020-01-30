#!/bin/bash

chmod +x configure

if [[ "$target_platform" == "linux-ppc64le" ]]; then
  # HOST="powerpc64le-conda-linux-gnu" masks the fact that we are only
  # building for power8 and uses an older POWER architecture.
  GMP_HOST="power8-pc-linux-gnu"
else
  GMP_HOST=$HOST
fi

./configure --prefix=$PREFIX --enable-cxx --enable-fat --host=$GMP_HOST

make -j${CPU_COUNT}
make check -j${CPU_COUNT}
make install
