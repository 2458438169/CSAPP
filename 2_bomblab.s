Dump of assembler code for function phase_1:
   0x0000000000400ee0 <+0>:     sub    $0x8,%rsp   ;开辟栈空间
   0x0000000000400ee4 <+4>:     mov    $0x402400,%esi   ;将0x402400地址的值移动到%esi中
   0x0000000000400ee9 <+9>:     callq  0x401338 <strings_not_equal>  ;调用一个名为strings_not_equal的函数，接受%esi与%rdi寄存器中的值进行比较，相同返回0，不相同返回1到%eax中
   0x0000000000400eee <+14>:    test   %eax,%eax  ;测试eax是否为0，是返回0
   0x0000000000400ef0 <+16>:    je     0x400ef7 <phase_1+23>  ;为零则跳转
   0x0000000000400ef2 <+18>:    callq  0x40143a <explode_bomb>  ;否则爆炸
   0x0000000000400ef7 <+23>:    add    $0x8,%rsp  ;释放栈空间
   0x0000000000400efb <+27>:    retq   


Dump of assembler code for function phase_2:
   0x0000000000400efc <+0>:     push   %rbp
   0x0000000000400efd <+1>:     push   %rbx
   0x0000000000400efe <+2>:     sub    $0x28,%rsp   ;开辟栈空间
   0x0000000000400f02 <+6>:     mov    %rsp,%rsi   ;栈顶元素存入%rsi
   0x0000000000400f05 <+9>:     callq  0x40145c <read_six_numbers>   ;调用read_six_numbers函数，读取输入的六个数字，存储在%rsp
   0x0000000000400f0a <+14>:    cmpl   $0x1,(%rsp)   ;比较立即数1和%rsp地址指向的值
   0x0000000000400f0e <+18>:    je     0x400f30 <phase_2+52>   ;相同则跳转至52
   0x0000000000400f10 <+20>:    callq  0x40143a <explode_bomb>   ;   不同则爆炸
   0x0000000000400f15 <+25>:    jmp    0x400f30 <phase_2+52>   ;挑转至52
   0x0000000000400f17 <+27>:    mov    -0x4(%rbx),%eax   ;%rbx地址-4指向的值存入%eax
   0x0000000000400f1a <+30>:    add    %eax,%eax   ;%eax的值翻倍
   0x0000000000400f1c <+32>:    cmp    %eax,(%rbx)   ;比较%eax的值和%rbx存储地址指向的值
   0x0000000000400f1e <+34>:    je     0x400f25 <phase_2+41> ;相同则跳转至41
   0x0000000000400f20 <+36>:    callq  0x40143a <explode_bomb>   ;不同则爆炸
   0x0000000000400f25 <+41>:    add    $0x4,%rbx   ;%rbx地址+0x4
   0x0000000000400f29 <+45>:    cmp    %rbp,%rbx   ;比较%rbp和%rbx存储的地址
   0x0000000000400f2c <+48>:    jne    0x400f17 <phase_2+27>   ;不同则跳转至27
   0x0000000000400f2e <+50>:    jmp    0x400f3c <phase_2+64>   ;相同则跳转至64
   0x0000000000400f30 <+52>:    lea    0x4(%rsp),%rbx   ;%rsp地址+0x4存入%rbx
   0x0000000000400f35 <+57>:    lea    0x18(%rsp),%rbp   ;%rsp地址+0x18存入%rbp
   0x0000000000400f3a <+62>:    jmp    0x400f17 <phase_2+27>   ;跳转至27
   0x0000000000400f3c <+64>:    add    $0x28,%rsp   ;释放栈空间
   0x0000000000400f40 <+68>:    pop    %rbx
   0x0000000000400f41 <+69>:    pop    %rbp
   0x0000000000400f42 <+70>:    retq   


