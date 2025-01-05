#pragma once
#ifndef COLLECTIONS_C_CC_TREETABLE_H

#define COLLECTIONS_C_CC_TREETABLE_H
#include once "cc_common.bi"

extern "C"

Type CC_TreeTable As cc_treetable_s

type rbnode_s
   key as any ptr
   value as any ptr
   color as byte
   parent as rbnode_s ptr
   left_ as rbnode_s ptr
   right_ as rbnode_s ptr
end type

type RBNode as rbnode_s

type tree_table_entry_s
   key as any ptr
   value as any ptr
end type

type CC_TreeTableEntry as tree_table_entry_s

type tree_table_iter_s
   table As CC_TreeTable Ptr
   current as RBNode ptr
   next_ as RBNode ptr
end type

type CC_TreeTableIter as tree_table_iter_s

type cc_treetable_conf_s
   cmp as function(byval k1 as const any ptr, byval k2 as const any ptr) as long
   mem_alloc as function(byval size as uinteger) as any ptr
   mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
   mem_free as sub(byval block as any ptr)
end type

type CC_TreeTableConf as cc_treetable_conf_s
declare sub cc_treetable_conf_init(byval conf as CC_TreeTableConf ptr)
declare function cc_treetable_new(byval cmp as function(byval as const any ptr, byval as const any ptr) as long, byval tt as CC_TreeTable ptr ptr) as cc_stat
declare function cc_treetable_new_conf(byval conf as const CC_TreeTableConf const ptr, byval tt as CC_TreeTable ptr ptr) as cc_stat
declare function cc_treetable_struct_size() as uinteger
declare sub cc_treetable_destroy(byval table as CC_TreeTable ptr)
declare function cc_treetable_add(byval table as CC_TreeTable ptr, byval key as any ptr, byval val as any ptr) as cc_stat
declare function cc_treetable_remove(byval table as CC_TreeTable ptr, byval key as any ptr, byval out_ as any ptr ptr) as cc_stat
declare sub cc_treetable_remove_all(byval table as CC_TreeTable ptr)
declare function cc_treetable_remove_first(byval table as CC_TreeTable ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treetable_remove_last(byval table as CC_TreeTable ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treetable_get(byval table as const CC_TreeTable const ptr, byval key as const any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treetable_get_first_value(byval table as const CC_TreeTable const ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treetable_get_first_key(byval table as const CC_TreeTable const ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treetable_get_last_value(byval table as const CC_TreeTable const ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treetable_get_last_key(byval table as const CC_TreeTable const ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treetable_get_greater_than(byval table as const CC_TreeTable const ptr, byval key as const any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treetable_get_lesser_than(byval table as const CC_TreeTable const ptr, byval key as const any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treetable_size(byval table as const CC_TreeTable const ptr) as uinteger
declare function cc_treetable_contains_key(byval table as const CC_TreeTable const ptr, byval key as const any ptr) as bool
declare function cc_treetable_contains_value(byval table as const CC_TreeTable const ptr, byval value as const any ptr) as uinteger
declare sub cc_treetable_foreach_key(byval table as CC_TreeTable ptr, byval op as sub(byval as const any ptr))
declare sub cc_treetable_foreach_value(byval table as CC_TreeTable ptr, byval op as sub(byval as any ptr))
declare sub cc_treetable_iter_init(byval iter as CC_TreeTableIter ptr, byval table as CC_TreeTable ptr)
declare function cc_treetable_iter_next(byval iter as CC_TreeTableIter ptr, byval entry as CC_TreeTableEntry ptr) as cc_stat
declare function cc_treetable_iter_remove(byval iter as CC_TreeTableIter ptr, byval out_ as any ptr ptr) as cc_stat
#macro CC_TREETABLE_FOREACH(entry, treetable, body)
   scope
      dim as  TreetableIter cc_treetable_iter_53d46d2a04458e7b
      cc_treetable_iter_init(@cc_treetable_iter_53d46d2a04458e7b, treetable)
      dim val_ as CC_TreeTableEntry ptr
      while (cc_treetable_iter_next(@cc_treetable_iter_53d46d2a04458e7b, @entry)<>CC_ITER_END) 
            body
        wend
   end scope
#endmacro

end extern
#endif