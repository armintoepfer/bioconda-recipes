#!/usr/bin/env bash
set -xe
export BOOST_ROOT="${PREFIX}"
export PKG_CONFIG_LIBDIR="${PREFIX}"/lib/pkgconfig

# configure
meson \
  --libdir lib \
  --prefix "${PREFIX}" \
  -Dtests=false \
  --wrap-mode=forcefallback \
  --default-library=static \
  build .

# build
ninja -C build -v

# install
ninja -C build -v install