Dump of assembler code for function phase_3:
   0x0000000000400f43 <+0>:     sub    $0x18,%rsp   ;开辟栈空间
   0x0000000000400f47 <+4>:     lea    0xc(%rsp),%rcx   ;%rsp地址+0xc存入%rcx
   0x0000000000400f4c <+9>:     lea    0x8(%rsp),%rdx   ;%rsp地址+0x8存入%rdx
   0x0000000000400f51 <+14>:    mov    $0x4025cf,%esi   ;将0x4025cf存入%esi
   0x0000000000400f56 <+19>:    mov    $0x0,%eax   ;将0x0存入%eax
   0x0000000000400f5b <+24>:    callq  0x400bf0 <__isoc99_sscanf@plt>   ;调用函数将输入的两个整数存入%rdx和%rcx，统计到%eax
   0x0000000000400f60 <+29>:    cmp    $0x1,%eax   ;比较0x1和%eax的值
   0x0000000000400f63 <+32>:    jg     0x400f6a <phase_3+39>   ;如果大于则跳转至39
   0x0000000000400f65 <+34>:    callq  0x40143a <explode_bomb>   ;否则爆炸
   0x0000000000400f6a <+39>:    cmpl   $0x7,0x8(%rsp)   ;比较0x7和%rsp地址+0x8处的值(%rdx)   %rdx应小于0x7
   0x0000000000400f6f <+44>:    ja     0x400fad <phase_3+106>   ;大于则跳转至106，爆炸
   0x0000000000400f71 <+46>:    mov    0x8(%rsp),%eax   ;否则将%rsp+0x8处的值(%rdx)存入%eax
   0x0000000000400f75 <+50>:    jmpq   *0x402470(,%rax,8)   ;跳转到%rax乘以8加上0x402470指向的地址处
   0x0000000000400f7c <+57>:    mov    $0xcf,%eax   ;将0xcf存入%eax
   0x0000000000400f81 <+62>:    jmp    0x400fbe <phase_3+123>   ;跳转至123处
   0x0000000000400f83 <+64>:    mov    $0x2c3,%eax   ;将0x2c3存入%eax
   0x0000000000400f88 <+69>:    jmp    0x400fbe <phase_3+123>   ;跳转至123处
   0x0000000000400f8a <+71>:    mov    $0x100,%eax   ;将0x100存入%eax
   0x0000000000400f8f <+76>:    jmp    0x400fbe <phase_3+123>   ;跳转至123处
   0x0000000000400f91 <+78>:    mov    $0x185,%eax   ;将0x185存入%eax
   0x0000000000400f96 <+83>:    jmp    0x400fbe <phase_3+123>   ;跳转至123处
   0x0000000000400f98 <+85>:    mov    $0xce,%eax   ;将0xce存入%eax
   0x0000000000400f9d <+90>:    jmp    0x400fbe <phase_3+123>   ;跳转至123处
   0x0000000000400f9f <+92>:    mov    $0x2aa,%eax   ;将0x2aa存入%eax
   0x0000000000400fa4 <+97>:    jmp    0x400fbe <phase_3+123>   ;跳转至123处
   0x0000000000400fa6 <+99>:    mov    $0x147,%eax   ;将0x147存入%eax
   0x0000000000400fab <+104>:   jmp    0x400fbe <phase_3+123>   ;跳转至123处
   0x0000000000400fad <+106>:   callq  0x40143a <explode_bomb>   ;爆炸
   0x0000000000400fb2 <+111>:   mov    $0x0,%eax   ;将0x0存入%eax
   0x0000000000400fb7 <+116>:   jmp    0x400fbe <phase_3+123>   ;跳转至123处
   0x0000000000400fb9 <+118>:   mov    $0x137,%eax   ;将0x137存入%eax
   0x0000000000400fbe <+123>:   cmp    0xc(%rsp),%eax   ;对比%rsp地址加上0xc的值(%rcx)与%eax的值
   0x0000000000400fc2 <+127>:   je     0x400fc9 <phase_3+134>   ;相同则跳转至134
   0x0000000000400fc4 <+129>:   callq  0x40143a <explode_bomb>   ;不同则爆炸
   0x0000000000400fc9 <+134>:   add    $0x18,%rsp   ;释放栈空间
   0x0000000000400fcd <+138>:   retq   
End of assembler dump.


