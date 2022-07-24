// This file is a part of Julia. License is MIT: https://julialang.org/license

#include <stdlib.h>
#include "julia.h"
#include "wsqueue.h"

#ifdef __cplusplus
extern "C" {
#endif

ws_array_t *create_ws_array(size_t capacity, size_t eltsz)
{
    ws_array_t *a = (ws_array_t *)malloc(sizeof(ws_array_t));
    a->buffer = (void **)malloc(capacity * eltsz);
    a->capacity = capacity;
    return a;
}

// ---------- Chase-Lev work-stealing queue

int ws_queue_push(ws_queue_t *q, void *v)
{
    int64_t b = jl_atomic_load_relaxed(&q->bottom);
    int64_t t = jl_atomic_load_acquire(&q->top);
    ws_array_t *a = jl_atomic_load_relaxed(&q->array);
    if (__unlikely(b - t > a->capacity - 1)) {
        // Queue is full
        return 0;
    }
    jl_atomic_store_relaxed((_Atomic(void *) *)&a->buffer[b % a->capacity], v);
    jl_fence_release();
    jl_atomic_store_relaxed(&q->bottom, b + 1);
    return 1;
}

void *ws_queue_pop(ws_queue_t *q)
{
    int64_t b = jl_atomic_load_relaxed(&q->bottom) - 1;
    ws_array_t *a = jl_atomic_load_relaxed(&q->array);
    jl_atomic_store_relaxed(&q->bottom, b);
#if defined(_CPU_X86_64_)
    __asm__ volatile ("lock orq $0, (%rsp)");
#else
    jl_fence();
#endif
    int64_t t = jl_atomic_load_relaxed(&q->top);
    void *v;
    if (__likely(t <= b)) {
        v = jl_atomic_load_relaxed((_Atomic(void *) *)&a->buffer[b % a->capacity]);
        if (t == b) {
            if (!jl_atomic_cmpswap(&q->top, &t, t + 1))
                v = NULL;
            jl_atomic_store_relaxed(&q->bottom, b + 1);
        }
    }
    else {
        v = NULL;
        jl_atomic_store_relaxed(&q->bottom, b + 1);
    }
    return v;
}

void *ws_queue_steal_from(ws_queue_t *q)
{
    int64_t t = jl_atomic_load_acquire(&q->top);
#if defined(_CPU_X86_64_)
    __asm__ volatile ("lock orq $0, (%rsp)");
#else
    jl_fence();
#endif
    int64_t b = jl_atomic_load_acquire(&q->bottom);
    void *v = NULL;
    if (t < b) {
        ws_array_t *a = jl_atomic_load_relaxed(&q->array);
        v = jl_atomic_load_relaxed((_Atomic(void *) *)&a->buffer[t % a->capacity]);
        if (!jl_atomic_cmpswap(&q->top, &t, t + 1))
            return NULL;
    }
    return v;
}

// ---------- Idempotent work-stealing queue

int idemp_ws_queue_push(idemp_ws_queue_t *iwsq, void *elt)
{
    ws_anchor_t anc = jl_atomic_load_acquire(&iwsq->anchor);
    ws_array_t *ary = jl_atomic_load_relaxed(&iwsq->array);
    if (anc.size == ary->capacity)
        // Queue overflow
        return 0;
    ary->buffer[(anc.head + anc.size) % ary->capacity] = elt;
    anc.size++;
    anc.tag++;
    jl_atomic_store_release(&iwsq->anchor, anc);
    return 1;
}

void *idemp_ws_queue_pop(idemp_ws_queue_t *iwsq)
{
    ws_anchor_t anc = jl_atomic_load_acquire(&iwsq->anchor);
    ws_array_t *ary = jl_atomic_load_relaxed(&iwsq->array);
    if (anc.size == 0)
        // Empty queue
        return NULL;
    anc.size--;
    void *elt = ary->buffer[(anc.head + anc.size) % ary->capacity];
    jl_atomic_store_release(&iwsq->anchor, anc);
    return elt;
}

void *idemp_ws_queue_steal_from(idemp_ws_queue_t *iwsq)
{
    ws_anchor_t anc = jl_atomic_load_acquire(&iwsq->anchor);
    ws_array_t *ary = jl_atomic_load_acquire(&iwsq->array);
    if (anc.size == 0)
        // Empty queue
        return NULL;
    void *elt = ary->buffer[anc.head % ary->capacity];
    ws_anchor_t anc2 = {(anc.head + 1) % ary->capacity, anc.size - 1, anc.tag};
    if (!jl_atomic_cmpswap(&iwsq->anchor, &anc, anc2))
        // Steal failed
        return NULL;
    return elt;
}

#ifdef __cplusplus
}
#endif
