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
   0x0000000000400f43 <+0>:     sub    $0x18,%rsp
   0x0000000000400f47 <+4>:     lea    0xc(%rsp),%rcx
   0x0000000000400f4c <+9>:     lea    0x8(%rsp),%rdx
   0x0000000000400f51 <+14>:    mov    $0x4025cf,%esi
   0x0000000000400f56 <+19>:    mov    $0x0,%eax
   0x0000000000400f5b <+24>:    callq  0x400bf0 <__isoc99_sscanf@plt>
   0x0000000000400f60 <+29>:    cmp    $0x1,%eax
   0x0000000000400f63 <+32>:    jg     0x400f6a <phase_3+39>
   0x0000000000400f65 <+34>:    callq  0x40143a <explode_bomb>
   0x0000000000400f6a <+39>:    cmpl   $0x7,0x8(%rsp)
   0x0000000000400f6f <+44>:    ja     0x400fad <phase_3+106>
   0x0000000000400f71 <+46>:    mov    0x8(%rsp),%eax
   0x0000000000400f75 <+50>:    jmpq   *0x402470(,%rax,8)
   0x0000000000400f7c <+57>:    mov    $0xcf,%eax
   0x0000000000400f81 <+62>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f83 <+64>:    mov    $0x2c3,%eax
   0x0000000000400f88 <+69>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f8a <+71>:    mov    $0x100,%eax
   0x0000000000400f8f <+76>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f91 <+78>:    mov    $0x185,%eax
   0x0000000000400f96 <+83>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f98 <+85>:    mov    $0xce,%eax
   0x0000000000400f9d <+90>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400f9f <+92>:    mov    $0x2aa,%eax
   0x0000000000400fa4 <+97>:    jmp    0x400fbe <phase_3+123>
   0x0000000000400fa6 <+99>:    mov    $0x147,%eax
   0x0000000000400fab <+104>:   jmp    0x400fbe <phase_3+123>
   0x0000000000400fad <+106>:   callq  0x40143a <explode_bomb>
   0x0000000000400fb2 <+111>:   mov    $0x0,%eax
   0x0000000000400fb7 <+116>:   jmp    0x400fbe <phase_3+123>
   0x0000000000400fb9 <+118>:   mov    $0x137,%eax
   0x0000000000400fbe <+123>:   cmp    0xc(%rsp),%eax
   0x0000000000400fc2 <+127>:   je     0x400fc9 <phase_3+134>
   0x0000000000400fc4 <+129>:   callq  0x40143a <explode_bomb>
   0x0000000000400fc9 <+134>:   add    $0x18,%rsp
   0x0000000000400fcd <+138>:   retq   
End of assembler dump.