Dump of assembler code for function func4:
   0x0000000000400fce <+0>:     sub    $0x8,%rsp   ;开辟栈空间
   0x0000000000400fd2 <+4>:     mov    %edx,%eax   ;将%edx的值存入%eax
   0x0000000000400fd4 <+6>:     sub    %esi,%eax   ;%eax-%esi存入%eax
   0x0000000000400fd6 <+8>:     mov    %eax,%ecx   ;将%eax的值存入%ecx
   0x0000000000400fd8 <+10>:    shr    $0x1f,%ecx   ;将%ecx的值逻辑右移0x1f位
   0x0000000000400fdb <+13>:    add    %ecx,%eax   ;%eax+%ecx存入%eax
   0x0000000000400fdd <+15>:    sar    %eax   ;将%eax算术右移1位
   0x0000000000400fdf <+17>:    lea    (%rax,%rsi,1),%ecx   ;将%rax的地址+%rsi的地址存入%ecx
   0x0000000000400fe2 <+20>:    cmp    %edi,%ecx   ;比较%edi和%ecx的值
   0x0000000000400fe4 <+22>:    jle    0x400ff2 <func4+36>   ;小于或等于则跳转至36
   0x0000000000400fe6 <+24>:    lea    -0x1(%rcx),%edx   ;否则将%rcx地址-0x1存入%edx
   0x0000000000400fe9 <+27>:    callq  0x400fce <func4>   ;递归调用<func4>
   0x0000000000400fee <+32>:    add    %eax,%eax   ;%eax*2
   0x0000000000400ff0 <+34>:    jmp    0x401007 <func4+57>   ;跳转至57
   0x0000000000400ff2 <+36>:    mov    $0x0,%eax   ;将0x0存入%eax
   0x0000000000400ff7 <+41>:    cmp    %edi,%ecx   ;比较%edi和%ecx的值
   0x0000000000400ff9 <+43>:    jge    0x401007 <func4+57>   ;大于或等于则跳转至57
   0x0000000000400ffb <+45>:    lea    0x1(%rcx),%esi   ;否则将%rcx地址+0x1存入%esi
   0x0000000000400ffe <+48>:    callq  0x400fce <func4>   ;递归调用<func4>
   0x0000000000401003 <+53>:    lea    0x1(%rax,%rax,1),%eax   ;将%rax的地址*2+0x1存入%eax
   0x0000000000401007 <+57>:    add    $0x8,%rsp   ;释放栈空间
   0x000000000040100b <+61>:    retq   
End of assembler dump.
  
Dump of assembler code for function phase_4:
   0x000000000040100c <+0>:     sub    $0x18,%rsp   ;开辟栈空间
   0x0000000000401010 <+4>:     lea    0xc(%rsp),%rcx   ;将%rsp地址+0xc存入%rcx
   0x0000000000401015 <+9>:     lea    0x8(%rsp),%rdx   ;将%rsp地址+0x8存入%rdx
   0x000000000040101a <+14>:    mov    $0x4025cf,%esi   ;将0x4025cf存入%esi
   0x000000000040101f <+19>:    mov    $0x0,%eax   ;将0x0存入%eax
   0x0000000000401024 <+24>:    callq  0x400bf0 <__isoc99_sscanf@plt>   ;调用函数将输入的两个整数存入%rdx和%rcx，统计到%eax
   0x0000000000401029 <+29>:    cmp    $0x2,%eax   ;比较0x2和%eax的值
   0x000000000040102c <+32>:    jne    0x401035 <phase_4+41>   ;不相同则跳转至41
   0x000000000040102e <+34>:    cmpl   $0xe,0x8(%rsp)   ;比较0xe和%rsp地址+0x8处的值(%rdx)
   0x0000000000401033 <+39>:    jbe    0x40103a <phase_4+46>   ;如果小于或等于则跳转至46    %rdx小于0xe
   0x0000000000401035 <+41>:    callq  0x40143a <explode_bomb>   ;爆炸
   0x000000000040103a <+46>:    mov    $0xe,%edx   ;将0xe存入%edx
   0x000000000040103f <+51>:    mov    $0x0,%esi   ;将0x0存入%esi
   0x0000000000401044 <+56>:    mov    0x8(%rsp),%edi   ;将%rsp地址+0x8处的值存入%edi
   0x0000000000401048 <+60>:    callq  0x400fce <func4>   ;调用函数<func4>
   0x000000000040104d <+65>:    test   %eax,%eax   ;检查%eax是否为0
   0x000000000040104f <+67>:    jne    0x401058 <phase_4+76>   ;不为0则跳转至76 爆炸
   0x0000000000401051 <+69>:    cmpl   $0x0,0xc(%rsp)   ;比较0x0和%rsp地址+0xc处的值(%rcx)
   0x0000000000401056 <+74>:    je     0x40105d <phase_4+81>   ;相同则跳转至81
   0x0000000000401058 <+76>:    callq  0x40143a <explode_bomb>   ;爆炸
   0x000000000040105d <+81>:    add    $0x18,%rsp   ;释放栈空间
   0x0000000000401061 <+85>:    retq   
End of assembler dump.


