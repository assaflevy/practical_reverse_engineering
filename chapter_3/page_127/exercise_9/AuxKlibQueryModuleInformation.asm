WDFLDR!AuxKlibQueryModuleInformation [minkernel\auxapilib\kmode\aux_klib.c @ 375]:
  375 fffff800`821ed590 48895c2410      mov     qword ptr [rsp+10h],rbx
  375 fffff800`821ed595 4889742420      mov     qword ptr [rsp+20h],rsi
  375 fffff800`821ed59a 57              push    rdi
  375 fffff800`821ed59b 4156            push    r14
  375 fffff800`821ed59d 4157            push    r15
  375 fffff800`821ed59f 4881ec70010000  sub     rsp,170h
  375 fffff800`821ed5a6 488b05a3caffff  mov     rax,qword ptr [WDFLDR!__security_cookie (fffff800`821ea050)]
  375 fffff800`821ed5ad 4833c4          xor     rax,rsp
  375 fffff800`821ed5b0 4889842460010000 mov     qword ptr [rsp+160h],rax
  375 fffff800`821ed5b8 498bd8          mov     rbx,r8
  375 fffff800`821ed5bb 488bf9          mov     rdi,rcx
  376 fffff800`821ed5be 33f6            xor     esi,esi
  376 fffff800`821ed5c0 89742420        mov     dword ptr [rsp+20h],esi
  378 fffff800`821ed5c4 41be30010000    mov     r14d,130h
  378 fffff800`821ed5ca 458bc6          mov     r8d,r14d
  378 fffff800`821ed5cd 33d2            xor     edx,edx
  378 fffff800`821ed5cf 488d4c2430      lea     rcx,[rsp+30h]
  378 fffff800`821ed5d4 e8e772ffff      call    WDFLDR!memset (fffff800`821e48c0)
  383 fffff800`821ed5d9 833d40cbffff01  cmp     dword ptr [WDFLDR!AuxpInitState (fffff800`821ea120)],1
  383 fffff800`821ed5e0 754a            jne     WDFLDR!AuxKlibQueryModuleInformation+0x9c (fffff800`821ed62c)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x52 [minkernel\auxapilib\kmode\aux_klib.c @ 387]:
  387 fffff800`821ed5e2 488b052fcbffff  mov     rax,qword ptr [WDFLDR!AuxpKlibFns (fffff800`821ea118)]
  387 fffff800`821ed5e9 4885c0          test    rax,rax
  387 fffff800`821ed5ec 0f847c040000    je      WDFLDR!AuxKlibQueryModuleInformation+0x4de (fffff800`821eda6e)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x62 [minkernel\auxapilib\kmode\aux_klib.c @ 388]:
  388 fffff800`821ed5f2 4c8bc3          mov     r8,rbx
  388 fffff800`821ed5f5 418d56e0        lea     edx,[r14-20h]
  388 fffff800`821ed5f9 488bcf          mov     rcx,rdi
  388 fffff800`821ed5fc ff153eebffff    call    qword ptr [WDFLDR!__guard_dispatch_icall_fptr (fffff800`821ec140)]

WDFLDR!AuxKlibQueryModuleInformation+0x72 [minkernel\auxapilib\kmode\aux_klib.c @ 537]:
  537 fffff800`821ed602 488b8c2460010000 mov     rcx,qword ptr [rsp+160h]
  537 fffff800`821ed60a 4833cc          xor     rcx,rsp
  537 fffff800`821ed60d e8ae64ffff      call    WDFLDR!__security_check_cookie (fffff800`821e3ac0)
  537 fffff800`821ed612 4c8d9c2470010000 lea     r11,[rsp+170h]
  537 fffff800`821ed61a 498b5b28        mov     rbx,qword ptr [r11+28h]
  537 fffff800`821ed61e 498b7338        mov     rsi,qword ptr [r11+38h]
  537 fffff800`821ed622 498be3          mov     rsp,r11
  537 fffff800`821ed625 415f            pop     r15
  537 fffff800`821ed627 415e            pop     r14
  537 fffff800`821ed629 5f              pop     rdi
  537 fffff800`821ed62a c3              ret

