0: kd> uf nt!KeBugCheck2
nt!KeBugCheck2:
fffff802`7551d400 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff802`7551d405 55              push    rbp
fffff802`7551d406 56              push    rsi
fffff802`7551d407 57              push    rdi
fffff802`7551d408 4154            push    r12
fffff802`7551d40a 4155            push    r13
fffff802`7551d40c 4156            push    r14
fffff802`7551d40e 4157            push    r15
fffff802`7551d410 488dac2430faffff lea     rbp,[rsp-5D0h]
fffff802`7551d418 4881ecd0060000  sub     rsp,6D0h
fffff802`7551d41f 488bb530060000  mov     rsi,qword ptr [rbp+630h]
fffff802`7551d426 4d8bf8          mov     r15,r8
fffff802`7551d429 4c8bb538060000  mov     r14,qword ptr [rbp+638h]
fffff802`7551d430 4c8bea          mov     r13,rdx
fffff802`7551d433 894c2460        mov     dword ptr [rsp+60h],ecx
fffff802`7551d437 33d2            xor     edx,edx
fffff802`7551d439 41b8a8000000    mov     r8d,0A8h
fffff802`7551d43f 488d4dd0        lea     rcx,[rbp-30h]
fffff802`7551d443 498bf9          mov     rdi,r9
fffff802`7551d446 e8f53bedff      call    nt!memset (fffff802`753f1040)
fffff802`7551d44b 33db            xor     ebx,ebx
fffff802`7551d44d c644245301      mov     byte ptr [rsp+53h],1
fffff802`7551d452 889d50050000    mov     byte ptr [rbp+550h],bl
fffff802`7551d458 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff802`7551d461 391ddd6c7d00    cmp     dword ptr [nt!IopAutoReboot (fffff802`75cf4144)],ebx
fffff802`7551d467 4889442458      mov     qword ptr [rsp+58h],rax
fffff802`7551d46c 488d05ad130000  lea     rax,[nt!KiBugCheckProgress (fffff802`7551e820)]
fffff802`7551d473 488945c0        mov     qword ptr [rbp-40h],rax
fffff802`7551d477 0f95442455      setne   byte ptr [rsp+55h]
fffff802`7551d47c 48895da0        mov     qword ptr [rbp-60h],rbx
fffff802`7551d480 885c2452        mov     byte ptr [rsp+52h],bl
fffff802`7551d484 885c2478        mov     byte ptr [rsp+78h],bl
fffff802`7551d488 885c2456        mov     byte ptr [rsp+56h],bl
fffff802`7551d48c 48895c2468      mov     qword ptr [rsp+68h],rbx
fffff802`7551d491 48895d80        mov     qword ptr [rbp-80h],rbx
fffff802`7551d495 c644245401      mov     byte ptr [rsp+54h],1
fffff802`7551d49a 895d88          mov     dword ptr [rbp-78h],ebx
fffff802`7551d49d 48895db0        mov     qword ptr [rbp-50h],rbx
fffff802`7551d4a1 48895db8        mov     qword ptr [rbp-48h],rbx
fffff802`7551d4a5 895d98          mov     dword ptr [rbp-68h],ebx
fffff802`7551d4a8 440f20c0        mov     rax,cr8
fffff802`7551d4ac 8d5302          lea     edx,[rbx+2]
fffff802`7551d4af 448d430f        lea     r8d,[rbx+0Fh]
fffff802`7551d4b3 3ac2            cmp     al,dl
fffff802`7551d4b5 7345            jae     nt!KeBugCheck2+0xfc (fffff802`7551d4fc)  Branch

nt!KeBugCheck2+0xb7:
fffff802`7551d4b7 440f20c1        mov     rcx,cr8
fffff802`7551d4bb 440f22c2        mov     cr8,rdx
fffff802`7551d4bf 8b0593e17d00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff802`75cfb658)]
fffff802`7551d4c5 85c0            test    eax,eax
fffff802`7551d4c7 7433            je      nt!KeBugCheck2+0xfc (fffff802`7551d4fc)  Branch

nt!KeBugCheck2+0xc9:
fffff802`7551d4c9 a801            test    al,1
fffff802`7551d4cb 742f            je      nt!KeBugCheck2+0xfc (fffff802`7551d4fc)  Branch

nt!KeBugCheck2+0xcd:
fffff802`7551d4cd 413ac8          cmp     cl,r8b
fffff802`7551d4d0 772a            ja      nt!KeBugCheck2+0xfc (fffff802`7551d4fc)  Branch

nt!KeBugCheck2+0xd2:
fffff802`7551d4d2 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff802`7551d4db 4883caff        or      rdx,0FFFFFFFFFFFFFFFFh
fffff802`7551d4df 0fb6c9          movzx   ecx,cl
fffff802`7551d4e2 ffc1            inc     ecx
fffff802`7551d4e4 48d3e2          shl     rdx,cl
fffff802`7551d4e7 4c8b88b8840000  mov     r9,qword ptr [rax+84B8h]
fffff802`7551d4ee 83e204          and     edx,4
fffff802`7551d4f1 458b4114        mov     r8d,dword ptr [r9+14h]
fffff802`7551d4f5 440bc2          or      r8d,edx
fffff802`7551d4f8 45894114        mov     dword ptr [r9+14h],r8d

nt!KeBugCheck2+0xfc:
fffff802`7551d4fc 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff802`7551d505 48395828        cmp     qword ptr [rax+28h],rbx
fffff802`7551d509 0f8597000000    jne     nt!KeBugCheck2+0x1a6 (fffff802`7551d5a6)  Branch

nt!KeBugCheck2+0x10f:
fffff802`7551d50f 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff802`7551d518 41bc03000000    mov     r12d,3
fffff802`7551d51e 8b5024          mov     edx,dword ptr [rax+24h]
fffff802`7551d521 8b05913e7100    mov     eax,dword ptr [nt!KiBugCheckActive (fffff802`75c313b8)]
fffff802`7551d527 c1e204          shl     edx,4
fffff802`7551d52a 410bd4          or      edx,r12d
fffff802`7551d52d eb12            jmp     nt!KeBugCheck2+0x141 (fffff802`7551d541)  Branch

nt!KeBugCheck2+0x12f:
fffff802`7551d52f 8bc8            mov     ecx,eax
fffff802`7551d531 f00fb1157f3e7100 lock cmpxchg dword ptr [nt!KiBugCheckActive (fffff802`75c313b8)],edx
fffff802`7551d539 3bc1            cmp     eax,ecx
fffff802`7551d53b 0f84f0000000    je      nt!KeBugCheck2+0x231 (fffff802`7551d631)  Branch

nt!KeBugCheck2+0x141:
fffff802`7551d541 8bc8            mov     ecx,eax
fffff802`7551d543 4123cc          and     ecx,r12d
fffff802`7551d546 413acc          cmp     cl,r12b
fffff802`7551d549 75e4            jne     nt!KeBugCheck2+0x12f (fffff802`7551d52f)  Branch

nt!KeBugCheck2+0x14b:
fffff802`7551d54b 885c2450        mov     byte ptr [rsp+50h],bl

nt!KeBugCheck2+0x14f:
fffff802`7551d54f 391df7df7d00    cmp     dword ptr [nt!KeSmapEnabled (fffff802`75cfb54c)],ebx
fffff802`7551d555 7403            je      nt!KeBugCheck2+0x15a (fffff802`7551d55a)  Branch

nt!KeBugCheck2+0x157:
fffff802`7551d557 0f01cb          stac

nt!KeBugCheck2+0x15a:
fffff802`7551d55a 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff802`7551d563 48baf005000080f7ffff mov rdx,0FFFFF780000005F0h
fffff802`7551d56d 48894590        mov     qword ptr [rbp-70h],rax
fffff802`7551d571 8b4824          mov     ecx,dword ptr [rax+24h]
fffff802`7551d574 488b12          mov     rdx,qword ptr [rdx]
fffff802`7551d577 894da8          mov     dword ptr [rbp-58h],ecx
fffff802`7551d57a 480fbaea08      bts     rdx,8
fffff802`7551d57f 488b88c0060000  mov     rcx,qword ptr [rax+6C0h]
fffff802`7551d586 e89d320000      call    nt!KeSaveSupervisorState (fffff802`75520828)
fffff802`7551d58b 488b050e5e7000  mov     rax,qword ptr [nt!PopAction+0x40 (fffff802`75c233a0)]
fffff802`7551d592 8b5c2460        mov     ebx,dword ptr [rsp+60h]
fffff802`7551d596 4885c0          test    rax,rax
fffff802`7551d599 0f859c000000    jne     nt!KeBugCheck2+0x23b (fffff802`7551d63b)  Branch