Dump of assembler code for function phase_5:
   0x0000000000401062 <+0>:     push   %rbx   ;保存%rbx的值
   0x0000000000401063 <+1>:     sub    $0x20,%rsp   ;开辟栈空间
   0x0000000000401067 <+5>:     mov    %rdi,%rbx   ;将%rdi的值存入%rbx
   0x000000000040106a <+8>:     mov    %fs:0x28,%rax   ;将%fs中偏移量为0x28的值存入%rax
   0x0000000000401073 <+17>:    mov    %rax,0x18(%rsp)   ;将%rax的值存入%rsp地址+0x18处
   0x0000000000401078 <+22>:    xor    %eax,%eax   ;将%eax清零
   0x000000000040107a <+24>:    callq  0x40131b <string_length>   ;调用函数计算输入寄存器的长度，存入%rax
   0x000000000040107f <+29>:    cmp    $0x6,%eax   ;比较0x6和%eax
   0x0000000000401082 <+32>:    je     0x4010d2 <phase_5+112>   ;相同则跳转至112
   0x0000000000401084 <+34>:    callq  0x40143a <explode_bomb>   ;爆炸
   0x0000000000401089 <+39>:    jmp    0x4010d2 <phase_5+112>   ;跳转至112
   0x000000000040108b <+41>:    movzbl (%rbx,%rax,1),%ecx   ;%ecx = %rbx + %rax*1   %rbx指向最低位的字符
   0x000000000040108f <+45>:    mov    %cl,(%rsp)   ;%cl(%ecx的低八位)的值存入%rsp所指地址
   0x0000000000401092 <+48>:    mov    (%rsp),%rdx   ;将%rsp所指地址处的值存入%rdx
   0x0000000000401096 <+52>:    and    $0xf,%edx   ;取%edx的低四位
   0x0000000000401099 <+55>:    movzbl 0x4024b0(%rdx),%edx   ;%rdx地址+0x4024b0存入%edx   0x4024b0：“maduiersnfotvbyl”
   0x00000000004010a0 <+62>:    mov    %dl,0x10(%rsp,%rax,1)   ;将%dl存入%rsp+%rax+0x1处
   0x00000000004010a4 <+66>:    add    $0x1,%rax   ;%rax+0x1
   0x00000000004010a8 <+70>:    cmp    $0x6,%rax   ;比较0x6和%rax   循环六次
   0x00000000004010ac <+74>:    jne    0x40108b <phase_5+41>   ;不同则跳转至41
   0x00000000004010ae <+76>:    movb   $0x0,0x16(%rsp)   ;相同则将0x0存入%rsp+0x16   跳出循环
   0x00000000004010b3 <+81>:    mov    $0x40245e,%esi   ;将0x40245e存入%esi   0x40245e:"flyers"
   0x00000000004010b8 <+86>:    lea    0x10(%rsp),%rdi   ;将%rsp+0x10的地址存入%rdi(循环内存入字符的地址)
   0x00000000004010bd <+91>:    callq  0x401338 <strings_not_equal>   ;调用函数比较两个数，将结果存入%eax
   0x00000000004010c2 <+96>:    test   %eax,%eax   ;测试是否为0
   0x00000000004010c4 <+98>:    je     0x4010d9 <phase_5+119>   ;为0则跳转至119
   0x00000000004010c6 <+100>:   callq  0x40143a <explode_bomb>   ;否则爆炸
   0x00000000004010cb <+105>:   nopl   0x0(%rax,%rax,1)
   0x00000000004010d0 <+110>:   jmp    0x4010d9 <phase_5+119>
   0x00000000004010d2 <+112>:   mov    $0x0,%eax   ;0x0存入%eax
   0x00000000004010d7 <+117>:   jmp    0x40108b <phase_5+41>   ;跳转至41
   0x00000000004010d9 <+119>:   mov    0x18(%rsp),%rax   ;%rsp+0x18处的值存入%rax
   0x00000000004010de <+124>:   xor    %fs:0x28,%rax   ;将%fs中偏移量为0x28的值与%rax异或操作
   0x00000000004010e7 <+133>:   je     0x4010ee <phase_5+140>   ;如果%rax为0则跳转到140
   0x00000000004010e9 <+135>:   callq  0x400b30 <__stack_chk_fail@plt>   ；否则栈溢出，报错
   0x00000000004010ee <+140>:   add    $0x20,%rsp   ;释放栈空间
   0x00000000004010f2 <+144>:   pop    %rbx   ;恢复%rbx的值
   0x00000000004010f3 <+145>:   retq   