WDFLDR!AuxKlibQueryModuleInformation+0x9c [minkernel\auxapilib\kmode\aux_klib.c @ 384]:
  384 fffff800`821ed62c b8010000c0      mov     eax,0C0000001h
  384 fffff800`821ed631 ebcf            jmp     WDFLDR!AuxKlibQueryModuleInformation+0x72 (fffff800`821ed602)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x4de [minkernel\auxapilib\kmode\aux_klib.c @ 405]:
  405 fffff800`821eda6e 488bcb          mov     rcx,rbx
  405 fffff800`821eda71 83e107          and     ecx,7
  408 fffff800`821eda74 8bc1            mov     eax,ecx
  408 fffff800`821eda76 48f7d8          neg     rax
  408 fffff800`821eda79 1bc0            sbb     eax,eax
  408 fffff800`821eda7b 25f10000c0      and     eax,0C00000F1h
  415 fffff800`821eda80 4885c9          test    rcx,rcx
  415 fffff800`821eda83 0f8579fbffff    jne     WDFLDR!AuxKlibQueryModuleInformation+0x72 (fffff800`821ed602)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x4f9 [minkernel\auxapilib\kmode\aux_klib.c @ 423]:
  423 fffff800`821eda89 4c8d7c2430      lea     r15,[rsp+30h]

WDFLDR!AuxKlibQueryModuleInformation+0x4fe [minkernel\auxapilib\kmode\aux_klib.c @ 427]:
  427 fffff800`821eda8e 4c8d4c2420      lea     r9,[rsp+20h]
  427 fffff800`821eda93 458bc6          mov     r8d,r14d
  427 fffff800`821eda96 498bd7          mov     rdx,r15
  427 fffff800`821eda99 b90b000000      mov     ecx,0Bh
  427 fffff800`821eda9e 4c8b157be6ffff  mov     r10,qword ptr [WDFLDR!_imp_ZwQuerySystemInformation (fffff800`821ec120)]
  427 fffff800`821edaa5 e846d09efd      call    nt!ZwQuerySystemInformation (fffff800`7fbdaaf0)
  427 fffff800`821edaaa 448bf0          mov     r14d,eax
  430 fffff800`821edaad 85c0            test    eax,eax
  430 fffff800`821edaaf 0f88ef000000    js      WDFLDR!AuxKlibQueryModuleInformation+0x614 (fffff800`821edba4)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x525 [minkernel\auxapilib\kmode\aux_klib.c @ 468]:
  468 fffff800`821edab5 418b07          mov     eax,dword ptr [r15]
  468 fffff800`821edab8 4869c810010000  imul    rcx,rax,110h
  468 fffff800`821edabf baffffffff      mov     edx,0FFFFFFFFh
  468 fffff800`821edac4 483bca          cmp     rcx,rdx
  468 fffff800`821edac7 7629            jbe     WDFLDR!AuxKlibQueryModuleInformation+0x562 (fffff800`821edaf2)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x539 [minkernel\auxapilib\kmode\aux_klib.c @ 469]:
  469 fffff800`821edac9 41be950000c0    mov     r14d,0C0000095h

WDFLDR!AuxKlibQueryModuleInformation+0x53f [minkernel\auxapilib\kmode\aux_klib.c @ 531]:
  531 fffff800`821edacf 488d442430      lea     rax,[rsp+30h]
  531 fffff800`821edad4 4c3bf8          cmp     r15,rax
  531 fffff800`821edad7 7411            je      WDFLDR!AuxKlibQueryModuleInformation+0x55a (fffff800`821edaea)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x549 [minkernel\auxapilib\kmode\aux_klib.c @ 533]:
  533 fffff800`821edad9 33d2            xor     edx,edx
  533 fffff800`821edadb 498bcf          mov     rcx,r15
  533 fffff800`821edade 4c8b159be5ffff  mov     r10,qword ptr [WDFLDR!_imp_ExFreePoolWithTag (fffff800`821ec080)]
  533 fffff800`821edae5 e82645fdfd      call    nt!ExFreePool (fffff800`801c2010)

WDFLDR!AuxKlibQueryModuleInformation+0x55a [minkernel\auxapilib\kmode\aux_klib.c @ 536]:
  536 fffff800`821edaea 418bc6          mov     eax,r14d
  536 fffff800`821edaed e910fbffff      jmp     WDFLDR!AuxKlibQueryModuleInformation+0x72 (fffff800`821ed602)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x562 [minkernel\auxapilib\kmode\aux_klib.c @ 474]:
  474 fffff800`821edaf2 4469c010010000  imul    r8d,eax,110h
  477 fffff800`821edaf9 4885db          test    rbx,rbx
  477 fffff800`821edafc 740b            je      WDFLDR!AuxKlibQueryModuleInformation+0x579 (fffff800`821edb09)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x56e [minkernel\auxapilib\kmode\aux_klib.c @ 481]:
  481 fffff800`821edafe 443907          cmp     dword ptr [rdi],r8d
  481 fffff800`821edb01 730b            jae     WDFLDR!AuxKlibQueryModuleInformation+0x57e (fffff800`821edb0e)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x573 [minkernel\auxapilib\kmode\aux_klib.c @ 482]:
  482 fffff800`821edb03 41be230000c0    mov     r14d,0C0000023h

WDFLDR!AuxKlibQueryModuleInformation+0x579 [minkernel\auxapilib\kmode\aux_klib.c @ 527]:
  527 fffff800`821edb09 448907          mov     dword ptr [rdi],r8d
  527 fffff800`821edb0c ebc1            jmp     WDFLDR!AuxKlibQueryModuleInformation+0x53f (fffff800`821edacf)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x57e [minkernel\auxapilib\kmode\aux_klib.c @ 491]:
  491 fffff800`821edb0e 413b37          cmp     esi,dword ptr [r15]
  491 fffff800`821edb11 73f6            jae     WDFLDR!AuxKlibQueryModuleInformation+0x579 (fffff800`821edb09)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x583 [minkernel\auxapilib\kmode\aux_klib.c @ 505]:
  505 fffff800`821edb13 8bc6            mov     eax,esi
  505 fffff800`821edb15 4869d010010000  imul    rdx,rax,110h
  505 fffff800`821edb1c 4803d3          add     rdx,rbx
  507 fffff800`821edb1f 4869c828010000  imul    rcx,rax,128h
  507 fffff800`821edb26 4903cf          add     rcx,r15
  507 fffff800`821edb29 488b4118        mov     rax,qword ptr [rcx+18h]
  507 fffff800`821edb2d 488902          mov     qword ptr [rdx],rax
  509 fffff800`821edb30 8b4120          mov     eax,dword ptr [rcx+20h]
  509 fffff800`821edb33 894208          mov     dword ptr [rdx+8],eax
  510 fffff800`821edb36 0fb7412e        movzx   eax,word ptr [rcx+2Eh]
  510 fffff800`821edb3a 6689420c        mov     word ptr [rdx+0Ch],ax
  511 fffff800`821edb3e 4883c20e        add     rdx,0Eh
  511 fffff800`821edb42 4883c130        add     rcx,30h
  511 fffff800`821edb46 b802000000      mov     eax,2

WDFLDR!AuxKlibQueryModuleInformation+0x5bb [minkernel\auxapilib\kmode\aux_klib.c @ 511]:
  511 fffff800`821edb4b 0f1001          movups  xmm0,xmmword ptr [rcx]
  511 fffff800`821edb4e 0f1102          movups  xmmword ptr [rdx],xmm0
  511 fffff800`821edb51 0f104910        movups  xmm1,xmmword ptr [rcx+10h]
  511 fffff800`821edb55 0f114a10        movups  xmmword ptr [rdx+10h],xmm1
  511 fffff800`821edb59 0f104120        movups  xmm0,xmmword ptr [rcx+20h]
  511 fffff800`821edb5d 0f114220        movups  xmmword ptr [rdx+20h],xmm0
  511 fffff800`821edb61 0f104930        movups  xmm1,xmmword ptr [rcx+30h]
  511 fffff800`821edb65 0f114a30        movups  xmmword ptr [rdx+30h],xmm1
  511 fffff800`821edb69 0f104140        movups  xmm0,xmmword ptr [rcx+40h]
  511 fffff800`821edb6d 0f114240        movups  xmmword ptr [rdx+40h],xmm0
  511 fffff800`821edb71 0f104950        movups  xmm1,xmmword ptr [rcx+50h]
  511 fffff800`821edb75 0f114a50        movups  xmmword ptr [rdx+50h],xmm1
  511 fffff800`821edb79 0f104160        movups  xmm0,xmmword ptr [rcx+60h]
  511 fffff800`821edb7d 0f114260        movups  xmmword ptr [rdx+60h],xmm0
  511 fffff800`821edb81 488d9280000000  lea     rdx,[rdx+80h]
  511 fffff800`821edb88 0f104970        movups  xmm1,xmmword ptr [rcx+70h]
  511 fffff800`821edb8c 0f114af0        movups  xmmword ptr [rdx-10h],xmm1
  511 fffff800`821edb90 488d8980000000  lea     rcx,[rcx+80h]
  511 fffff800`821edb97 4883e801        sub     rax,1
  511 fffff800`821edb9b 75ae            jne     WDFLDR!AuxKlibQueryModuleInformation+0x5bb (fffff800`821edb4b)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x60d [minkernel\auxapilib\kmode\aux_klib.c @ 491]:
  491 fffff800`821edb9d ffc6            inc     esi
  491 fffff800`821edb9f e96affffff      jmp     WDFLDR!AuxKlibQueryModuleInformation+0x57e (fffff800`821edb0e)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x614 [minkernel\auxapilib\kmode\aux_klib.c @ 432]:
  432 fffff800`821edba4 3d040000c0      cmp     eax,0C0000004h
  432 fffff800`821edba9 0f8520ffffff    jne     WDFLDR!AuxKlibQueryModuleInformation+0x53f (fffff800`821edacf)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x61f [minkernel\auxapilib\kmode\aux_klib.c @ 438]:
  438 fffff800`821edbaf 488d442430      lea     rax,[rsp+30h]
  438 fffff800`821edbb4 4c3bf8          cmp     r15,rax
  438 fffff800`821edbb7 7412            je      WDFLDR!AuxKlibQueryModuleInformation+0x63b (fffff800`821edbcb)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x629 [minkernel\auxapilib\kmode\aux_klib.c @ 439]:
  439 fffff800`821edbb9 33d2            xor     edx,edx
  439 fffff800`821edbbb 498bcf          mov     rcx,r15
  439 fffff800`821edbbe 4c8b15bbe4ffff  mov     r10,qword ptr [WDFLDR!_imp_ExFreePoolWithTag (fffff800`821ec080)]
  439 fffff800`821edbc5 e84644fdfd      call    nt!ExFreePool (fffff800`801c2010)
  439 fffff800`821edbca 90              nop

WDFLDR!AuxKlibQueryModuleInformation+0x63b [minkernel\auxapilib\kmode\aux_klib.c @ 448]:
  448 fffff800`821edbcb 8b542420        mov     edx,dword ptr [rsp+20h]
  448 fffff800`821edbcf b901000000      mov     ecx,1
  448 fffff800`821edbd4 41b84175784b    mov     r8d,4B787541h
  448 fffff800`821edbda 4c8b1547e5ffff  mov     r10,qword ptr [WDFLDR!_imp_ExAllocatePoolWithQuotaTag (fffff800`821ec128)]
  448 fffff800`821edbe1 e88a2c84fd      call    nt!ExAllocatePoolWithQuotaTag (fffff800`7fa30870)
  448 fffff800`821edbe6 4c8bf8          mov     r15,rax
  448 fffff800`821edbe9 4889442428      mov     qword ptr [rsp+28h],rax
  449 fffff800`821edbee eb05            jmp     WDFLDR!AuxKlibQueryModuleInformation+0x665 (fffff800`821edbf5)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x665 [minkernel\auxapilib\kmode\aux_klib.c @ 456]:
  456 fffff800`821edbf5 4885c0          test    rax,rax
  456 fffff800`821edbf8 750a            jne     WDFLDR!AuxKlibQueryModuleInformation+0x674 (fffff800`821edc04)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x66a [minkernel\auxapilib\kmode\aux_klib.c @ 457]:
  457 fffff800`821edbfa b89a0000c0      mov     eax,0C000009Ah
  457 fffff800`821edbff e9fef9ffff      jmp     WDFLDR!AuxKlibQueryModuleInformation+0x72 (fffff800`821ed602)  Branch

WDFLDR!AuxKlibQueryModuleInformation+0x674 [minkernel\auxapilib\kmode\aux_klib.c @ 460]:
  460 fffff800`821edc04 448b742420      mov     r14d,dword ptr [rsp+20h]
  461 fffff800`821edc09 e980feffff      jmp     WDFLDR!AuxKlibQueryModuleInformation+0x4fe (fffff800`821eda8e)  Branch
