
#include once "bi/cc_array.bi"
#include once "crt/stdio.bi"
#inclib "collectc"
Dim ar As CC_Array Ptr
    cc_array_new(@ar)
    cc_array_add(ar, @!"Hello World!\n")
    cc_array_add(ar, @"���") 
    cc_array_add(ar, @"Ԫ��")
    Print "����Ԫ�ظ���:" & cc_array_size(ar)
    Dim str_ As Any Ptr
    cc_array_get_at(ar, 1, @str_)
    printf("1����ֵΪ:%s", str_)
    Print
    'ɾ��Ԫ��
    Dim out_ As Any Ptr
    cc_array_remove_at(ar, 1, @out_)
    printf("�Ѿ�ɾ��1��������Ԫ��:%s", out_)
     Print
    Print "������Ԫ�ظ���:" & cc_array_size(ar)
    Dim str1_ As Any Ptr
    cc_array_get_at(ar, 1, @str1_)
    printf("1��������ֵΪ:%s", str1_)
    cc_array_destroy(ar)    
sleep