End of assembler dump.


Dump of assembler code for function phase_6:
   0x00000000004010f4 <+0>:     push   %r14
   0x00000000004010f6 <+2>:     push   %r13
   0x00000000004010f8 <+4>:     push   %r12
   0x00000000004010fa <+6>:     push   %rbp
   0x00000000004010fb <+7>:     push   %rbx
   0x00000000004010fc <+8>:     sub    $0x50,%rsp   ;%rsp=0x50
   0x0000000000401100 <+12>:    mov    %rsp,%r13   ;%r13=%rsp
   0x0000000000401103 <+15>:    mov    %rsp,%rsi   ;%rsi=%rsp
   0x0000000000401106 <+18>:    callq  0x40145c <read_six_numbers>   ;读取六个数字
   0x000000000040110b <+23>:    mov    %rsp,%r14   ;%r14=%rsp
   0x000000000040110e <+26>:    mov    $0x0,%r12d   ;%r12d=0x0
   0x0000000000401114 <+32>:    mov    %r13,%rbp   ;%rbp=%r13
   0x0000000000401117 <+35>:    mov    0x0(%r13),%eax   ;%eax=%r13
   0x000000000040111b <+39>:    sub    $0x1,%eax   ;%eax-=0x1
   0x000000000040111e <+42>:    cmp    $0x5,%eax   ;%eax与0x5比较
   0x0000000000401121 <+45>:    jbe    0x401128 <phase_6+52>   ;小于或等于则跳转至52
   0x0000000000401123 <+47>:    callq  0x40143a <explode_bomb>   ;爆炸
   0x0000000000401128 <+52>:    add    $0x1,%r12d   ;%r12d+=0x1
   0x000000000040112c <+56>:    cmp    $0x6,%r12d   ;0x6和%r12d比较
   0x0000000000401130 <+60>:    je     0x401153 <phase_6+95>   ；等于则跳转至95
   0x0000000000401132 <+62>:    mov    %r12d,%ebx   ;%ebx=%r12d
   0x0000000000401135 <+65>:    movslq %ebx,%rax   ;%rax=%ebx
   0x0000000000401138 <+68>:    mov    (%rsp,%rax,4),%eax   ;%eax=%rsp+%rax*4
   0x000000000040113b <+71>:    cmp    %eax,0x0(%rbp)   ;%eax与%rbp比较
   0x000000000040113e <+74>:    jne    0x401145 <phase_6+81>   ;不同则跳转至81
   0x0000000000401140 <+76>:    callq  0x40143a <explode_bomb>   ;否则爆炸
   0x0000000000401145 <+81>:    add    $0x1,%ebx   ;%ebx+=0x1
   0x0000000000401148 <+84>:    cmp    $0x5,%ebx   ；0x5与%ebx比较
   0x000000000040114b <+87>:    jle    0x401135 <phase_6+65>   ;小于或等于则跳转至65
   0x000000000040114d <+89>:    add    $0x4,%r13   ;否则%r13+=0x4
   0x0000000000401151 <+93>:    jmp    0x401114 <phase_6+32>   ;跳转至32
   0x0000000000401153 <+95>:    lea    0x18(%rsp),%rsi   ;%rsi=%rsp+0x18
   0x0000000000401158 <+100>:   mov    %r14,%rax   ;%rax=%r14
   0x000000000040115b <+103>:   mov    $0x7,%ecx   ;%ecx=0x7
   0x0000000000401160 <+108>:   mov    %ecx,%edx   ;%edx=%ecx
   0x0000000000401162 <+110>:   sub    (%rax),%edx   ;%edx-=(%rax)
   0x0000000000401164 <+112>:   mov    %edx,(%rax)   ;(%rax)=%edx
   0x0000000000401166 <+114>:   add    $0x4,%rax   ;%rax+=0x4
   0x000000000040116a <+118>:   cmp    %rsi,%rax   ;%rsi与%rax比较
   0x000000000040116d <+121>:   jne    0x401160 <phase_6+108>   ;不同则跳转至108
   0x000000000040116f <+123>:   mov    $0x0,%esi   ;%esi=0x0
   0x0000000000401174 <+128>:   jmp    0x401197 <phase_6+163>   ;跳转至163
   0x0000000000401176 <+130>:   mov    0x8(%rdx),%rdx   ;%rdx=%rdx+0x8
   0x000000000040117a <+134>:   add    $0x1,%eax   ;%eax+=0x1
   0x000000000040117d <+137>:   cmp    %ecx,%eax   ;%eax与%ecx比较
   0x000000000040117f <+139>:   jne    0x401176 <phase_6+130>   ;不同则跳转至130
   0x0000000000401181 <+141>:   jmp    0x401188 <phase_6+148>   ;跳转至148
   0x0000000000401183 <+143>:   mov    $0x6032d0,%edx   ;%edx=0x6032d0
   0x0000000000401188 <+148>:   mov    %rdx,0x20(%rsp,%rsi,2)   ;%rsp+%rsi*2+0x20=%rdx
   0x000000000040118d <+153>:   add    $0x4,%rsi   ;%rsi+=0x4
   0x0000000000401191 <+157>:   cmp    $0x18,%rsi   ;0x18比较%rsi
   0x0000000000401195 <+161>:   je     0x4011ab <phase_6+183>   ;相同则跳转至183
   0x0000000000401197 <+163>:   mov    (%rsp,%rsi,1),%ecx   ;%ecx=%rsp+%rsi*1
   0x000000000040119a <+166>:   cmp    $0x1,%ecx   ;0x1比较%ecx
   0x000000000040119d <+169>:   jle    0x401183 <phase_6+143>   ;小于或等于跳转至143
   0x000000000040119f <+171>:   mov    $0x1,%eax   ;%eax=0x1
   0x00000000004011a4 <+176>:   mov    $0x6032d0,%edx   ;%edx=0x6032d0
   0x00000000004011a9 <+181>:   jmp    0x401176 <phase_6+130>   ;跳转至130
   0x00000000004011ab <+183>:   mov    0x20(%rsp),%rbx   ;%rbx=%rsp+0x20
   0x00000000004011b0 <+188>:   lea    0x28(%rsp),%rax   ;%rax=%rsp+0x28
   0x00000000004011b5 <+193>:   lea    0x50(%rsp),%rsi   ;%rsi=%rsp+0x50
   0x00000000004011ba <+198>:   mov    %rbx,%rcx   ;%rcx=%rbx
   0x00000000004011bd <+201>:   mov    (%rax),%rdx   ;%rdx=%rax
   0x00000000004011c0 <+204>:   mov    %rdx,0x8(%rcx)   ;%rcx+0x8=%rdx
   0x00000000004011c4 <+208>:   add    $0x8,%rax   ;%rax+=0x8
   0x00000000004011c8 <+212>:   cmp    %rsi,%rax   ;%rsi比较%rax
   0x00000000004011cb <+215>:   je     0x4011d2 <phase_6+222>   ;相同跳转至222
   0x00000000004011cd <+217>:   mov    %rdx,%rcx   ;%rcx=%rdx
   0x00000000004011d0 <+220>:   jmp    0x4011bd <phase_6+201>   ;跳转至201
   0x00000000004011d2 <+222>:   movq   $0x0,0x8(%rdx)   ；%rdx+0x8=0x0
   0x00000000004011da <+230>:   mov    $0x5,%ebp   ;%ebq=0x5
   0x00000000004011df <+235>:   mov    0x8(%rbx),%rax   ;%rax=%rbx+0x8
   0x00000000004011e3 <+239>:   mov    (%rax),%eax   ;%eax=(%rax)
   0x00000000004011e5 <+241>:   cmp    %eax,(%rbx)   ;%eax比较(%rbx)
   0x00000000004011e7 <+243>:   jge    0x4011ee <phase_6+250>   ;大于或等于跳转至250
   0x00000000004011e9 <+245>:   callq  0x40143a <explode_bomb>   ;否则爆炸
   0x00000000004011ee <+250>:   mov    0x8(%rbx),%rbx   ;%rbx=%rbx+0x8
   0x00000000004011f2 <+254>:   sub    $0x1,%ebp   ;%ebp-=0x1
   0x00000000004011f5 <+257>:   jne    0x4011df <phase_6+235>   ;不同跳转至235
   0x00000000004011f7 <+259>:   add    $0x50,%rsp   ;释放栈空间
   0x00000000004011fb <+263>:   pop    %rbx   
   0x00000000004011fc <+264>:   pop    %rbp
   0x00000000004011fd <+265>:   pop    %r12
   0x00000000004011ff <+267>:   pop    %r13
   0x0000000000401201 <+269>:   pop    %r14
   0x0000000000401203 <+271>:   retq   
End of assembler dump.
