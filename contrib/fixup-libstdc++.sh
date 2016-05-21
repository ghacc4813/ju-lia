#!/bin/sh
# This file is a part of Julia. License is MIT: http://julialang.org/license

# Run as: fixup-libstdc++.sh <$libdir>

if [ -z "$1" ]; then
    echo "Usage: $0 <libdir>"
    exit 1
fi

libdir=$1

if [ ! -f "$libdir/libjulia.so" ]; then
    echo "ERROR: Could not open $libdir/libjulia.so" >&2
    exit 2
fi

find_shlib ()
{
    if [ -f "$libdir/lib$1.so" ]; then
        ldd "$libdir/lib$1.so" | grep $2 | cut -d' ' -f3 | xargs
    fi
}

# Discover libstdc++ location and name
LIBSTD=$(find_shlib "julia" "libstdc++.so")
LIBSTD_NAME=$(basename $LIBSTD)
LIBSTD_DIR=$(dirname $LIBSTD)

if [ ! -f "$libdir/$LIBSTD_NAME" ] && [ -f "$LIBSTD_DIR/$LIBSTD_NAME" ]; then
    cp -v "$LIBSTD_DIR/$LIBSTD_NAME" "$libdir"
    chmod 755 "$libdir/$LIBSTD_NAME"
fi