nt!KeBugCheck2+0x19f:
fffff802`7551d59f 32db            xor     bl,bl
fffff802`7551d5a1 e9e4000000      jmp     nt!KeBugCheck2+0x28a (fffff802`7551d68a)  Branch

nt!KeBugCheck2+0x1a6:
fffff802`7551d5a6 4c8d45b0        lea     r8,[rbp-50h]
fffff802`7551d5aa 488d55b8        lea     rdx,[rbp-48h]
fffff802`7551d5ae 488d4d98        lea     rcx,[rbp-68h]
fffff802`7551d5b2 e81999e1ff      call    nt!KeQueryCurrentStackInformation (fffff802`75336ed0)
fffff802`7551d5b7 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff802`7551d5c0 41bc03000000    mov     r12d,3
fffff802`7551d5c6 448ac0          mov     r8b,al
fffff802`7551d5c9 8b05e93d7100    mov     eax,dword ptr [nt!KiBugCheckActive (fffff802`75c313b8)]
fffff802`7551d5cf 8b5124          mov     edx,dword ptr [rcx+24h]
fffff802`7551d5d2 c1e204          shl     edx,4
fffff802`7551d5d5 410bd4          or      edx,r12d
fffff802`7551d5d8 eb0e            jmp     nt!KeBugCheck2+0x1e8 (fffff802`7551d5e8)  Branch

nt!KeBugCheck2+0x1da:
fffff802`7551d5da 8bc8            mov     ecx,eax
fffff802`7551d5dc f00fb115d43d7100 lock cmpxchg dword ptr [nt!KiBugCheckActive (fffff802`75c313b8)],edx
fffff802`7551d5e4 3bc1            cmp     eax,ecx
fffff802`7551d5e6 740f            je      nt!KeBugCheck2+0x1f7 (fffff802`7551d5f7)  Branch

nt!KeBugCheck2+0x1e8:
fffff802`7551d5e8 8bc8            mov     ecx,eax
fffff802`7551d5ea 4123cc          and     ecx,r12d
fffff802`7551d5ed 413acc          cmp     cl,r12b
fffff802`7551d5f0 75e8            jne     nt!KeBugCheck2+0x1da (fffff802`7551d5da)  Branch

nt!KeBugCheck2+0x1f2:
fffff802`7551d5f2 e954ffffff      jmp     nt!KeBugCheck2+0x14b (fffff802`7551d54b)  Branch

nt!KeBugCheck2+0x1f7:
fffff802`7551d5f7 4584c0          test    r8b,r8b
fffff802`7551d5fa 7435            je      nt!KeBugCheck2+0x231 (fffff802`7551d631)  Branch

nt!KeBugCheck2+0x1fc:
fffff802`7551d5fc 8b4598          mov     eax,dword ptr [rbp-68h]
fffff802`7551d5ff 83f809          cmp     eax,9
fffff802`7551d602 770a            ja      nt!KeBugCheck2+0x20e (fffff802`7551d60e)  Branch

nt!KeBugCheck2+0x204:
fffff802`7551d604 b9a1030000      mov     ecx,3A1h
fffff802`7551d609 0fa3c1          bt      ecx,eax
fffff802`7551d60c 7223            jb      nt!KeBugCheck2+0x231 (fffff802`7551d631)  Branch

nt!KeBugCheck2+0x20e:
fffff802`7551d60e 488b55b8        mov     rdx,qword ptr [rbp-48h]
fffff802`7551d612 488d0d87dd7000  lea     rcx,[nt!KiPreBugcheckStackSaveArea (fffff802`75c2b3a0)]
fffff802`7551d619 4c8b45b0        mov     r8,qword ptr [rbp-50h]
fffff802`7551d61d b800600000      mov     eax,6000h
fffff802`7551d622 4c2bc2          sub     r8,rdx
fffff802`7551d625 4c3bc0          cmp     r8,rax
fffff802`7551d628 4c0f47c0        cmova   r8,rax
fffff802`7551d62c e84f37edff      call    nt!memcpy (fffff802`753f0d80)

nt!KeBugCheck2+0x231:
fffff802`7551d631 c644245001      mov     byte ptr [rsp+50h],1
fffff802`7551d636 e914ffffff      jmp     nt!KeBugCheck2+0x14f (fffff802`7551d54f)  Branch

nt!KeBugCheck2+0x23b:
fffff802`7551d63b 833d0658700000  cmp     dword ptr [nt!PopSimulateHiberBugcheck (fffff802`75c22e48)],0
fffff802`7551d642 7407            je      nt!KeBugCheck2+0x24b (fffff802`7551d64b)  Branch

nt!KeBugCheck2+0x244:
fffff802`7551d644 c605c557700000  mov     byte ptr [nt!PoPowerDownActionInProgress (fffff802`75c22e10)],0

nt!KeBugCheck2+0x24b:
fffff802`7551d64b 80780300        cmp     byte ptr [rax+3],0
fffff802`7551d64f 0f844affffff    je      nt!KeBugCheck2+0x19f (fffff802`7551d59f)  Branch

nt!KeBugCheck2+0x255:
fffff802`7551d655 807c245000      cmp     byte ptr [rsp+50h],0
fffff802`7551d65a 7427            je      nt!KeBugCheck2+0x283 (fffff802`7551d683)  Branch

nt!KeBugCheck2+0x25c:
fffff802`7551d65c 33d2            xor     edx,edx
fffff802`7551d65e 4c8d059b5cedff  lea     r8,[nt! ?? ::FNODOBFM::`string' (fffff802`753f3300)]
fffff802`7551d665 8d4a65          lea     ecx,[rdx+65h]
fffff802`7551d668 e823d6e4ff      call    nt!DbgPrintEx (fffff802`7536ac90)
fffff802`7551d66d 83fb0a          cmp     ebx,0Ah
fffff802`7551d670 7511            jne     nt!KeBugCheck2+0x283 (fffff802`7551d683)  Branch

nt!KeBugCheck2+0x272:
fffff802`7551d672 4c8d05475dedff  lea     r8,[nt! ?? ::FNODOBFM::`string' (fffff802`753f33c0)]
fffff802`7551d679 33d2            xor     edx,edx
fffff802`7551d67b 8d4b5b          lea     ecx,[rbx+5Bh]
fffff802`7551d67e e80dd6e4ff      call    nt!DbgPrintEx (fffff802`7536ac90)

nt!KeBugCheck2+0x283:
fffff802`7551d683 488365c000      and     qword ptr [rbp-40h],0
fffff802`7551d688 b301            mov     bl,1

nt!KeBugCheck2+0x28a:
fffff802`7551d68a 488b4590        mov     rax,qword ptr [rbp-70h]
fffff802`7551d68e 488d8d80000000  lea     rcx,[rbp+80h]
fffff802`7551d695 ba09000000      mov     edx,9
fffff802`7551d69a 885c2451        mov     byte ptr [rsp+51h],bl
fffff802`7551d69e 488b80c0850000  mov     rax,qword ptr [rax+85C0h]
fffff802`7551d6a5 448d4277        lea     r8d,[rdx+77h]

nt!KeBugCheck2+0x2a9:
fffff802`7551d6a9 0f1000          movups  xmm0,xmmword ptr [rax]
fffff802`7551d6ac 0f1101          movups  xmmword ptr [rcx],xmm0
fffff802`7551d6af 0f104810        movups  xmm1,xmmword ptr [rax+10h]
fffff802`7551d6b3 0f114910        movups  xmmword ptr [rcx+10h],xmm1
fffff802`7551d6b7 0f104020        movups  xmm0,xmmword ptr [rax+20h]
fffff802`7551d6bb 0f114120        movups  xmmword ptr [rcx+20h],xmm0
fffff802`7551d6bf 0f104830        movups  xmm1,xmmword ptr [rax+30h]
fffff802`7551d6c3 0f114930        movups  xmmword ptr [rcx+30h],xmm1
fffff802`7551d6c7 0f104040        movups  xmm0,xmmword ptr [rax+40h]
fffff802`7551d6cb 0f114140        movups  xmmword ptr [rcx+40h],xmm0
fffff802`7551d6cf 0f104850        movups  xmm1,xmmword ptr [rax+50h]
fffff802`7551d6d3 0f114950        movups  xmmword ptr [rcx+50h],xmm1
fffff802`7551d6d7 0f104060        movups  xmm0,xmmword ptr [rax+60h]
fffff802`7551d6db 0f114160        movups  xmmword ptr [rcx+60h],xmm0
fffff802`7551d6df 4903c8          add     rcx,r8
fffff802`7551d6e2 0f104870        movups  xmm1,xmmword ptr [rax+70h]
fffff802`7551d6e6 4903c0          add     rax,r8
fffff802`7551d6e9 0f1149f0        movups  xmmword ptr [rcx-10h],xmm1
fffff802`7551d6ed 4883ea01        sub     rdx,1
fffff802`7551d6f1 75b6            jne     nt!KeBugCheck2+0x2a9 (fffff802`7551d6a9)  Branch

nt!KeBugCheck2+0x2f3:
fffff802`7551d6f3 0f1000          movups  xmm0,xmmword ptr [rax]
fffff802`7551d6f6 448a542450      mov     r10b,byte ptr [rsp+50h]
fffff802`7551d6fb 0f1101          movups  xmmword ptr [rcx],xmm0
fffff802`7551d6fe 0f104810        movups  xmm1,xmmword ptr [rax+10h]
fffff802`7551d702 0f114910        movups  xmmword ptr [rcx+10h],xmm1
fffff802`7551d706 0f104020        movups  xmm0,xmmword ptr [rax+20h]
fffff802`7551d70a 0f114120        movups  xmmword ptr [rcx+20h],xmm0
fffff802`7551d70e 0f104830        movups  xmm1,xmmword ptr [rax+30h]
fffff802`7551d712 0f114930        movups  xmmword ptr [rcx+30h],xmm1
fffff802`7551d716 0f104040        movups  xmm0,xmmword ptr [rax+40h]
fffff802`7551d71a 0f114140        movups  xmmword ptr [rcx+40h],xmm0
fffff802`7551d71e 4584d2          test    r10b,r10b
fffff802`7551d721 0f842d060000    je      nt!KeBugCheck2+0x954 (fffff802`7551dd54)  Branch

nt!KeBugCheck2+0x327:
fffff802`7551d727 391593f86f00    cmp     dword ptr [nt!ViVerifierEnabled (fffff802`75c1cfc0)],edx
fffff802`7551d72d 7408            je      nt!KeBugCheck2+0x337 (fffff802`7551d737)  Branch

nt!KeBugCheck2+0x32f:
fffff802`7551d72f 8d4a02          lea     ecx,[rdx+2]
fffff802`7551d732 e819694b00      call    nt!VfNotifyVerifierOfEvent (fffff802`759d4050)

nt!KeBugCheck2+0x337:
fffff802`7551d737 84db            test    bl,bl
fffff802`7551d739 7505            jne     nt!KeBugCheck2+0x340 (fffff802`7551d740)  Branch

nt!KeBugCheck2+0x33b:
fffff802`7551d73b e8301b0000      call    nt!KiSaveCurrentEtwTraceBuffer (fffff802`7551f270)

nt!KeBugCheck2+0x340:
fffff802`7551d740 ba60000000      mov     edx,60h
fffff802`7551d745 488d0d142c7300  lea     rcx,[nt!KseEngine (fffff802`75c50360)]
fffff802`7551d74c e84782e9ff      call    nt!IoAddTriageDumpDataBlock (fffff802`753b5998)
fffff802`7551d751 8b4c2460        mov     ecx,dword ptr [rsp+60h]
fffff802`7551d755 81f9e5000000    cmp     ecx,0E5h
fffff802`7551d75b 751f            jne     nt!KeBugCheck2+0x37c (fffff802`7551d77c)  Branch

nt!KeBugCheck2+0x35d:
fffff802`7551d75d e83a1c0000      call    nt!KiScanBugCheckCallbackList (fffff802`7551f39c)
fffff802`7551d762 488b053f316e00  mov     rax,qword ptr [nt!HalPrivateDispatchTable+0x318 (fffff802`75c008a8)]
fffff802`7551d769 33c9            xor     ecx,ecx
fffff802`7551d76b e87093ecff      call    nt!guard_dispatch_icall (fffff802`753e6ae0)
fffff802`7551d770 418bcc          mov     ecx,r12d
fffff802`7551d773 e81878faff      call    nt!HalReturnToFirmware (fffff802`754c4f90)
fffff802`7551d778 8b4c2460        mov     ecx,dword ptr [rsp+60h]

nt!KeBugCheck2+0x37c:
fffff802`7551d77c 81f9d10200c0    cmp     ecx,0C00002D1h
fffff802`7551d782 4c892d3f3c7100  mov     qword ptr [nt!KiBugCheckData+0x8 (fffff802`75c313c8)],r13
fffff802`7551d789 b8c3000000      mov     eax,0C3h
fffff802`7551d78e 4c893d3b3c7100  mov     qword ptr [nt!KiBugCheckData+0x10 (fffff802`75c313d0)],r15
fffff802`7551d795 0f44c8          cmove   ecx,eax
fffff802`7551d798 48893d393c7100  mov     qword ptr [nt!KiBugCheckData+0x18 (fffff802`75c313d8)],rdi
fffff802`7551d79f 8bc1            mov     eax,ecx
fffff802`7551d7a1 488905183c7100  mov     qword ptr [nt!KiBugCheckData (fffff802`75c313c0)],rax
fffff802`7551d7a8 b8cb000000      mov     eax,0CBh
fffff802`7551d7ad 894c2460        mov     dword ptr [rsp+60h],ecx
fffff802`7551d7b1 488935283c7100  mov     qword ptr [nt!KiBugCheckData+0x20 (fffff802`75c313e0)],rsi
fffff802`7551d7b8 3bc8            cmp     ecx,eax
fffff802`7551d7ba 0f8706030000    ja      nt!KeBugCheck2+0x6c6 (fffff802`7551dac6)  Branch

nt!KeBugCheck2+0x3c0:
fffff802`7551d7c0 0f84f7020000    je      nt!KeBugCheck2+0x6bd (fffff802`7551dabd)  Branch

nt!KeBugCheck2+0x3c6:
fffff802`7551d7c6 8bc1            mov     eax,ecx
fffff802`7551d7c8 83e80a          sub     eax,0Ah
fffff802`7551d7cb 0f8443020000    je      nt!KeBugCheck2+0x614 (fffff802`7551da14)  Branch

nt!KeBugCheck2+0x3d1:
fffff802`7551d7d1 83e842          sub     eax,42h
fffff802`7551d7d4 0f84f8010000    je      nt!KeBugCheck2+0x5d2 (fffff802`7551d9d2)  Branch

nt!KeBugCheck2+0x3da:
fffff802`7551d7da 83e804          sub     eax,4
fffff802`7551d7dd 0f84b6000000    je      nt!KeBugCheck2+0x499 (fffff802`7551d899)  Branch

nt!KeBugCheck2+0x3e3:
fffff802`7551d7e3 83e82b          sub     eax,2Bh
fffff802`7551d7e6 0f8490000000    je      nt!KeBugCheck2+0x47c (fffff802`7551d87c)  Branch

nt!KeBugCheck2+0x3ec:
fffff802`7551d7ec 83e813          sub     eax,13h
fffff802`7551d7ef 7409            je      nt!KeBugCheck2+0x3fa (fffff802`7551d7fa)  Branch

nt!KeBugCheck2+0x3f1:
fffff802`7551d7f1 83f830          cmp     eax,30h
fffff802`7551d7f4 0f855e030000    jne     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x3fa:
fffff802`7551d7fa 4d85f6          test    r14,r14
fffff802`7551d7fd 7515            jne     nt!KeBugCheck2+0x414 (fffff802`7551d814)  Branch

nt!KeBugCheck2+0x3ff:
fffff802`7551d7ff 4885ff          test    rdi,rdi
fffff802`7551d802 0f8450030000    je      nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x408:
fffff802`7551d808 4184fc          test    r12b,dil
fffff802`7551d80b 0f8547030000    jne     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x411:
fffff802`7551d811 4c8bf7          mov     r14,rdi

nt!KeBugCheck2+0x414:
fffff802`7551d814 81f98e000000    cmp     ecx,8Eh
fffff802`7551d81a 0f8438030000    je      nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x420:
fffff802`7551d820 498b8668010000  mov     rax,qword ptr [r14+168h]
fffff802`7551d827 48894580        mov     qword ptr [rbp-80h],rax
fffff802`7551d82b 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff802`7551d834 80b84a02000001  cmp     byte ptr [rax+24Ah],1
fffff802`7551d83b 0f8517030000    jne     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x441:
fffff802`7551d841 488b4d80        mov     rcx,qword ptr [rbp-80h]
fffff802`7551d845 e84653d5ff      call    nt!MmIsSessionAddress (fffff802`75272b90)
fffff802`7551d84a 85c0            test    eax,eax
fffff802`7551d84c 0f8406030000    je      nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x452:
fffff802`7551d852 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff802`7551d85b 488b88b8000000  mov     rcx,qword ptr [rax+0B8h]
fffff802`7551d862 f7817c08000000100000 test dword ptr [rcx+87Ch],1000h
fffff802`7551d86c 0f85e6020000    jne     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x472:
fffff802`7551d872 c644247801      mov     byte ptr [rsp+78h],1
fffff802`7551d877 e9dc020000      jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x47c:
fffff802`7551d87c 408ac7          mov     al,dil
fffff802`7551d87f f6d0            not     al
fffff802`7551d881 2401            and     al,1
fffff802`7551d883 88442453        mov     byte ptr [rsp+53h],al
fffff802`7551d887 408ac7          mov     al,dil
fffff802`7551d88a d0e8            shr     al,1
fffff802`7551d88c f6d0            not     al
fffff802`7551d88e 2401            and     al,1
fffff802`7551d890 88442454        mov     byte ptr [rsp+54h],al
fffff802`7551d894 e9bf020000      jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x499:
fffff802`7551d899 33db            xor     ebx,ebx
fffff802`7551d89b 4d85f6          test    r14,r14
fffff802`7551d89e 7515            jne     nt!KeBugCheck2+0x4b5 (fffff802`7551d8b5)  Branch

nt!KeBugCheck2+0x4a0:
fffff802`7551d8a0 4885ff          test    rdi,rdi
fffff802`7551d8a3 0f849f000000    je      nt!KeBugCheck2+0x548 (fffff802`7551d948)  Branch

nt!KeBugCheck2+0x4a9:
fffff802`7551d8a9 4184fc          test    r12b,dil
fffff802`7551d8ac 0f8596000000    jne     nt!KeBugCheck2+0x548 (fffff802`7551d948)  Branch

nt!KeBugCheck2+0x4b2:
fffff802`7551d8b2 4c8bf7          mov     r14,rdi

nt!KeBugCheck2+0x4b5:
fffff802`7551d8b5 498b8e68010000  mov     rcx,qword ptr [r14+168h]
fffff802`7551d8bc 4c8d4c2452      lea     r9,[rsp+52h]
fffff802`7551d8c1 4533c0          xor     r8d,r8d
fffff802`7551d8c4 48894d80        mov     qword ptr [rbp-80h],rcx
fffff802`7551d8c8 488d55a0        lea     rdx,[rbp-60h]
fffff802`7551d8cc 48890d053b7100  mov     qword ptr [nt!KiBugCheckData+0x18 (fffff802`75c313d8)],rcx
fffff802`7551d8d3 e8c8180000      call    nt!KiPcToFileHeader (fffff802`7551f1a0)
fffff802`7551d8d8 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff802`7551d8e1 488bd8          mov     rbx,rax
fffff802`7551d8e4 80b94a02000001  cmp     byte ptr [rcx+24Ah],1
fffff802`7551d8eb 752e            jne     nt!KeBugCheck2+0x51b (fffff802`7551d91b)  Branch

nt!KeBugCheck2+0x4ed:
fffff802`7551d8ed 488b4d80        mov     rcx,qword ptr [rbp-80h]
fffff802`7551d8f1 e89a52d5ff      call    nt!MmIsSessionAddress (fffff802`75272b90)
fffff802`7551d8f6 85c0            test    eax,eax
fffff802`7551d8f8 7421            je      nt!KeBugCheck2+0x51b (fffff802`7551d91b)  Branch

nt!KeBugCheck2+0x4fa:
fffff802`7551d8fa 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff802`7551d903 488b91b8000000  mov     rdx,qword ptr [rcx+0B8h]
fffff802`7551d90a f7827c08000000100000 test dword ptr [rdx+87Ch],1000h
fffff802`7551d914 7505            jne     nt!KeBugCheck2+0x51b (fffff802`7551d91b)  Branch

nt!KeBugCheck2+0x516:
fffff802`7551d916 c644247801      mov     byte ptr [rsp+78h],1

nt!KeBugCheck2+0x51b:
fffff802`7551d91b 498bcd          mov     rcx,r13
fffff802`7551d91e e881080200      call    nt!MmIsSpecialPoolAddress (fffff802`7553e1a4)
fffff802`7551d923 83f801          cmp     eax,1
fffff802`7551d926 7527            jne     nt!KeBugCheck2+0x54f (fffff802`7551d94f)  Branch

nt!KeBugCheck2+0x528:
fffff802`7551d928 807c245201      cmp     byte ptr [rsp+52h],1
fffff802`7551d92d b8d5000000      mov     eax,0D5h
fffff802`7551d932 8a5c2451        mov     bl,byte ptr [rsp+51h]
fffff802`7551d936 8d48f7          lea     ecx,[rax-9]
fffff802`7551d939 0f44c1          cmove   eax,ecx
fffff802`7551d93c 4889057d3a7100  mov     qword ptr [nt!KiBugCheckData (fffff802`75c313c0)],rax
fffff802`7551d943 e910020000      jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x548:
fffff802`7551d948 c644245201      mov     byte ptr [rsp+52h],1
fffff802`7551d94d ebcc            jmp     nt!KeBugCheck2+0x51b (fffff802`7551d91b)  Branch

