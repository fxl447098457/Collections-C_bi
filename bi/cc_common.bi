#pragma once
#ifndef COLLECTIONS_C_COMMON_H

#define COLLECTIONS_C_COMMON_H
#include once "crt/stdlib.bi"
#include once "crt/stdint.bi"
#include once "crt/string.bi"

extern "C"

const MAX_POW_TWO = cuint(1) shl 31

type bool as long
type cc_stat as long
enum
   CC_OK = 0
   CC_ERR_ALLOC = 1
   CC_ERR_INVALID_CAPACITY = 2
   CC_ERR_INVALID_RANGE = 3
   CC_ERR_MAX_CAPACITY = 4
   CC_ERR_KEY_NOT_FOUND = 6
   CC_ERR_VALUE_NOT_FOUND = 7
   CC_ERR_OUT_OF_RANGE = 8
   CC_ITER_END = 9
end enum

const CC_MAX_ELEMENTS = cuint(-2)
declare function cc_common_cmp_str(byval key1 as const any ptr, byval key2 as const any ptr) as long
declare function CC_CMP_STRING alias "cc_common_cmp_str"(byval key1 as const any ptr, byval key2 as const any ptr) as long
End Extern
#endif