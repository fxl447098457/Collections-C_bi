
#include once "crt/stdio.bi"
#include once "bi/collectc.bi"

   Dim list As CC_List Ptr
   cc_list_new(@list)
   cc_list_add(list, @"a")
   cc_list_add(list, @"n")
   Dim s As Any Ptr
   Dim ret As cc_stat = cc_list_get_at(list, 1,@s)
   If ret = CC_OK Then printf("%s", s)
   cc_list_destroy(list)
   Sleep