nt!KeBugCheck2+0x54f:
fffff802`7551d94f 4c396d80        cmp     qword ptr [rbp-80h],r13
fffff802`7551d953 753f            jne     nt!KeBugCheck2+0x594 (fffff802`7551d994)  Branch

nt!KeBugCheck2+0x555:
fffff802`7551d955 498bcd          mov     rcx,r13
fffff802`7551d958 e83352d5ff      call    nt!MmIsSessionAddress (fffff802`75272b90)
fffff802`7551d95d 4c8b7c2458      mov     r15,qword ptr [rsp+58h]
fffff802`7551d962 83f801          cmp     eax,1
fffff802`7551d965 7532            jne     nt!KeBugCheck2+0x599 (fffff802`7551d999)  Branch

nt!KeBugCheck2+0x567:
fffff802`7551d967 498b87f0000000  mov     rax,qword ptr [r15+0F0h]
fffff802`7551d96e 48b9feffffffff7fffff mov rcx,0FFFF7FFFFFFFFFFEh
fffff802`7551d978 48ffc8          dec     rax
fffff802`7551d97b 483bc1          cmp     rax,rcx
fffff802`7551d97e 7619            jbe     nt!KeBugCheck2+0x599 (fffff802`7551d999)  Branch

nt!KeBugCheck2+0x580:
fffff802`7551d980 48c705353a7100cf000000 mov qword ptr [nt!KiBugCheckData (fffff802`75c313c0)],0CFh

