
#include once "bi/cc_array.bi"
#include once "crt/stdio.bi"
#inclib "collectc"
Dim ar As CC_Array Ptr
    cc_array_new(@ar)
    cc_array_add(ar, @!"Hello World!\n")
    cc_array_add(ar, @"你好") 
    cc_array_add(ar, @"元旦")
    Print "数组元素个数:" & cc_array_size(ar)
    Dim str_ As Any Ptr
    cc_array_get_at(ar, 1, @str_)
    printf("1处的值为:%s", str_)
    Print
    '删除元素
    Dim out_ As Any Ptr
    cc_array_remove_at(ar, 1, @out_)
    printf("已经删除1索引处的元素:%s", out_)
     Print
    Print "新数组元素个数:" & cc_array_size(ar)
    Dim str1_ As Any Ptr
    cc_array_get_at(ar, 1, @str1_)
    printf("1索引处的值为:%s", str1_)
    cc_array_destroy(ar)    
sleep
