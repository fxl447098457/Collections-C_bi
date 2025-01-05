
#include once "bi/collectc.bi"
#include once "crt/stdio.bi"

   Dim ring_buf As CC_Rbuf Ptr
      cc_rbuf_new(@ring_buf)
    ring_buf->SIZE = CUInt(100)
    ' 向缓冲区添加元素，一次一个
    For i As Long = 0 To  999
        cc_rbuf_enqueue(ring_buf, CULngInt(i))
    Next
    
    '  验证缓冲区中的数据项数量
    Print "缓冲区中的数据项数量" & cc_rbuf_size(ring_buf)
    
    ' 从缓冲区中逐个移除元素
    Dim buf As ULongInt
    While (cc_rbuf_dequeue(ring_buf, @buf) = CC_OK)
        buf =  cc_rbuf_size(ring_buf)
        printf(!"Read: %d\n", buf)
    Wend
    
    printf(!"\n===============\n")
    ' 检查缓冲区是否为空
    Print  "缓冲区是否为空",cc_rbuf_is_empty(ring_buf)
   cc_rbuf_destroy(ring_buf)
   Sleep