nt!KeBugCheck2+0x58b:
fffff802`7551d98b 8a5c2451        mov     bl,byte ptr [rsp+51h]
fffff802`7551d98f e9c9010000      jmp     nt!KeBugCheck2+0x75d (fffff802`7551db5d)  Branch

nt!KeBugCheck2+0x594:
fffff802`7551d994 4c8b7c2458      mov     r15,qword ptr [rsp+58h]

nt!KeBugCheck2+0x599:
fffff802`7551d999 4885db          test    rbx,rbx
fffff802`7551d99c 75ed            jne     nt!KeBugCheck2+0x58b (fffff802`7551d98b)  Branch

nt!KeBugCheck2+0x59e:
fffff802`7551d99e 498bcd          mov     rcx,r13
fffff802`7551d9a1 e8faea0100      call    nt!MmLocateUnloadedDriver (fffff802`7553c4a0)
fffff802`7551d9a6 4c8b742468      mov     r14,qword ptr [rsp+68h]
fffff802`7551d9ab 8a5c2451        mov     bl,byte ptr [rsp+51h]
fffff802`7551d9af 498bf6          mov     rsi,r14
fffff802`7551d9b2 488905b7c27d00  mov     qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)],rax
fffff802`7551d9b9 4885c0          test    rax,rax
fffff802`7551d9bc 0f84a3010000    je      nt!KeBugCheck2+0x765 (fffff802`7551db65)  Branch

nt!KeBugCheck2+0x5c2:
fffff802`7551d9c2 48c705f3397100ce000000 mov qword ptr [nt!KiBugCheckData (fffff802`75c313c0)],0CEh
fffff802`7551d9cd e993010000      jmp     nt!KeBugCheck2+0x765 (fffff802`7551db65)  Branch

nt!KeBugCheck2+0x5d2:
fffff802`7551d9d2 418bc5          mov     eax,r13d
fffff802`7551d9d5 488d0dec397100  lea     rcx,[nt!KiBugCheckData+0x8 (fffff802`75c313c8)]
fffff802`7551d9dc 488905dd397100  mov     qword ptr [nt!KiBugCheckData (fffff802`75c313c0)],rax
fffff802`7551d9e3 4c2bf9          sub     r15,rcx
fffff802`7551d9e6 c644247801      mov     byte ptr [rsp+78h],1
fffff802`7551d9eb 4c8bf7          mov     r14,rdi
fffff802`7551d9ee c644245601      mov     byte ptr [rsp+56h],1

nt!KeBugCheck2+0x5f3:
fffff802`7551d9f3 498b040f        mov     rax,qword ptr [r15+rcx]
fffff802`7551d9f7 488901          mov     qword ptr [rcx],rax
fffff802`7551d9fa 4883c108        add     rcx,8
fffff802`7551d9fe 488d05e3397100  lea     rax,[nt!KiHardwareTrigger (fffff802`75c313e8)]
fffff802`7551da05 483bc8          cmp     rcx,rax
fffff802`7551da08 7ce9            jl      nt!KeBugCheck2+0x5f3 (fffff802`7551d9f3)  Branch

nt!KeBugCheck2+0x60a:
fffff802`7551da0a 4c8b7c2458      mov     r15,qword ptr [rsp+58h]
fffff802`7551da0f e951010000      jmp     nt!KeBugCheck2+0x765 (fffff802`7551db65)  Branch

nt!KeBugCheck2+0x614:
fffff802`7551da14 483b353dc87000  cmp     rsi,qword ptr [nt!ExPoolCodeStart (fffff802`75c2a258)]
fffff802`7551da1b 7219            jb      nt!KeBugCheck2+0x636 (fffff802`7551da36)  Branch

nt!KeBugCheck2+0x61d:
fffff802`7551da1d 483b353cc87000  cmp     rsi,qword ptr [nt!ExPoolCodeEnd (fffff802`75c2a260)]
fffff802`7551da24 7310            jae     nt!KeBugCheck2+0x636 (fffff802`7551da36)  Branch

nt!KeBugCheck2+0x626:
fffff802`7551da26 48c7058f397100c5000000 mov qword ptr [nt!KiBugCheckData (fffff802`75c313c0)],0C5h
fffff802`7551da31 e922010000      jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x636:
fffff802`7551da36 4c8d4c2452      lea     r9,[rsp+52h]
fffff802`7551da3b 4533c0          xor     r8d,r8d
fffff802`7551da3e 488d55a0        lea     rdx,[rbp-60h]
fffff802`7551da42 488bce          mov     rcx,rsi
fffff802`7551da45 e856170000      call    nt!KiPcToFileHeader (fffff802`7551f1a0)
fffff802`7551da4a 807c245201      cmp     byte ptr [rsp+52h],1
fffff802`7551da4f 755c            jne     nt!KeBugCheck2+0x6ad (fffff802`7551daad)  Branch

nt!KeBugCheck2+0x651:
fffff802`7551da51 4c8d4c2452      lea     r9,[rsp+52h]
fffff802`7551da56 41b801000000    mov     r8d,1
fffff802`7551da5c 488d55a0        lea     rdx,[rbp-60h]
fffff802`7551da60 498bcd          mov     rcx,r13
fffff802`7551da63 e838170000      call    nt!KiPcToFileHeader (fffff802`7551f1a0)
fffff802`7551da68 4885c0          test    rax,rax
fffff802`7551da6b 7418            je      nt!KeBugCheck2+0x685 (fffff802`7551da85)  Branch

nt!KeBugCheck2+0x66d:
fffff802`7551da6d 488b45a0        mov     rax,qword ptr [rbp-60h]
fffff802`7551da71 4883c058        add     rax,58h
fffff802`7551da75 48c70540397100d3000000 mov qword ptr [nt!KiBugCheckData (fffff802`75c313c0)],0D3h
fffff802`7551da80 e9cc000000      jmp     nt!KeBugCheck2+0x751 (fffff802`7551db51)  Branch

nt!KeBugCheck2+0x685:
fffff802`7551da85 498bcd          mov     rcx,r13
fffff802`7551da88 e813ea0100      call    nt!MmLocateUnloadedDriver (fffff802`7553c4a0)
fffff802`7551da8d 488905dcc17d00  mov     qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)],rax
fffff802`7551da94 4885c0          test    rax,rax
fffff802`7551da97 0f84bb000000    je      nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x69d:
fffff802`7551da9d 48c70518397100d4000000 mov qword ptr [nt!KiBugCheckData (fffff802`75c313c0)],0D4h
fffff802`7551daa8 e9ab000000      jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x6ad:
fffff802`7551daad 48c70508397100d1000000 mov qword ptr [nt!KiBugCheckData (fffff802`75c313c0)],0D1h
fffff802`7551dab8 e99b000000      jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x6bd:
fffff802`7551dabd 4c896d80        mov     qword ptr [rbp-80h],r13
fffff802`7551dac1 e992000000      jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x6c6:
fffff802`7551dac6 8bc1            mov     eax,ecx
fffff802`7551dac8 2dd8000000      sub     eax,0D8h
fffff802`7551dacd 747a            je      nt!KeBugCheck2+0x749 (fffff802`7551db49)  Branch

nt!KeBugCheck2+0x6cf:
fffff802`7551dacf 83e812          sub     eax,12h
fffff802`7551dad2 746c            je      nt!KeBugCheck2+0x740 (fffff802`7551db40)  Branch

nt!KeBugCheck2+0x6d4:
fffff802`7551dad4 83e805          sub     eax,5
fffff802`7551dad7 0f8495fdffff    je      nt!KeBugCheck2+0x472 (fffff802`7551d872)  Branch

nt!KeBugCheck2+0x6dd:
fffff802`7551dadd 83e80d          sub     eax,0Dh
fffff802`7551dae0 0f8414fdffff    je      nt!KeBugCheck2+0x3fa (fffff802`7551d7fa)  Branch

nt!KeBugCheck2+0x6e6:
fffff802`7551dae6 83e841          sub     eax,41h
fffff802`7551dae9 744c            je      nt!KeBugCheck2+0x737 (fffff802`7551db37)  Branch

nt!KeBugCheck2+0x6eb:
fffff802`7551daeb 83f812          cmp     eax,12h
fffff802`7551daee 7568            jne     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x6f0:
fffff802`7551daf0 4981ff00010000  cmp     r15,100h
fffff802`7551daf7 731a            jae     nt!KeBugCheck2+0x713 (fffff802`7551db13)  Branch

nt!KeBugCheck2+0x6f9:
fffff802`7551daf9 4885f6          test    rsi,rsi
fffff802`7551dafc 7415            je      nt!KeBugCheck2+0x713 (fffff802`7551db13)  Branch

nt!KeBugCheck2+0x6fe:
fffff802`7551dafe 488b4608        mov     rax,qword ptr [rsi+8]
fffff802`7551db02 488b4c2458      mov     rcx,qword ptr [rsp+58h]
fffff802`7551db07 4885c0          test    rax,rax
fffff802`7551db0a 480f45c8        cmovne  rcx,rax
fffff802`7551db0e 48894c2458      mov     qword ptr [rsp+58h],rcx

nt!KeBugCheck2+0x713:
fffff802`7551db13 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff802`7551db1c 488b88b8000000  mov     rcx,qword ptr [rax+0B8h]
fffff802`7551db23 8b917c080000    mov     edx,dword ptr [rcx+87Ch]
fffff802`7551db29 c1ea0c          shr     edx,0Ch
fffff802`7551db2c f6d2            not     dl
fffff802`7551db2e 80e201          and     dl,1
fffff802`7551db31 89542478        mov     dword ptr [rsp+78h],edx
fffff802`7551db35 eb21            jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x737:
fffff802`7551db37 c7458808000000  mov     dword ptr [rbp-78h],8
fffff802`7551db3e eb18            jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x740:
fffff802`7551db40 48893d29c17d00  mov     qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)],rdi
fffff802`7551db47 eb0f            jmp     nt!KeBugCheck2+0x758 (fffff802`7551db58)  Branch

nt!KeBugCheck2+0x749:
fffff802`7551db49 4c896da0        mov     qword ptr [rbp-60h],r13
fffff802`7551db4d 498d4558        lea     rax,[r13+58h]

nt!KeBugCheck2+0x751:
fffff802`7551db51 48890518c17d00  mov     qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)],rax

nt!KeBugCheck2+0x758:
fffff802`7551db58 4c8b7c2458      mov     r15,qword ptr [rsp+58h]

nt!KeBugCheck2+0x75d:
fffff802`7551db5d 4c8b742468      mov     r14,qword ptr [rsp+68h]
fffff802`7551db62 498bf6          mov     rsi,r14

nt!KeBugCheck2+0x765:
fffff802`7551db65 33ff            xor     edi,edi
fffff802`7551db67 40387c2455      cmp     byte ptr [rsp+55h],dil
fffff802`7551db6c 7405            je      nt!KeBugCheck2+0x773 (fffff802`7551db73)  Branch

nt!KeBugCheck2+0x76e:
fffff802`7551db6e e8b1db0000      call    nt!KiAttemptBugcheckRecovery (fffff802`7552b724)

