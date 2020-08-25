: kd> uf KiRaiseSecurityCheckFailureShadow
nt!KiRaiseSecurityCheckFailure:
fffff802`753ee2c0 48832c2402      sub     qword ptr [rsp],2
fffff802`753ee2c5 66837c240823    cmp     word ptr [rsp+8],23h
fffff802`753ee2cb 7505            jne     nt!KiRaiseSecurityCheckFailure+0x12 (fffff802`753ee2d2)  Branch

nt!KiRaiseSecurityCheckFailure+0xd:
fffff802`753ee2cd 8364240400      and     dword ptr [rsp+4],0

nt!KiRaiseSecurityCheckFailure+0x12:
fffff802`753ee2d2 4883ec08        sub     rsp,8
fffff802`753ee2d6 55              push    rbp
fffff802`753ee2d7 4881ec58010000  sub     rsp,158h
fffff802`753ee2de 488dac2480000000 lea     rbp,[rsp+80h]
fffff802`753ee2e6 c645ab01        mov     byte ptr [rbp-55h],1
fffff802`753ee2ea 488945b0        mov     qword ptr [rbp-50h],rax
fffff802`753ee2ee 48894db8        mov     qword ptr [rbp-48h],rcx
fffff802`753ee2f2 488955c0        mov     qword ptr [rbp-40h],rdx
fffff802`753ee2f6 4c8945c8        mov     qword ptr [rbp-38h],r8
fffff802`753ee2fa 4c894dd0        mov     qword ptr [rbp-30h],r9
fffff802`753ee2fe 4c8955d8        mov     qword ptr [rbp-28h],r10
fffff802`753ee302 4c895de0        mov     qword ptr [rbp-20h],r11
fffff802`753ee306 f685f000000001  test    byte ptr [rbp+0F0h],1
fffff802`753ee30d 752d            jne     nt!KiRaiseSecurityCheckFailure+0x7c (fffff802`753ee33c)  Branch

nt!KiRaiseSecurityCheckFailure+0x4f:
fffff802`753ee30f 0faee8          lfence
fffff802`753ee312 65f604257802000001 test  byte ptr gs:[278h],1
fffff802`753ee31b 7508            jne     nt!KiRaiseSecurityCheckFailure+0x65 (fffff802`753ee325)  Branch

