#!/usr/bin/env bash
# ENVDIR=${ENVDIR:-~/pkgenv}
ENVDIR=${ENVDIR:-/home/user/pkgenv}
# If CentOS server, set C++ compiler manually
if [ -f /etc/redhat-release ]; then
    export CC=/opt/ohpc/pub/compiler/gcc/8.3.0/bin/gcc
    export CXX=/opt/ohpc/pub/compiler/gcc/8.3.0/bin/g++
fi

mkdir -p build
pushd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$ENVDIR \
      -DCMAKE_INSTALL_PREFIX=$ENVDIR \
      -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE \
      -DCMAKE_INSTALL_RPATH=$ENVDIR \
      -DFCL_INCLUDE_DIRS=$ENVDIR/include/fcl \
      -DSERVER_BUILD=TRUE \
      -DPYTHON_LIBRARY=/app/miniconda3/lib/libpython3.8.so \
      -DPYTHON_INCLUDE_DIRS=/app/miniconda3/include/python3.8 \
      -DPYTHON3_LIBRARY=/app/miniconda3/lib/libpython3.8.so \
      -DPYTHON3_INCLUDE_DIRS=/app/miniconda3/include/python3.8 \
      -DPYTHON_DEFAULT_EXECUTABLE=/app/miniconda3/bin/python3 \
      ..
popd