nt!KeBugCheck2+0x773:
fffff802`7551db73 488b054e2d6e00  mov     rax,qword ptr [nt!HalPrivateDispatchTable+0x338 (fffff802`75c008c8)]
fffff802`7551db7a e8618fecff      call    nt!guard_dispatch_icall (fffff802`753e6ae0)
fffff802`7551db7f 812593d87d0000200000 and dword ptr [nt!HvlEnlightenments (fffff802`75cfb41c)],2000h
fffff802`7551db89 b960000000      mov     ecx,60h
fffff802`7551db8e e8adb2feff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)
fffff802`7551db93 488d0d064a6f00  lea     rcx,[nt!KiNmiInProgress (fffff802`75c125a0)]
fffff802`7551db9a e8310bdbff      call    nt!KeIsEmptyAffinityEx (fffff802`752ce6d0)
fffff802`7551db9f 85c0            test    eax,eax
fffff802`7551dba1 8bcf            mov     ecx,edi
fffff802`7551dba3 488b05ee2a6e00  mov     rax,qword ptr [nt!HalPrivateDispatchTable+0x108 (fffff802`75c00698)]
fffff802`7551dbaa 0f94c1          sete    cl
fffff802`7551dbad e82e8fecff      call    nt!guard_dispatch_icall (fffff802`753e6ae0)
fffff802`7551dbb2 488d1507387100  lea     rdx,[nt!KiBugCheckData (fffff802`75c313c0)]
fffff802`7551dbb9 488d4c2460      lea     rcx,[rsp+60h]
fffff802`7551dbbe e83971eaff      call    nt!KiFilterBugCheckInfo (fffff802`753c4cfc)
fffff802`7551dbc3 488b0516387100  mov     rax,qword ptr [nt!KiBugCheckData+0x20 (fffff802`75c313e0)]
fffff802`7551dbca 4c8b0d07387100  mov     r9,qword ptr [nt!KiBugCheckData+0x18 (fffff802`75c313d8)]
fffff802`7551dbd1 4c8b05f8377100  mov     r8,qword ptr [nt!KiBugCheckData+0x10 (fffff802`75c313d0)]
fffff802`7551dbd8 488b15e9377100  mov     rdx,qword ptr [nt!KiBugCheckData+0x8 (fffff802`75c313c8)]
fffff802`7551dbdf 8b0ddb377100    mov     ecx,dword ptr [nt!KiBugCheckData (fffff802`75c313c0)]
fffff802`7551dbe5 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`7551dbea e8dda5fdff      call    nt!HvlLogGuestCrashInformation (fffff802`754f81cc)
fffff802`7551dbef 488b0d7ac07d00  mov     rcx,qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)]
fffff802`7551dbf6 4885c9          test    rcx,rcx
fffff802`7551dbf9 740e            je      nt!KeBugCheck2+0x809 (fffff802`7551dc09)  Branch

nt!KeBugCheck2+0x7fb:
fffff802`7551dbfb 488d9550050000  lea     rdx,[rbp+550h]
fffff802`7551dc02 e8690d0000      call    nt!KiBugCheckUnicodeToAnsi (fffff802`7551e970)
fffff802`7551dc07 eb1f            jmp     nt!KeBugCheck2+0x828 (fffff802`7551dc28)  Branch

nt!KeBugCheck2+0x809:
fffff802`7551dc09 48397d80        cmp     qword ptr [rbp-80h],rdi
fffff802`7551dc0d 7419            je      nt!KeBugCheck2+0x828 (fffff802`7551dc28)  Branch

nt!KeBugCheck2+0x80f:
fffff802`7551dc0f 41b101          mov     r9b,1
fffff802`7551dc12 488d5580        lea     rdx,[rbp-80h]
fffff802`7551dc16 41b801000000    mov     r8d,1
fffff802`7551dc1c 488d8d50050000  lea     rcx,[rbp+550h]
fffff802`7551dc23 e85c110000      call    nt!KiDumpParameterImages (fffff802`7551ed84)

nt!KeBugCheck2+0x828:
fffff802`7551dc28 40383db5166f00  cmp     byte ptr [nt!KdPitchDebugger (fffff802`75c0f2e4)],dil
fffff802`7551dc2f 750e            jne     nt!KeBugCheck2+0x83f (fffff802`7551dc3f)  Branch

nt!KeBugCheck2+0x831:
fffff802`7551dc31 488d8580000000  lea     rax,[rbp+80h]
fffff802`7551dc38 488905092f6e00  mov     qword ptr [nt!KdDebuggerDataBlock+0x28 (fffff802`75c00b48)],rax

nt!KeBugCheck2+0x83f:
fffff802`7551dc3f 817c2460e2000000 cmp     dword ptr [rsp+60h],0E2h
fffff802`7551dc47 0f8400010000    je      nt!KeBugCheck2+0x94d (fffff802`7551dd4d)  Branch

nt!KeBugCheck2+0x84d:
fffff802`7551dc4d 40383d34447100  cmp     byte ptr [nt!KdDebuggerEnabled (fffff802`75c32088)],dil
fffff802`7551dc54 750d            jne     nt!KeBugCheck2+0x863 (fffff802`7551dc63)  Branch

nt!KeBugCheck2+0x856:
fffff802`7551dc56 40383df4527200  cmp     byte ptr [nt!KdEventLoggingEnabled (fffff802`75c42f51)],dil
fffff802`7551dc5d 0f84ea000000    je      nt!KeBugCheck2+0x94d (fffff802`7551dd4d)  Branch

nt!KeBugCheck2+0x863:
fffff802`7551dc63 40383dfebf7d00  cmp     byte ptr [nt!KiHypervisorInitiatedCrashDump (fffff802`75cf9c68)],dil
fffff802`7551dc6a 0f85dd000000    jne     nt!KeBugCheck2+0x94d (fffff802`7551dd4d)  Branch

nt!KeBugCheck2+0x870:
fffff802`7551dc70 e87bb1e9ff      call    nt!KdRefreshDebuggerNotPresent (fffff802`753b8df0)
fffff802`7551dc75 84c0            test    al,al
fffff802`7551dc77 740d            je      nt!KeBugCheck2+0x886 (fffff802`7551dc86)  Branch

nt!KeBugCheck2+0x879:
fffff802`7551dc79 40383da32a7200  cmp     byte ptr [nt!KdEventLoggingPresent (fffff802`75c40723)],dil
fffff802`7551dc80 0f84c7000000    je      nt!KeBugCheck2+0x94d (fffff802`7551dd4d)  Branch

nt!KeBugCheck2+0x886:
fffff802`7551dc86 488b7d90        mov     rdi,qword ptr [rbp-70h]
fffff802`7551dc8a 80bfe67b000000  cmp     byte ptr [rdi+7BE6h],0
fffff802`7551dc91 0f8595000000    jne     nt!KeBugCheck2+0x92c (fffff802`7551dd2c)  Branch

nt!KeBugCheck2+0x897:
fffff802`7551dc97 488b0542377100  mov     rax,qword ptr [nt!KiBugCheckData+0x20 (fffff802`75c313e0)]
fffff802`7551dc9e 4c8d05ab51edff  lea     r8,[nt! ?? ::FNODOBFM::`string' (fffff802`753f2e50)]
fffff802`7551dca5 448b0d14377100  mov     r9d,dword ptr [nt!KiBugCheckData (fffff802`75c313c0)]
fffff802`7551dcac 33d2            xor     edx,edx
fffff802`7551dcae 4889442438      mov     qword ptr [rsp+38h],rax
fffff802`7551dcb3 488b051e377100  mov     rax,qword ptr [nt!KiBugCheckData+0x18 (fffff802`75c313d8)]
fffff802`7551dcba 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`7551dcbf 488b050a377100  mov     rax,qword ptr [nt!KiBugCheckData+0x10 (fffff802`75c313d0)]
fffff802`7551dcc6 8d4a65          lea     ecx,[rdx+65h]
fffff802`7551dcc9 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`7551dcce 488b05f3367100  mov     rax,qword ptr [nt!KiBugCheckData+0x8 (fffff802`75c313c8)]
fffff802`7551dcd5 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`7551dcda e8b1cfe4ff      call    nt!DbgPrintEx (fffff802`7536ac90)
fffff802`7551dcdf 48833d89bf7d0000 cmp     qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)],0
fffff802`7551dce7 7418            je      nt!KeBugCheck2+0x901 (fffff802`7551dd01)  Branch

nt!KeBugCheck2+0x8e9:
fffff802`7551dce9 33d2            xor     edx,edx
fffff802`7551dceb 4c8d8d50050000  lea     r9,[rbp+550h]
fffff802`7551dcf2 4c8d05a751edff  lea     r8,[nt! ?? ::FNODOBFM::`string' (fffff802`753f2ea0)]
fffff802`7551dcf9 8d4a65          lea     ecx,[rdx+65h]
fffff802`7551dcfc e88fcfe4ff      call    nt!DbgPrintEx (fffff802`7536ac90)

nt!KeBugCheck2+0x901:
fffff802`7551dd01 807c245600      cmp     byte ptr [rsp+56h],0
fffff802`7551dd06 7424            je      nt!KeBugCheck2+0x92c (fffff802`7551dd2c)  Branch

nt!KeBugCheck2+0x908:
fffff802`7551dd08 4d85f6          test    r14,r14
fffff802`7551dd0b 740d            je      nt!KeBugCheck2+0x91a (fffff802`7551dd1a)  Branch

nt!KeBugCheck2+0x90d:
fffff802`7551dd0d 33d2            xor     edx,edx
fffff802`7551dd0f 4d8bc6          mov     r8,r14
fffff802`7551dd12 8d4a65          lea     ecx,[rdx+65h]
fffff802`7551dd15 e876cfe4ff      call    nt!DbgPrintEx (fffff802`7536ac90)

nt!KeBugCheck2+0x91a:
fffff802`7551dd1a 4885f6          test    rsi,rsi
fffff802`7551dd1d 740d            je      nt!KeBugCheck2+0x92c (fffff802`7551dd2c)  Branch

nt!KeBugCheck2+0x91f:
fffff802`7551dd1f 33d2            xor     edx,edx
fffff802`7551dd21 4c8bc6          mov     r8,rsi
fffff802`7551dd24 8d4a65          lea     ecx,[rdx+65h]
fffff802`7551dd27 e864cfe4ff      call    nt!DbgPrintEx (fffff802`7536ac90)

nt!KeBugCheck2+0x92c:
fffff802`7551dd2c 803d5543710000  cmp     byte ptr [nt!KdDebuggerEnabled (fffff802`75c32088)],0
fffff802`7551dd33 7411            je      nt!KeBugCheck2+0x946 (fffff802`7551dd46)  Branch

nt!KeBugCheck2+0x935:
fffff802`7551dd35 803d1452720000  cmp     byte ptr [nt!KdDebuggerNotPresent (fffff802`75c42f50)],0
fffff802`7551dd3c 7508            jne     nt!KeBugCheck2+0x946 (fffff802`7551dd46)  Branch