nt!KiRaiseSecurityCheckFailure+0x5d:
fffff802`753ee31d 0faee8          lfence
fffff802`753ee320 e95c020000      jmp     nt!KiRaiseSecurityCheckFailure+0x2c1 (fffff802`753ee581)  Branch

nt!KiRaiseSecurityCheckFailure+0x65:
fffff802`753ee325 650fb604257a020000 movzx eax,byte ptr gs:[27Ah]
fffff802`753ee32e b948000000      mov     ecx,48h
fffff802`753ee333 33d2            xor     edx,edx
fffff802`753ee335 0f30            wrmsr
fffff802`753ee337 e945020000      jmp     nt!KiRaiseSecurityCheckFailure+0x2c1 (fffff802`753ee581)  Branch

nt!KiRaiseSecurityCheckFailure+0x7c:
fffff802`753ee33c f605fd34a10001  test    byte ptr [nt!KiKvaShadow (fffff802`75e01840)],1
fffff802`753ee343 7503            jne     nt!KiRaiseSecurityCheckFailure+0x88 (fffff802`753ee348)  Branch

nt!KiRaiseSecurityCheckFailure+0x85:
fffff802`753ee345 0f01f8          swapgs

nt!KiRaiseSecurityCheckFailure+0x88:
fffff802`753ee348 0faee8          lfence
fffff802`753ee34b 654c8b142588010000 mov   r10,qword ptr gs:[188h]
fffff802`753ee354 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff802`753ee35d 488b8920020000  mov     rcx,qword ptr [rcx+220h]
fffff802`753ee364 488b89e0090000  mov     rcx,qword ptr [rcx+9E0h]
fffff802`753ee36b 6548890c2570020000 mov   qword ptr gs:[270h],rcx
fffff802`753ee374 658a0c2550080000 mov     cl,byte ptr gs:[850h]
fffff802`753ee37c 65880c2551080000 mov     byte ptr gs:[851h],cl
fffff802`753ee384 658a0c2578020000 mov     cl,byte ptr gs:[278h]
fffff802`753ee38c 65880c2552080000 mov     byte ptr gs:[852h],cl
fffff802`753ee394 650fb604257b020000 movzx eax,byte ptr gs:[27Bh]
fffff802`753ee39d 653804257a020000 cmp     byte ptr gs:[27Ah],al
fffff802`753ee3a5 7411            je      nt!KiRaiseSecurityCheckFailure+0xf8 (fffff802`753ee3b8)  Branch

nt!KiRaiseSecurityCheckFailure+0xe7:
fffff802`753ee3a7 658804257a020000 mov     byte ptr gs:[27Ah],al
fffff802`753ee3af b948000000      mov     ecx,48h
fffff802`753ee3b4 33d2            xor     edx,edx
fffff802`753ee3b6 0f30            wrmsr

nt!KiRaiseSecurityCheckFailure+0xf8:
fffff802`753ee3b8 650fb6142578020000 movzx edx,byte ptr gs:[278h]
fffff802`753ee3c1 f7c208000000    test    edx,8
fffff802`753ee3c7 7413            je      nt!KiRaiseSecurityCheckFailure+0x11c (fffff802`753ee3dc)  Branch

nt!KiRaiseSecurityCheckFailure+0x109:
fffff802`753ee3c9 b801000000      mov     eax,1
fffff802`753ee3ce 33d2            xor     edx,edx
fffff802`753ee3d0 b949000000      mov     ecx,49h
fffff802`753ee3d5 0f30            wrmsr
fffff802`753ee3d7 e93e010000      jmp     nt!KiRaiseSecurityCheckFailure+0x25a (fffff802`753ee51a)  Branch

nt!KiRaiseSecurityCheckFailure+0x11c:
fffff802`753ee3dc f7c202000000    test    edx,2
fffff802`753ee3e2 0f842f010000    je      nt!KiRaiseSecurityCheckFailure+0x257 (fffff802`753ee517)  Branch

nt!KiRaiseSecurityCheckFailure+0x128:
fffff802`753ee3e8 65f604257902000004 test  byte ptr gs:[279h],4
fffff802`753ee3f1 0f8520010000    jne     nt!KiRaiseSecurityCheckFailure+0x257 (fffff802`753ee517)  Branch

nt!KiRaiseSecurityCheckFailure+0x137:
fffff802`753ee3f7 e80e010000      call    nt!KiRaiseSecurityCheckFailure+0x24a (fffff802`753ee50a)
fffff802`753ee3fc 4883c408        add     rsp,8
fffff802`753ee400 e80e010000      call    nt!KiRaiseSecurityCheckFailure+0x253 (fffff802`753ee513)
fffff802`753ee405 4883c408        add     rsp,8
fffff802`753ee409 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x13c (fffff802`753ee3fc)
fffff802`753ee40e 4883c408        add     rsp,8
fffff802`753ee412 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x145 (fffff802`753ee405)
fffff802`753ee417 4883c408        add     rsp,8
fffff802`753ee41b e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x14e (fffff802`753ee40e)
fffff802`753ee420 4883c408        add     rsp,8
fffff802`753ee424 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x157 (fffff802`753ee417)
fffff802`753ee429 4883c408        add     rsp,8
fffff802`753ee42d e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x160 (fffff802`753ee420)
fffff802`753ee432 4883c408        add     rsp,8
fffff802`753ee436 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x169 (fffff802`753ee429)
fffff802`753ee43b 4883c408        add     rsp,8
fffff802`753ee43f e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x172 (fffff802`753ee432)
fffff802`753ee444 4883c408        add     rsp,8
fffff802`753ee448 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x17b (fffff802`753ee43b)
fffff802`753ee44d 4883c408        add     rsp,8
fffff802`753ee451 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x184 (fffff802`753ee444)
fffff802`753ee456 4883c408        add     rsp,8
fffff802`753ee45a e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x18d (fffff802`753ee44d)
fffff802`753ee45f 4883c408        add     rsp,8
fffff802`753ee463 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x196 (fffff802`753ee456)
fffff802`753ee468 4883c408        add     rsp,8
fffff802`753ee46c e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x19f (fffff802`753ee45f)
fffff802`753ee471 4883c408        add     rsp,8
fffff802`753ee475 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1a8 (fffff802`753ee468)
fffff802`753ee47a 4883c408        add     rsp,8
fffff802`753ee47e e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1b1 (fffff802`753ee471)
fffff802`753ee483 4883c408        add     rsp,8
fffff802`753ee487 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1ba (fffff802`753ee47a)
fffff802`753ee48c 4883c408        add     rsp,8
fffff802`753ee490 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1c3 (fffff802`753ee483)
fffff802`753ee495 4883c408        add     rsp,8
fffff802`753ee499 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1cc (fffff802`753ee48c)
fffff802`753ee49e 4883c408        add     rsp,8
fffff802`753ee4a2 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1d5 (fffff802`753ee495)
fffff802`753ee4a7 4883c408        add     rsp,8
fffff802`753ee4ab e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1de (fffff802`753ee49e)
fffff802`753ee4b0 4883c408        add     rsp,8
fffff802`753ee4b4 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1e7 (fffff802`753ee4a7)
fffff802`753ee4b9 4883c408        add     rsp,8
fffff802`753ee4bd e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1f0 (fffff802`753ee4b0)
fffff802`753ee4c2 4883c408        add     rsp,8
fffff802`753ee4c6 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x1f9 (fffff802`753ee4b9)
fffff802`753ee4cb 4883c408        add     rsp,8
fffff802`753ee4cf e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x202 (fffff802`753ee4c2)
fffff802`753ee4d4 4883c408        add     rsp,8
fffff802`753ee4d8 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x20b (fffff802`753ee4cb)
fffff802`753ee4dd 4883c408        add     rsp,8
fffff802`753ee4e1 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x214 (fffff802`753ee4d4)
fffff802`753ee4e6 4883c408        add     rsp,8
fffff802`753ee4ea e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x21d (fffff802`753ee4dd)
fffff802`753ee4ef 4883c408        add     rsp,8
fffff802`753ee4f3 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x226 (fffff802`753ee4e6)
fffff802`753ee4f8 4883c408        add     rsp,8
fffff802`753ee4fc e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x22f (fffff802`753ee4ef)
fffff802`753ee501 4883c408        add     rsp,8
fffff802`753ee505 e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x238 (fffff802`753ee4f8)
fffff802`753ee50a 4883c408        add     rsp,8
fffff802`753ee50e e8eeffffff      call    nt!KiRaiseSecurityCheckFailure+0x241 (fffff802`753ee501)
fffff802`753ee513 4883c408        add     rsp,8

nt!KiRaiseSecurityCheckFailure+0x257:
fffff802`753ee517 0faee8          lfence

nt!KiRaiseSecurityCheckFailure+0x25a:
fffff802`753ee51a 65c604255308000000 mov   byte ptr gs:[853h],0
fffff802`753ee523 41f6420380      test    byte ptr [r10+3],80h
fffff802`753ee528 7442            je      nt!KiRaiseSecurityCheckFailure+0x2ac (fffff802`753ee56c)  Branch

nt!KiRaiseSecurityCheckFailure+0x26a:
fffff802`753ee52a b9020100c0      mov     ecx,0C0000102h
fffff802`753ee52f 0f32            rdmsr
fffff802`753ee531 48c1e220        shl     rdx,20h
fffff802`753ee535 480bc2          or      rax,rdx
fffff802`753ee538 483b05192fc3ff  cmp     rax,qword ptr [nt!MmUserProbeAddress (fffff802`75021458)]
fffff802`753ee53f 480f4305112fc3ff cmovae  rax,qword ptr [nt!MmUserProbeAddress (fffff802`75021458)]
fffff802`753ee547 493982f0000000  cmp     qword ptr [r10+0F0h],rax
fffff802`753ee54e 741c            je      nt!KiRaiseSecurityCheckFailure+0x2ac (fffff802`753ee56c)  Branch

nt!KiRaiseSecurityCheckFailure+0x290:
fffff802`753ee550 498b92f0010000  mov     rdx,qword ptr [r10+1F0h]
fffff802`753ee557 410fba6a7408    bts     dword ptr [r10+74h],8
fffff802`753ee55d 6641ff8ae6010000 dec     word ptr [r10+1E6h]
fffff802`753ee565 48898280000000  mov     qword ptr [rdx+80h],rax

nt!KiRaiseSecurityCheckFailure+0x2ac:
fffff802`753ee56c 41f6420303      test    byte ptr [r10+3],3
fffff802`753ee571 66c785800000000000 mov   word ptr [rbp+80h],0
fffff802`753ee57a 7405            je      nt!KiRaiseSecurityCheckFailure+0x2c1 (fffff802`753ee581)  Branch

nt!KiRaiseSecurityCheckFailure+0x2bc:
fffff802`753ee57c e80ffffeff      call    nt!KiSaveDebugRegisterState (fffff802`753de490)

nt!KiRaiseSecurityCheckFailure+0x2c1:
fffff802`753ee581 fc              cld
fffff802`753ee582 0fae5dac        stmxcsr dword ptr [rbp-54h]
fffff802`753ee586 650fae142580010000 ldmxcsr dword ptr gs:[180h]
fffff802`753ee58f 0f2945f0        movaps  xmmword ptr [rbp-10h],xmm0
fffff802`753ee593 0f294d00        movaps  xmmword ptr [rbp],xmm1
fffff802`753ee597 0f295510        movaps  xmmword ptr [rbp+10h],xmm2
fffff802`753ee59b 0f295d20        movaps  xmmword ptr [rbp+20h],xmm3
fffff802`753ee59f 0f296530        movaps  xmmword ptr [rbp+30h],xmm4
fffff802`753ee5a3 0f296d40        movaps  xmmword ptr [rbp+40h],xmm5
fffff802`753ee5a7 f6059ecf9000ff  test    byte ptr [nt!KeSmapEnabled (fffff802`75cfb54c)],0FFh
fffff802`753ee5ae 740c            je      nt!KiRaiseSecurityCheckFailure+0x2fc (fffff802`753ee5bc)  Branch

nt!KiRaiseSecurityCheckFailure+0x2f0:
fffff802`753ee5b0 f685f000000001  test    byte ptr [rbp+0F0h],1
fffff802`753ee5b7 7403            je      nt!KiRaiseSecurityCheckFailure+0x2fc (fffff802`753ee5bc)  Branch

nt!KiRaiseSecurityCheckFailure+0x2f9:
fffff802`753ee5b9 0f01cb          stac

nt!KiRaiseSecurityCheckFailure+0x2fc:
fffff802`753ee5bc f785f800000000020000 test dword ptr [rbp+0F8h],200h
fffff802`753ee5c6 7401            je      nt!KiRaiseSecurityCheckFailure+0x309 (fffff802`753ee5c9)  Branch

nt!KiRaiseSecurityCheckFailure+0x308:
fffff802`753ee5c8 fb              sti

nt!KiRaiseSecurityCheckFailure+0x309:
fffff802`753ee5c9 4c8b4db8        mov     r9,qword ptr [rbp-48h]
fffff802`753ee5cd b9090400c0      mov     ecx,0C0000409h
fffff802`753ee5d2 ba01000000      mov     edx,1
fffff802`753ee5d7 4c8b85e8000000  mov     r8,qword ptr [rbp+0E8h]
fffff802`753ee5de e89d1b0000      call    nt!KiFastFailDispatch (fffff802`753f0180)
fffff802`753ee5e3 90              nop
fffff802`753ee5e4 c3              ret

nt!KiRaiseSecurityCheckFailureShadow:
fffff802`75a22d40 f644240801      test    byte ptr [rsp+8],1
fffff802`75a22d45 7467            je      nt!KiRaiseSecurityCheckFailureShadow+0x6e (fffff802`75a22dae)  Branch

nt!KiRaiseSecurityCheckFailureShadow+0x7:
fffff802`75a22d47 0f01f8          swapgs
fffff802`75a22d4a 0faee8          lfence
fffff802`75a22d4d 650fba24251890000001 bt  dword ptr gs:[9018h],1
fffff802`75a22d57 720c            jb      nt!KiRaiseSecurityCheckFailureShadow+0x25 (fffff802`75a22d65)  Branch

nt!KiRaiseSecurityCheckFailureShadow+0x19:
fffff802`75a22d59 65488b242500900000 mov   rsp,qword ptr gs:[9000h]
fffff802`75a22d62 0f22dc          mov     cr3,rsp

nt!KiRaiseSecurityCheckFailureShadow+0x25:
fffff802`75a22d65 65488b242508900000 mov   rsp,qword ptr gs:[9008h]
fffff802`75a22d6e 654889342510000000 mov   qword ptr gs:[10h],rsi
fffff802`75a22d77 65488b342538000000 mov   rsi,qword ptr gs:[38h]
fffff802`75a22d80 4881c600420000  add     rsi,4200h
fffff802`75a22d87 ff76f8          push    qword ptr [rsi-8]
fffff802`75a22d8a ff76f0          push    qword ptr [rsi-10h]
fffff802`75a22d8d ff76e8          push    qword ptr [rsi-18h]
fffff802`75a22d90 ff76e0          push    qword ptr [rsi-20h]
fffff802`75a22d93 ff76d8          push    qword ptr [rsi-28h]
fffff802`75a22d96 65488b342510000000 mov   rsi,qword ptr gs:[10h]
fffff802`75a22d9f 65488324251000000000 and qword ptr gs:[10h],0
fffff802`75a22da9 e912b59cff      jmp     nt!KiRaiseSecurityCheckFailure (fffff802`753ee2c0)  Branch

nt!KiRaiseSecurityCheckFailureShadow+0x6e:
fffff802`75a22dae 0faee8          lfence
fffff802`75a22db1 e90ab59cff      jmp     nt!KiRaiseSecurityCheckFailure (fffff802`753ee2c0)  Branch
