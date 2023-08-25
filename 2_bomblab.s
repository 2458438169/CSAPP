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
   0x0000000000400f5b <+24>:    callq  0x400bf0 <__isoc99_sscanf@plt>   ;调用函数将输入的两个整数存入%rdx和%rcx
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
   0x0000000000400fdf <+17>:    lea    (%rax,%rsi,1),%ecx   ;将%rax的地址+%rs的地址存入%ecx
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
   0x0000000000401024 <+24>:    callq  0x400bf0 <__isoc99_sscanf@plt>   ;调用函数将输入的两个整数存入%rdx和%rcx
   0x0000000000401029 <+29>:    cmp    $0x2,%eax   ;比较0x2和%eax的值
   0x000000000040102c <+32>:    jne    0x401035 <phase_4+41>   ;不相同则跳转至41
   0x000000000040102e <+34>:    cmpl   $0xe,0x8(%rsp)   ;比较0xe和%rsp地址+0x8处的值(%rdx)
   0x0000000000401033 <+39>:    jbe    0x40103a <phase_4+46>   ;如果小于或等于则跳转至46
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