nt!KeBugCheck2+0x93e:
fffff802`7551dd3e 418bcc          mov     ecx,r12d
fffff802`7551dd41 e80a0a0000      call    nt!KiBugCheckDebugBreak (fffff802`7551e750)

nt!KeBugCheck2+0x946:
fffff802`7551dd46 448a542450      mov     r10b,byte ptr [rsp+50h]
fffff802`7551dd4b eb10            jmp     nt!KeBugCheck2+0x95d (fffff802`7551dd5d)  Branch

nt!KeBugCheck2+0x94d:
fffff802`7551dd4d 448a542450      mov     r10b,byte ptr [rsp+50h]
fffff802`7551dd52 eb05            jmp     nt!KeBugCheck2+0x959 (fffff802`7551dd59)  Branch

nt!KeBugCheck2+0x954:
fffff802`7551dd54 4c8b7c2458      mov     r15,qword ptr [rsp+58h]

nt!KeBugCheck2+0x959:
fffff802`7551dd59 488b7d90        mov     rdi,qword ptr [rbp-70h]

nt!KeBugCheck2+0x95d:
fffff802`7551dd5d fa              cli
fffff802`7551dd5e 440f20c1        mov     rcx,cr8
fffff802`7551dd62 ba0f000000      mov     edx,0Fh
fffff802`7551dd67 440f22c2        mov     cr8,rdx
fffff802`7551dd6b 8b05e7d87d00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff802`75cfb658)]
fffff802`7551dd71 85c0            test    eax,eax
fffff802`7551dd73 743a            je      nt!KeBugCheck2+0x9af (fffff802`7551ddaf)  Branch

nt!KeBugCheck2+0x975:
fffff802`7551dd75 a801            test    al,1
fffff802`7551dd77 7436            je      nt!KeBugCheck2+0x9af (fffff802`7551ddaf)  Branch

nt!KeBugCheck2+0x979:
fffff802`7551dd79 3aca            cmp     cl,dl
fffff802`7551dd7b 7732            ja      nt!KeBugCheck2+0x9af (fffff802`7551ddaf)  Branch

nt!KeBugCheck2+0x97d:
fffff802`7551dd7d 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff802`7551dd86 ba01000000      mov     edx,1
fffff802`7551dd8b 0fb6c9          movzx   ecx,cl
fffff802`7551dd8e ffc1            inc     ecx
fffff802`7551dd90 48d3e2          shl     rdx,cl
fffff802`7551dd93 4c8b88b8840000  mov     r9,qword ptr [rax+84B8h]
fffff802`7551dd9a ffca            dec     edx
fffff802`7551dd9c f7d2            not     edx
fffff802`7551dd9e 81e2fcff0000    and     edx,0FFFCh
fffff802`7551dda4 458b4114        mov     r8d,dword ptr [r9+14h]
fffff802`7551dda8 410bd0          or      edx,r8d
fffff802`7551ddab 41895114        mov     dword ptr [r9+14h],edx

nt!KeBugCheck2+0x9af:
fffff802`7551ddaf 4584d2          test    r10b,r10b
fffff802`7551ddb2 0f84f8020000    je      nt!KeBugCheck2+0xcb0 (fffff802`7551e0b0)  Branch

nt!KeBugCheck2+0x9b8:
fffff802`7551ddb8 8b0546d67d00    mov     eax,dword ptr [nt!KeNumberProcessors (fffff802`75cfb404)]
fffff802`7551ddbe 83f801          cmp     eax,1
fffff802`7551ddc1 7642            jbe     nt!KeBugCheck2+0xa05 (fffff802`7551de05)  Branch

nt!KeBugCheck2+0x9c3:
fffff802`7551ddc3 803d9ebe7d0000  cmp     byte ptr [nt!KiHypervisorInitiatedCrashDump (fffff802`75cf9c68)],0
fffff802`7551ddca 7539            jne     nt!KeBugCheck2+0xa05 (fffff802`7551de05)  Branch

nt!KeBugCheck2+0x9cc:
fffff802`7551ddcc 488bcf          mov     rcx,rdi
fffff802`7551ddcf e8306f0000      call    nt!KiSetDebuggerOwner (fffff802`75524d04)
fffff802`7551ddd4 488d1555da7d00  lea     rdx,[nt!KeActiveProcessors (fffff802`75cfb830)]
fffff802`7551dddb 488d4dd0        lea     rcx,[rbp-30h]
fffff802`7551dddf e8cc20dbff      call    nt!KeCopyAffinityEx (fffff802`752cfeb0)
fffff802`7551dde4 8b5724          mov     edx,dword ptr [rdi+24h]
fffff802`7551dde7 488d4dd0        lea     rcx,[rbp-30h]
fffff802`7551ddeb e88020dbff      call    nt!KeRemoveProcessorAffinityEx (fffff802`752cfe70)
fffff802`7551ddf0 33d2            xor     edx,edx
fffff802`7551ddf2 488d4dd0        lea     rcx,[rbp-30h]
fffff802`7551ddf6 e8756c0000      call    nt!KiSendFreeze (fffff802`75524a70)
fffff802`7551ddfb b940420f00      mov     ecx,0F4240h
fffff802`7551de00 e8fb90daff      call    nt!KeStallExecutionProcessor (fffff802`752c6f00)

nt!KeBugCheck2+0xa05:
fffff802`7551de05 8b4c2460        mov     ecx,dword ptr [rsp+60h]
fffff802`7551de09 498bd5          mov     rdx,r13
fffff802`7551de0c e8b7adfeff      call    nt!IoInitializeBugCheckProgress (fffff802`75508bc8)
fffff802`7551de11 b901000000      mov     ecx,1
fffff802`7551de16 e825b0feff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)
fffff802`7551de1b 408a742454      mov     sil,byte ptr [rsp+54h]
fffff802`7551de20 4533ed          xor     r13d,r13d
fffff802`7551de23 84db            test    bl,bl
fffff802`7551de25 753d            jne     nt!KeBugCheck2+0xa64 (fffff802`7551de64)  Branch

nt!KeBugCheck2+0xa27:
fffff802`7551de27 4c392d622b7300  cmp     qword ptr [nt!CrashdmpDumpBlock (fffff802`75c50990)],r13
fffff802`7551de2e 7405            je      nt!KeBugCheck2+0xa35 (fffff802`7551de35)  Branch

nt!KeBugCheck2+0xa30:
fffff802`7551de30 4084f6          test    sil,sil
fffff802`7551de33 7508            jne     nt!KeBugCheck2+0xa3d (fffff802`7551de3d)  Branch

nt!KeBugCheck2+0xa35:
fffff802`7551de35 8b4d88          mov     ecx,dword ptr [rbp-78h]
fffff802`7551de38 83c904          or      ecx,4
fffff802`7551de3b eb03            jmp     nt!KeBugCheck2+0xa40 (fffff802`7551de40)  Branch

nt!KeBugCheck2+0xa3d:
fffff802`7551de3d 8b4d88          mov     ecx,dword ptr [rbp-78h]

nt!KeBugCheck2+0xa40:
fffff802`7551de40 448a742453      mov     r14b,byte ptr [rsp+53h]
fffff802`7551de45 8bc1            mov     eax,ecx
fffff802`7551de47 83c802          or      eax,2
fffff802`7551de4a 44386c2455      cmp     byte ptr [rsp+55h],r13b
fffff802`7551de4f 0f45c1          cmovne  eax,ecx
fffff802`7551de52 8bc8            mov     ecx,eax
fffff802`7551de54 83c901          or      ecx,1
fffff802`7551de57 4584f6          test    r14b,r14b
fffff802`7551de5a 0f45c8          cmovne  ecx,eax
fffff802`7551de5d e88e0b0000      call    nt!KiDisplayBlueScreen (fffff802`7551e9f0)
fffff802`7551de62 eb05            jmp     nt!KeBugCheck2+0xa69 (fffff802`7551de69)  Branch

nt!KeBugCheck2+0xa64:
fffff802`7551de64 448a742453      mov     r14b,byte ptr [rsp+53h]

nt!KeBugCheck2+0xa69:
fffff802`7551de69 e8eee6fdff      call    nt!HvlPrepareForRootCrashdump (fffff802`754fc55c)
fffff802`7551de6e 84db            test    bl,bl
fffff802`7551de70 7526            jne     nt!KeBugCheck2+0xa98 (fffff802`7551de98)  Branch

nt!KeBugCheck2+0xa72:
fffff802`7551de72 33d2            xor     edx,edx
fffff802`7551de74 4533c0          xor     r8d,r8d
fffff802`7551de77 8d4a01          lea     ecx,[rdx+1]
fffff802`7551de7a e859120000      call    nt!KiInvokeBugCheckEntryCallbacks (fffff802`7551f0d8)
fffff802`7551de7f b902000000      mov     ecx,2
fffff802`7551de84 e8b7affeff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)
fffff802`7551de89 e88e100000      call    nt!KiInvokeBugCheckAddTriageDumpDataCallbacks (fffff802`7551ef1c)
fffff802`7551de8e b905000000      mov     ecx,5
fffff802`7551de93 e8a8affeff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)

nt!KeBugCheck2+0xa98:
fffff802`7551de98 44382de9417100  cmp     byte ptr [nt!KdDebuggerEnabled (fffff802`75c32088)],r13b
fffff802`7551de9f 7510            jne     nt!KeBugCheck2+0xab1 (fffff802`7551deb1)  Branch

nt!KeBugCheck2+0xaa1:
fffff802`7551dea1 44382d3c146f00  cmp     byte ptr [nt!KdPitchDebugger (fffff802`75c0f2e4)],r13b
fffff802`7551dea8 7507            jne     nt!KeBugCheck2+0xab1 (fffff802`7551deb1)  Branch

