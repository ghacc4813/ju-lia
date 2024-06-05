// This file is a part of Julia. License is MIT: https://julialang.org/license

#include <mutex>
#include <condition_variable>
#include <llvm/ADT/DenseMap.h>
#include "julia.h"
#include "julia_internal.h"
#include "julia_assert.h"

#ifdef __cplusplus
extern "C" {
#endif

using namespace llvm;

static std::recursive_mutex engine_lock;
static std::condition_variable engine_wait;
static DenseMap<std::pair<jl_method_instance_t*, jl_value_t*>, std::pair<int, jl_code_instance_t*>> Reservations;

jl_code_instance_t *jl_engine_reserve(jl_method_instance_t *m, jl_value_t *owner)
{
    jl_task_t *ct = jl_current_task;
    engine_lock.lock();
    auto &ci = Reservations[std::make_pair(m, owner)];
    if (ci.second != NULL)
        return ci.second;
    ci.first = ct->tid;
    ci.second = jl_new_codeinst_uninit(m, owner);
    return ci.second;
}

STATIC_INLINE int gc_marked(uintptr_t bits) JL_NOTSAFEPOINT
{
    return (bits & GC_MARKED) != 0;
}

void jl_engine_sweep(void)
{
    for (auto I = Reservations.begin(); I != Reservations.end(); ++I)
        if (!gc_marked(jl_astaggedvalue(I->second.second)->bits.gc))
            Reservations.erase(I);
}

void jl_engine_fulfill(jl_code_instance_t *ci, jl_code_info_t *src)
{
    engine_lock.unlock();
}


#ifdef __cplusplus
}
#endif
