// This file is a part of Julia. License is MIT: https://julialang.org/license

/*
  Hashing
*/
#include <stdlib.h>
#include "dtypes.h"
#include "utils.h"
#include "hashing.h"
#include "timefuncs.h"
#include "ios.h"

#ifdef __cplusplus
extern "C" {
#endif

// FxHasher
uint32_t int32hash(uint32_t a)
{
    return a * 0x9e3779b9;
}

uint64_t int64hash(uint64_t key)
{
    return key * 0x517cc1b727220a95;
}

uint32_t int64to32hash(uint64_t key)
{
    uint32_t h = 0;
    h = bitmix(h, (uint32_t)key);
    h = bitmix(h, (uint32_t)(key >> 32));
    return h;
}

#include "MurmurHash3.c"

#define _MHASH_SEED_ 0xcafe8881

uint64_t memhash(const char *buf, size_t n)
{
    uint64_t out[2];

    // TODO: expose 128-bit hash
#ifdef _P64
    MurmurHash3_x64_128(buf, n, _MHASH_SEED_, out);
#else
    MurmurHash3_x86_128(buf, n, _MHASH_SEED_, out);
#endif
    return out[1];
}

uint64_t memhash_seed(const char *buf, size_t n, uint32_t seed)
{
    uint64_t out[2];

    // TODO: expose 128-bit hash
#ifdef _P64
    MurmurHash3_x64_128(buf, n, seed, out);
#else
    MurmurHash3_x86_128(buf, n, seed, out);
#endif
    return out[1];
}

uint32_t memhash32(const char *buf, size_t n)
{
    uint32_t out;

    MurmurHash3_x86_32(buf, n, _MHASH_SEED_, &out);
    return out;
}

uint32_t memhash32_seed(const char *buf, size_t n, uint32_t seed)
{
    uint32_t out;

    MurmurHash3_x86_32(buf, n, seed, &out);
    return out;
}

#ifdef __cplusplus
}
#endif