nt!KeBugCheck2+0xaaa:
fffff802`7551deaa 33c9            xor     ecx,ecx
fffff802`7551deac e87b95ffff      call    nt!KdEnableDebuggerWithLock (fffff802`7551742c)

nt!KeBugCheck2+0xab1:
fffff802`7551deb1 488b87c0850000  mov     rax,qword ptr [rdi+85C0h]
fffff802`7551deb8 488d8d80000000  lea     rcx,[rbp+80h]
fffff802`7551debf ba09000000      mov     edx,9
fffff802`7551dec4 448d4277        lea     r8d,[rdx+77h]

nt!KeBugCheck2+0xac8:
fffff802`7551dec8 0f1001          movups  xmm0,xmmword ptr [rcx]
fffff802`7551decb 0f1100          movups  xmmword ptr [rax],xmm0
fffff802`7551dece 0f104910        movups  xmm1,xmmword ptr [rcx+10h]
fffff802`7551ded2 0f114810        movups  xmmword ptr [rax+10h],xmm1
fffff802`7551ded6 0f104120        movups  xmm0,xmmword ptr [rcx+20h]
fffff802`7551deda 0f114020        movups  xmmword ptr [rax+20h],xmm0
fffff802`7551dede 0f104930        movups  xmm1,xmmword ptr [rcx+30h]
fffff802`7551dee2 0f114830        movups  xmmword ptr [rax+30h],xmm1
fffff802`7551dee6 0f104140        movups  xmm0,xmmword ptr [rcx+40h]
fffff802`7551deea 0f114040        movups  xmmword ptr [rax+40h],xmm0
fffff802`7551deee 0f104950        movups  xmm1,xmmword ptr [rcx+50h]
fffff802`7551def2 0f114850        movups  xmmword ptr [rax+50h],xmm1
fffff802`7551def6 0f104160        movups  xmm0,xmmword ptr [rcx+60h]
fffff802`7551defa 0f114060        movups  xmmword ptr [rax+60h],xmm0
fffff802`7551defe 4903c0          add     rax,r8
fffff802`7551df01 0f104970        movups  xmm1,xmmword ptr [rcx+70h]
fffff802`7551df05 4903c8          add     rcx,r8
fffff802`7551df08 0f1148f0        movups  xmmword ptr [rax-10h],xmm1
fffff802`7551df0c 4883ea01        sub     rdx,1
fffff802`7551df10 75b6            jne     nt!KeBugCheck2+0xac8 (fffff802`7551dec8)  Branch

nt!KeBugCheck2+0xb12:
fffff802`7551df12 0f1001          movups  xmm0,xmmword ptr [rcx]
fffff802`7551df15 0f1100          movups  xmmword ptr [rax],xmm0
fffff802`7551df18 0f104910        movups  xmm1,xmmword ptr [rcx+10h]
fffff802`7551df1c 0f114810        movups  xmmword ptr [rax+10h],xmm1
fffff802`7551df20 0f104120        movups  xmm0,xmmword ptr [rcx+20h]
fffff802`7551df24 0f114020        movups  xmmword ptr [rax+20h],xmm0
fffff802`7551df28 0f104930        movups  xmm1,xmmword ptr [rcx+30h]
fffff802`7551df2c 0f114830        movups  xmmword ptr [rax+30h],xmm1
fffff802`7551df30 0f104140        movups  xmm0,xmmword ptr [rcx+40h]
fffff802`7551df34 0f114040        movups  xmmword ptr [rax+40h],xmm0
fffff802`7551df38 4084f6          test    sil,sil
fffff802`7551df3b 0f84d1010000    je      nt!KeBugCheck2+0xd12 (fffff802`7551e112)  Branch

nt!KeBugCheck2+0xb41:
fffff802`7551df41 817c246009010000 cmp     dword ptr [rsp+60h],109h
fffff802`7551df49 7553            jne     nt!KeBugCheck2+0xb9e (fffff802`7551df9e)  Branch

nt!KeBugCheck2+0xb4b:
fffff802`7551df4b 4c8b0d8e347100  mov     r9,qword ptr [nt!KiBugCheckData+0x20 (fffff802`75c313e0)]
fffff802`7551df52 4c8b057f347100  mov     r8,qword ptr [nt!KiBugCheckData+0x18 (fffff802`75c313d8)]
fffff802`7551df59 488b1570347100  mov     rdx,qword ptr [nt!KiBugCheckData+0x10 (fffff802`75c313d0)]
fffff802`7551df60 488b0d61347100  mov     rcx,qword ptr [nt!KiBugCheckData+0x8 (fffff802`75c313c8)]
fffff802`7551df67 e82c77eaff      call    nt!KiMarkBugCheckRegions (fffff802`753c5698)
fffff802`7551df6c 48833d6c3471002f cmp     qword ptr [nt!KiBugCheckData+0x20 (fffff802`75c313e0)],2Fh
fffff802`7551df74 7528            jne     nt!KeBugCheck2+0xb9e (fffff802`7551df9e)  Branch

nt!KeBugCheck2+0xb76:
fffff802`7551df76 488b1d5b347100  mov     rbx,qword ptr [nt!KiBugCheckData+0x18 (fffff802`75c313d8)]
fffff802`7551df7d 488d8b88070000  lea     rcx,[rbx+788h]
fffff802`7551df84 e897f80100      call    nt!MmIsAddressValid (fffff802`7553d820)
fffff802`7551df89 84c0            test    al,al
fffff802`7551df8b 7411            je      nt!KeBugCheck2+0xb9e (fffff802`7551df9e)  Branch

nt!KeBugCheck2+0xb8d:
fffff802`7551df8d 488b8b88070000  mov     rcx,qword ptr [rbx+788h]
fffff802`7551df94 ba00100000      mov     edx,1000h
fffff802`7551df99 e8fa79e9ff      call    nt!IoAddTriageDumpDataBlock (fffff802`753b5998)

