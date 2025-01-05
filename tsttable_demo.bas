
#include once "bi/collectc.bi"
#include once "crt/stdio.bi"
    ' 创建一个新的TSTTable
    Dim tstTable As CC_TSTTable Ptr
    
    If (cc_tsttable_new(@tstTable) <> CC_OK) Then 
       Print "三叉搜索树表初始化错误"
       Sleep
       End 
    End If

    '  插入键值对 add
    Dim key1 As ZString Ptr = @"hello"
    Dim value1 As  ZString Ptr = @"world"
    If (cc_tsttable_add(tstTable, key1, value1) <> CC_OK) Then 
        Print "Add key pair error",*key1,*value1
    End If

    Dim key2 As  ZString Ptr =  @"foo"
    Dim value2 As  ZString Ptr = @"bar"
    If (cc_tsttable_add(tstTable, key2, value2) <> CC_OK) Then 
        Print "Add key pair error",*key2,*value2
    End If

    '  搜索键值对search value
    Dim searchKey As  ZString Ptr = @"hello"
    Dim foundValue As ZString Ptr 
   Dim ret As cc_stat= cc_tsttable_get(tstTable, searchKey,@foundValue)
    If (ret=cc_ok) Then 
        printf(!"Found value for key '%s': %s\n", searchKey, foundValue)
      Else 
        printf(!"Key not found.\n")
    End If

    '  删除键值对
    If (cc_tsttable_remove(tstTable, key1,@value1) <> CC_OK) Then  'remove Add key pair
         printf("Key1 remove failed.\n")
    End If

    '  清理 clear TSTTable 
    cc_tsttable_destroy(tstTable)

   Sleep