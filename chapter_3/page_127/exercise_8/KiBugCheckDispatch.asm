0: kd> uf KiBugCheckDispatch
nt!KiBugCheckDispatch:
fffff802`753efdc0 4881ec38010000  sub     rsp,138h
fffff802`753efdc7 488d842400010000 lea     rax,[rsp+100h]
fffff802`753efdcf 0f29742430      movaps  xmmword ptr [rsp+30h],xmm6
fffff802`753efdd4 0f297c2440      movaps  xmmword ptr [rsp+40h],xmm7
fffff802`753efdd9 440f29442450    movaps  xmmword ptr [rsp+50h],xmm8
fffff802`753efddf 440f294c2460    movaps  xmmword ptr [rsp+60h],xmm9
fffff802`753efde5 440f29542470    movaps  xmmword ptr [rsp+70h],xmm10
fffff802`753efdeb 440f295880      movaps  xmmword ptr [rax-80h],xmm11
fffff802`753efdf0 440f296090      movaps  xmmword ptr [rax-70h],xmm12
fffff802`753efdf5 440f2968a0      movaps  xmmword ptr [rax-60h],xmm13
fffff802`753efdfa 440f2970b0      movaps  xmmword ptr [rax-50h],xmm14
fffff802`753efdff 440f2978c0      movaps  xmmword ptr [rax-40h],xmm15
fffff802`753efe04 488918          mov     qword ptr [rax],rbx
fffff802`753efe07 48897808        mov     qword ptr [rax+8],rdi
fffff802`753efe0b 48897010        mov     qword ptr [rax+10h],rsi
fffff802`753efe0f 4c896018        mov     qword ptr [rax+18h],r12
fffff802`753efe13 4c896820        mov     qword ptr [rax+20h],r13
fffff802`753efe17 4c897028        mov     qword ptr [rax+28h],r14
fffff802`753efe1b 4c897830        mov     qword ptr [rax+30h],r15
fffff802`753efe1f 4c89542420      mov     qword ptr [rsp+20h],r10
fffff802`753efe24 e817e1feff      call    nt!KeBugCheckEx (fffff802`753ddf40)
fffff802`753efe29 90              nop
fffff802`753efe2a c3              ret