nt!KeBugCheck2+0xb9e:
fffff802`7551df9e e8118fffff      call    nt!KdDecodeDataBlock (fffff802`75516eb4)
fffff802`7551dfa3 817c24608b010000 cmp     dword ptr [rsp+60h],18Bh
fffff802`7551dfab 7568            jne     nt!KeBugCheck2+0xc15 (fffff802`7551e015)  Branch

nt!KeBugCheck2+0xbad:
fffff802`7551dfad 48813d103471008c010000 cmp qword ptr [nt!KiBugCheckData+0x8 (fffff802`75c313c8)],18Ch
fffff802`7551dfb8 0f859a000000    jne     nt!KeBugCheck2+0xc58 (fffff802`7551e058)  Branch

nt!KeBugCheck2+0xbbe:
fffff802`7551dfbe 8b05fc657100    mov     eax,dword ptr [nt!KdpBreakpointChangeCount (fffff802`75c345c0)]
fffff802`7551dfc4 85c0            test    eax,eax
fffff802`7551dfc6 7411            je      nt!KeBugCheck2+0xbd9 (fffff802`7551dfd9)  Branch

nt!KeBugCheck2+0xbc8:
fffff802`7551dfc8 ba04000000      mov     edx,4
fffff802`7551dfcd 488d0dec657100  lea     rcx,[nt!KdpBreakpointChangeCount (fffff802`75c345c0)]
fffff802`7551dfd4 e8bf79e9ff      call    nt!IoAddTriageDumpDataBlock (fffff802`753b5998)

nt!KeBugCheck2+0xbd9:
fffff802`7551dfd9 ba080a0000      mov     edx,0A08h
fffff802`7551dfde 488d0d9b487e00  lea     rcx,[nt!VslpTraceLog (fffff802`75d02880)]
fffff802`7551dfe5 e8ae79e9ff      call    nt!IoAddTriageDumpDataBlock (fffff802`753b5998)
fffff802`7551dfea 4c392d7fd77d00  cmp     qword ptr [nt!VslpHotpatchLog (fffff802`75cfb770)],r13
fffff802`7551dff1 7422            je      nt!KeBugCheck2+0xc15 (fffff802`7551e015)  Branch

nt!KeBugCheck2+0xbf3:
fffff802`7551dff3 ba08000000      mov     edx,8
fffff802`7551dff8 488d0d71d77d00  lea     rcx,[nt!VslpHotpatchLog (fffff802`75cfb770)]
fffff802`7551dfff e89479e9ff      call    nt!IoAddTriageDumpDataBlock (fffff802`753b5998)
fffff802`7551e004 488b0d65d77d00  mov     rcx,qword ptr [nt!VslpHotpatchLog (fffff802`75cfb770)]
fffff802`7551e00b ba08000500      mov     edx,50008h
fffff802`7551e010 e88379e9ff      call    nt!IoAddTriageDumpDataBlock (fffff802`753b5998)

nt!KeBugCheck2+0xc15:
fffff802`7551e015 817c2460ef000000 cmp     dword ptr [rsp+60h],0EFh
fffff802`7551e01d 7539            jne     nt!KeBugCheck2+0xc58 (fffff802`7551e058)  Branch

nt!KeBugCheck2+0xc1f:
fffff802`7551e01f e868960500      call    nt!PoAddPowerTriageData (fffff802`7557768c)
fffff802`7551e024 44392d55b66f00  cmp     dword ptr [nt!CriticalProcessExceptionData (fffff802`75c19680)],r13d
fffff802`7551e02b 742b            je      nt!KeBugCheck2+0xc58 (fffff802`7551e058)  Branch

nt!KeBugCheck2+0xc2d:
fffff802`7551e02d ba30000000      mov     edx,30h
fffff802`7551e032 488d0d47b66f00  lea     rcx,[nt!CriticalProcessExceptionData (fffff802`75c19680)]
fffff802`7551e039 e85a79e9ff      call    nt!IoAddTriageDumpDataBlock (fffff802`753b5998)
fffff802`7551e03e 0fb7054bb66f00  movzx   eax,word ptr [nt!CriticalProcessExceptionData+0x10 (fffff802`75c19690)]
fffff802`7551e045 6685c0          test    ax,ax
fffff802`7551e048 740e            je      nt!KeBugCheck2+0xc58 (fffff802`7551e058)  Branch

nt!KeBugCheck2+0xc4a:
fffff802`7551e04a 488b0d47b66f00  mov     rcx,qword ptr [nt!CriticalProcessExceptionData+0x18 (fffff802`75c19698)]
fffff802`7551e051 8bd0            mov     edx,eax
fffff802`7551e053 e84079e9ff      call    nt!IoAddTriageDumpDataBlock (fffff802`753b5998)

nt!KeBugCheck2+0xc58:
fffff802`7551e058 8b442478        mov     eax,dword ptr [rsp+78h]
fffff802`7551e05c 4c8b0d75337100  mov     r9,qword ptr [nt!KiBugCheckData+0x18 (fffff802`75c313d8)]
fffff802`7551e063 4c8b0566337100  mov     r8,qword ptr [nt!KiBugCheckData+0x10 (fffff802`75c313d0)]
fffff802`7551e06a 488b1557337100  mov     rdx,qword ptr [nt!KiBugCheckData+0x8 (fffff802`75c313c8)]
fffff802`7551e071 8b0d49337100    mov     ecx,dword ptr [nt!KiBugCheckData (fffff802`75c313c0)]
fffff802`7551e077 88442440        mov     byte ptr [rsp+40h],al
fffff802`7551e07b 488b45c0        mov     rax,qword ptr [rbp-40h]
fffff802`7551e07f 4889442438      mov     qword ptr [rsp+38h],rax
fffff802`7551e084 488d8580000000  lea     rax,[rbp+80h]
fffff802`7551e08b 4c897c2430      mov     qword ptr [rsp+30h],r15
fffff802`7551e090 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`7551e095 488b0544337100  mov     rax,qword ptr [nt!KiBugCheckData+0x20 (fffff802`75c313e0)]
fffff802`7551e09c 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`7551e0a1 e8eab2feff      call    nt!IoWriteCrashDump (fffff802`75509390)
fffff802`7551e0a6 418bcc          mov     ecx,r12d
fffff802`7551e0a9 e892adfeff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)
fffff802`7551e0ae eb62            jmp     nt!KeBugCheck2+0xd12 (fffff802`7551e112)  Branch

nt!KeBugCheck2+0xcb0:
fffff802`7551e0b0 8b1d02337100    mov     ebx,dword ptr [nt!KiBugCheckActive (fffff802`75c313b8)]
fffff802`7551e0b6 8bc3            mov     eax,ebx
fffff802`7551e0b8 c1e804          shr     eax,4
fffff802`7551e0bb 3945a8          cmp     dword ptr [rbp-58h],eax
fffff802`7551e0be 740d            je      nt!KeBugCheck2+0xccd (fffff802`7551e0cd)  Branch

nt!KeBugCheck2+0xcc0:
fffff802`7551e0c0 33d2            xor     edx,edx
fffff802`7551e0c2 33c9            xor     ecx,ecx
fffff802`7551e0c4 e897aeffff      call    nt!KiCheckForFreezeExecution (fffff802`75518f60)
fffff802`7551e0c9 f390            pause
fffff802`7551e0cb ebf3            jmp     nt!KeBugCheck2+0xcc0 (fffff802`7551e0c0)  Branch

nt!KeBugCheck2+0xccd:
fffff802`7551e0cd 4533ed          xor     r13d,r13d
fffff802`7551e0d0 44382d91bb7d00  cmp     byte ptr [nt!KiHypervisorInitiatedCrashDump (fffff802`75cf9c68)],r13b
fffff802`7551e0d7 0f8511010000    jne     nt!KeBugCheck2+0xdee (fffff802`7551e1ee)  Branch

nt!KeBugCheck2+0xcdd:
fffff802`7551e0dd 8bc3            mov     eax,ebx
fffff802`7551e0df 240c            and     al,0Ch
fffff802`7551e0e1 3c08            cmp     al,8
fffff802`7551e0e3 0f8305010000    jae     nt!KeBugCheck2+0xdee (fffff802`7551e1ee)  Branch

nt!KeBugCheck2+0xce9:
fffff802`7551e0e9 b900000200      mov     ecx,20000h
fffff802`7551e0ee e875affeff      call    nt!IoSetBugCheckProgressFlag (fffff802`75509068)
fffff802`7551e0f3 418d4504        lea     eax,[r13+4]
fffff802`7551e0f7 f00fc105b9327100 lock xadd dword ptr [nt!KiBugCheckActive (fffff802`75c313b8)],eax
fffff802`7551e0ff f6c30c          test    bl,0Ch
fffff802`7551e102 7409            je      nt!KeBugCheck2+0xd0d (fffff802`7551e10d)  Branch

nt!KeBugCheck2+0xd04:
fffff802`7551e104 418d4d04        lea     ecx,[r13+4]
fffff802`7551e108 e843060000      call    nt!KiBugCheckDebugBreak (fffff802`7551e750)

nt!KeBugCheck2+0xd0d:
fffff802`7551e10d 448a742453      mov     r14b,byte ptr [rsp+53h]

nt!KeBugCheck2+0xd12:
fffff802`7551e112 44382defd27d00  cmp     byte ptr [nt!VslVsmEnabled (fffff802`75cfb408)],r13b
fffff802`7551e119 752c            jne     nt!KeBugCheck2+0xd47 (fffff802`7551e147)  Branch

nt!KeBugCheck2+0xd1b:
fffff802`7551e11b 8b05ebd27d00    mov     eax,dword ptr [nt!HvlpFlags (fffff802`75cfb40c)]
fffff802`7551e121 a802            test    al,2
fffff802`7551e123 740a            je      nt!KeBugCheck2+0xd2f (fffff802`7551e12f)  Branch

nt!KeBugCheck2+0xd25:
fffff802`7551e125 b902000000      mov     ecx,2
fffff802`7551e12a e865e3fdff      call    nt!HvlNotifyRootCrashdump (fffff802`754fc494)

nt!KeBugCheck2+0xd2f:
fffff802`7551e12f 8b0547d47d00    mov     eax,dword ptr [nt!HvlpEnlightenments (fffff802`75cfb57c)]
fffff802`7551e135 8905e1d27d00    mov     dword ptr [nt!HvlEnlightenments (fffff802`75cfb41c)],eax
fffff802`7551e13b 488b0566266e00  mov     rax,qword ptr [nt!HalPrivateDispatchTable+0x218 (fffff802`75c007a8)]
fffff802`7551e142 e89989ecff      call    nt!guard_dispatch_icall (fffff802`753e6ae0)

nt!KeBugCheck2+0xd47:
fffff802`7551e147 b963000000      mov     ecx,63h
fffff802`7551e14c e8efacfeff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)
fffff802`7551e151 44386c2451      cmp     byte ptr [rsp+51h],r13b
fffff802`7551e156 7505            jne     nt!KeBugCheck2+0xd5d (fffff802`7551e15d)  Branch

nt!KeBugCheck2+0xd58:
fffff802`7551e158 e83f120000      call    nt!KiScanBugCheckCallbackList (fffff802`7551f39c)

nt!KeBugCheck2+0xd5d:
fffff802`7551e15d 488b0554276e00  mov     rax,qword ptr [nt!HalPrivateDispatchTable+0x328 (fffff802`75c008b8)]
fffff802`7551e164 e87789ecff      call    nt!guard_dispatch_icall (fffff802`753e6ae0)
fffff802`7551e169 b904000000      mov     ecx,4
fffff802`7551e16e e8cdacfeff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)
fffff802`7551e173 44386c2455      cmp     byte ptr [rsp+55h],r13b
fffff802`7551e178 744e            je      nt!KeBugCheck2+0xdc8 (fffff802`7551e1c8)  Branch

nt!KeBugCheck2+0xd7a:
fffff802`7551e17a 33c9            xor     ecx,ecx
fffff802`7551e17c c605ddba7d0001  mov     byte ptr [nt!KiResumeForReboot (fffff802`75cf9c60)],1
fffff802`7551e183 e8b8690000      call    nt!KiSendThawExecution (fffff802`75524b40)
fffff802`7551e188 e827080000      call    nt!KiBugcheckUnloadDebugSymbols (fffff802`7551e9b4)
fffff802`7551e18d 488b0514276e00  mov     rax,qword ptr [nt!HalPrivateDispatchTable+0x318 (fffff802`75c008a8)]
fffff802`7551e194 33c9            xor     ecx,ecx
fffff802`7551e196 e84589ecff      call    nt!guard_dispatch_icall (fffff802`753e6ae0)
fffff802`7551e19b 44382d6e4c7000  cmp     byte ptr [nt!PoPowerDownActionInProgress (fffff802`75c22e10)],r13b
fffff802`7551e1a2 7409            je      nt!KeBugCheck2+0xdad (fffff802`7551e1ad)  Branch

nt!KeBugCheck2+0xda4:
fffff802`7551e1a4 44382d664c7000  cmp     byte ptr [nt!PoPowerResetActionInProgress (fffff802`75c22e11)],r13b
fffff802`7551e1ab 7411            je      nt!KeBugCheck2+0xdbe (fffff802`7551e1be)  Branch

nt!KeBugCheck2+0xdad:
fffff802`7551e1ad 44382d5e4c7000  cmp     byte ptr [nt!PoModernStandbyActionInProgress (fffff802`75c22e12)],r13b
fffff802`7551e1b4 7508            jne     nt!KeBugCheck2+0xdbe (fffff802`7551e1be)  Branch

nt!KeBugCheck2+0xdb6:
fffff802`7551e1b6 418bcc          mov     ecx,r12d
fffff802`7551e1b9 4584f6          test    r14b,r14b
fffff802`7551e1bc 7505            jne     nt!KeBugCheck2+0xdc3 (fffff802`7551e1c3)  Branch

nt!KeBugCheck2+0xdbe:
fffff802`7551e1be b901000000      mov     ecx,1

nt!KeBugCheck2+0xdc3:
fffff802`7551e1c3 e8c86dfaff      call    nt!HalReturnToFirmware (fffff802`754c4f90)

nt!KeBugCheck2+0xdc8:
fffff802`7551e1c8 b904000000      mov     ecx,4
fffff802`7551e1cd e87e050000      call    nt!KiBugCheckDebugBreak (fffff802`7551e750)
fffff802`7551e1d2 488b9c2420070000 mov     rbx,qword ptr [rsp+720h]
fffff802`7551e1da 4881c4d0060000  add     rsp,6D0h
fffff802`7551e1e1 415f            pop     r15
fffff802`7551e1e3 415e            pop     r14
fffff802`7551e1e5 415d            pop     r13
fffff802`7551e1e7 415c            pop     r12
fffff802`7551e1e9 5f              pop     rdi
fffff802`7551e1ea 5e              pop     rsi
fffff802`7551e1eb 5d              pop     rbp
fffff802`7551e1ec c3              ret

nt!KeBugCheck2+0xdee:
fffff802`7551e1ee 488b05e3236e00  mov     rax,qword ptr [nt!HalPrivateDispatchTable+0x48 (fffff802`75c005d8)]
fffff802`7551e1f5 e8e688ecff      call    nt!guard_dispatch_icall (fffff802`753e6ae0)
fffff802`7551e1fa ebf2            jmp     nt!KeBugCheck2+0xdee (fffff802`7551e1ee)  Branch
