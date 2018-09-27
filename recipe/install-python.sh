#!/bin/bash

set -e

# configure only python bindings and pure-python extras
./configure \
	--prefix=$PREFIX \
	--enable-swig-iface \
	--enable-swig-python \
	--enable-python \
	--disable-doxygen \
	--disable-gcc-flags \
	--enable-silent-rules

# build
make -j ${CPU_COUNT}

# test
make -j ${CPU_COUNT} -C test/python check

# install
make -j ${CPU_COUNT} -C swig install-exec-am  # swig bindings
make -j ${CPU_COUNT} -C python install  # pure-python extras
