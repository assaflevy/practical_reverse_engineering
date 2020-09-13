Requires revisitation

```
0: kd> uf KiExecuteAllDpcs
nt!KiExecuteAllDpcs:
fffff806`3d03a3b0 4055            push    rbp
fffff806`3d03a3b2 53              push    rbx
fffff806`3d03a3b3 56              push    rsi
fffff806`3d03a3b4 57              push    rdi
fffff806`3d03a3b5 4155            push    r13
fffff806`3d03a3b7 488d6c24c0      lea     rbp,[rsp-40h]
fffff806`3d03a3bc 4881ec40010000  sub     rsp,140h
fffff806`3d03a3c3 488b05667e9d00  mov     rax,qword ptr [nt!_security_cookie (fffff806`3da12230)]
fffff806`3d03a3ca 4833c4          xor     rax,rsp
fffff806`3d03a3cd 48894510        mov     qword ptr [rbp+10h],rax ; security cookie not in [rbp+130h] as usual
fffff806`3d03a3d1 33f6            xor     esi,esi
fffff806`3d03a3d3 458be9          mov     r13d,r9d ; r13 = 1 if called from KiExecuteDpc()
fffff806`3d03a3d6 0f57c9          xorps   xmm1,xmm1
fffff806`3d03a3d9 48895580        mov     qword ptr [rbp-80h],rdx ; [rbp-80h] = _KTHREAD
fffff806`3d03a3dd 0f57c0          xorps   xmm0,xmm0
fffff806`3d03a3e0 4c89442430      mov     qword ptr [rsp+30h],r8 ; [rsp+30h] = MaybeNumDpcsExecuted
fffff806`3d03a3e5 4d8bd8          mov     r11,r8
fffff806`3d03a3e8 4889742448      mov     qword ptr [rsp+48h],rsi ; [rsp+48h] = 0
fffff806`3d03a3ed 498d8538010000  lea     rax,[r13+138h] ; rax = 138h+1 = 139h
fffff806`3d03a3f4 4889742460      mov     qword ptr [rsp+60h],rsi ; [rsp+60h] = 0
fffff806`3d03a3f9 488d0480        lea     rax,[rax+rax*4] ; rax = 139h*5 = 61Dh
fffff806`3d03a3fd 418bd1          mov     edx,r9d = ; rdx = edx = 1
fffff806`3d03a400 488d1cc1        lea     rbx,[rcx+rax*8] ; rbx = Prcb+61Dh*8 = Prcb+30E8h = & Prcb.DpcData[1]
fffff806`3d03a404 488bf9          mov     rdi,rcx ; rdi = Prcb
fffff806`3d03a407 8b4318          mov     eax,dword ptr [rbx+18h] ; eax = Prcb.DpcData[1].DpcQueueDepth
fffff806`3d03a40a 0f1145a8        movups  xmmword ptr [rbp-58h],xmm0
fffff806`3d03a40e 0f114dc0        movups  xmmword ptr [rbp-40h],xmm1
fffff806`3d03a412 0f114dd0        movups  xmmword ptr [rbp-30h],xmm1
fffff806`3d03a416 85c0            test    eax,eax ; Simply return if DpcQueueDepth == 0
fffff806`3d03a418 0f84e6030000    je      nt!KiExecuteAllDpcs+0x454 (fffff806`3d03a804)  Branch

nt!KiExecuteAllDpcs+0x6e:
fffff806`3d03a41e 8b056010ac00    mov     eax,dword ptr [nt!PerfGlobalGroupMask+0x4 (fffff806`3dafb484)] ; eax = PerfGlobalGroupMask
fffff806`3d03a424 4c89a42438010000 mov     qword ptr [rsp+138h],r12
fffff806`3d03a42c 4c89b42430010000 mov     qword ptr [rsp+130h],r14
fffff806`3d03a434 4c89bc2428010000 mov     qword ptr [rsp+128h],r15
fffff806`3d03a43c 84c0            test    al,al
fffff806`3d03a43e 0f89ea030000    jns     nt!KiExecuteAllDpcs+0x47e (fffff806`3d03a82e)  Branch

nt!KiExecuteAllDpcs+0x94: ; eax = 0F44h, [rsp+64h] = 400A02h if r9 == 0
                          ; eax = 0F42h, [rsp+64h] = 401802h else
fffff806`3d03a444 4585c9          test    r9d,r9d ; Param 4 flag
fffff806`3d03a447 0f85eb030000    jne     nt!KiExecuteAllDpcs+0x488 (fffff806`3d03a838)  Branch ; set eax, rsp+64h as above and continue at +0xaa

nt!KiExecuteAllDpcs+0x9d:
fffff806`3d03a44d b8440f0000      mov     eax,0F44h
fffff806`3d03a452 c7442464020a4000 mov     dword ptr [rsp+64h],400A02h

nt!KiExecuteAllDpcs+0xaa:
fffff806`3d03a45a 6689442460      mov     word ptr [rsp+60h],ax ; [rsp+60h] = eax
fffff806`3d03a45f 488d442460      lea     rax,[rsp+60h] ; rax = rsp+60h
fffff806`3d03a464 4889442470      mov     qword ptr [rsp+70h],rax ; [rsp+70] = rsp+60h

nt!KiExecuteAllDpcs+0xb9:
fffff806`3d03a469 488b81902d0000  mov     rax,qword ptr [rcx+2D90h] ; Prcb.IsrDpcStats
fffff806`3d03a470 488945a0        mov     qword ptr [rbp-60h],rax ; [rbp-60h] = Prcb.IsrDpcStats

nt!KiExecuteAllDpcs+0xc4:
fffff806`3d03a474 f6050b10ac0021  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff806`3dafb486)],21h
fffff806`3d03a47b 4c8d6310        lea     r12,[rbx+10h] ; r12 = & Prcb.DpcData[1].DpcLock
fffff806`3d03a47f 41b8edffffff    mov     r8d,0FFFFFFEDh
fffff806`3d03a485 0f85e9b11d00    jne     nt!KiExecuteAllDpcs+0x1db2c4 (fffff806`3d215674)  Branch

nt!KiExecuteAllDpcs+0xdb:
fffff806`3d03a48b 65488b342520000000 mov   rsi,qword ptr gs:[20h] ; rsi = CurrPrcb
fffff806`3d03a494 488b8eb8840000  mov     rcx,qword ptr [rsi+84B8h] ; rcx = SchedulerAssist
fffff806`3d03a49b 4885c9          test    rcx,rcx
fffff806`3d03a49e 0f85ebb11d00    jne     nt!KiExecuteAllDpcs+0x1db2df (fffff806`3d21568f)  Branch ; SchedulerAssist != 0

nt!KiExecuteAllDpcs+0xf4:
fffff806`3d03a4a4 f0490fba2c2400  lock bts qword ptr [r12],0 ; Set DpcLock
fffff806`3d03a4ab 0f82a3030000    jb      nt!KiExecuteAllDpcs+0x4a4 (fffff806`3d03a854)  Branch ; spin on dpclock if was already locked

nt!KiExecuteAllDpcs+0x101:
fffff806`3d03a4b1 33f6            xor     esi,esi ; esi = 0

nt!KiExecuteAllDpcs+0x103:
fffff806`3d03a4b3 8b4318          mov     eax,dword ptr [rbx+18h] ; DpcQueueDepth
fffff806`3d03a4b6 83f801          cmp     eax,1
fffff806`3d03a4b9 7f15            jg      nt!KiExecuteAllDpcs+0x120 (fffff806`3d03a4d0)  Branch ; jump if DpcQueueDepth > 1

nt!KiExecuteAllDpcs+0x10b:
fffff806`3d03a4bb 66f0442184572c310000 lock and word ptr [rdi+rdx*2+312Ch],r8w ; Turn off bits in pos 1,4 (DpcNormalProcessingRequested, DpcNormalDpcPresent) in
										; Prcb.NormalDpcState/ThreadDpcState (depending if R9 is 0 or 1).
										; KiExecuteDpc() calls with 1, therefore KiExecuteDpc() handles threaded dpcs.
										; Now we know why there are two _KDPC_DATA structures in _KPRCB, and that the second one is for threaded dpcs.
fffff806`3d03a4c5 8b4318          mov     eax,dword ptr [rbx+18h]
fffff806`3d03a4c8 85c0            test    eax,eax ; DpcQueueDepth == 0 ? Jump to unwind stack & return
fffff806`3d03a4ca 0f84f7b41d00    je      nt!KiExecuteAllDpcs+0x1db617 (fffff806`3d2159c7)  Branch

nt!KiExecuteAllDpcs+0x120: ; arrive here if DpcQueueDepth >= 1
fffff806`3d03a4d0 4c8b33          mov     r14,qword ptr [rbx] ; r14 = ListHead.Next
fffff806`3d03a4d3 498b06          mov     rax,qword ptr [r14] ; rax = ListHead.Next.Next
fffff806`3d03a4d6 488903          mov     qword ptr [rbx],rax ; ListHead.Next = ListHead.Next.Next
fffff806`3d03a4d9 4885c0          test    rax,rax
fffff806`3d03a4dc 7504            jne     nt!KiExecuteAllDpcs+0x132 (fffff806`3d03a4e2)  Branch ; is Next non-null?

nt!KiExecuteAllDpcs+0x12e:
fffff806`3d03a4de 48895b08        mov     qword ptr [rbx+8],rbx ; LastEntry = ListHead

nt!KiExecuteAllDpcs+0x132:
fffff806`3d03a4e2 498b4610        mov     rax,qword ptr [r14+10h] ; rax = DpcLock
fffff806`3d03a4e6 4983c6f8        add     r14,0FFFFFFFFFFFFFFF8h ; funny way to subtract 8? now r14 = _KDPC
fffff806`3d03a4ea 4889442448      mov     qword ptr [rsp+48h],rax ; 
fffff806`3d03a4ef 4d8b7e38        mov     r15,qword ptr [r14+38h] ; r15 = DpcData
fffff806`3d03a4f3 4d8b5620        mov     r10,qword ptr [r14+20h] ; r10 = Deferred Context
fffff806`3d03a4f7 4d8b4628        mov     r8,qword ptr [r14+28h] ; r8 = SysArg1
fffff806`3d03a4fb 4d8b4e30        mov     r9,qword ptr [r14+30h] ; r9 = SysArg2
fffff806`3d03a4ff 49897638        mov     qword ptr [r14+38h],rsi ; DpcData = CurrPrcp
fffff806`3d03a503 8b4318          mov     eax,dword ptr [rbx+18h] ; eax = DpcQueueDepth
fffff806`3d03a506 ffc8            dec     eax
fffff806`3d03a508 4c89542438      mov     qword ptr [rsp+38h],r10 ; [rsp+38h] = Deferred Context
fffff806`3d03a50d 894318          mov     dword ptr [rbx+18h],eax ; DpcQueueDepth--
fffff806`3d03a510 4c897320        mov     qword ptr [rbx+20h],r14 ; ActiveDpc = _KDPC
fffff806`3d03a514 488b8fb8840000  mov     rcx,qword ptr [rdi+84B8h] ; SchedulerAssist
fffff806`3d03a51b 4c89442450      mov     qword ptr [rsp+50h],r8 ; [rsp+50h] = SysArg1
fffff806`3d03a520 4c894c2440      mov     qword ptr [rsp+40h],r9; [rsp+40h] = SysArg2
fffff806`3d03a525 4885c9          test    rcx,rcx
fffff806`3d03a528 0f85bcb11d00    jne     nt!KiExecuteAllDpcs+0x1db33a (fffff806`3d2156ea)  Branch

nt!KiExecuteAllDpcs+0x17e:
fffff806`3d03a52e f605510fac0001  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff806`3dafb486)],1
fffff806`3d03a535 0f85c5b11d00    jne     nt!KiExecuteAllDpcs+0x1db350 (fffff806`3d215700)  Branch

nt!KiExecuteAllDpcs+0x18b:
fffff806`3d03a53b f04983242400    lock and qword ptr [r12],0 ; Clear DpcLock. At this point we've pulled the DPC out of the list

nt!KiExecuteAllDpcs+0x191:
fffff806`3d03a541 65488b0c2520000000 mov   rcx,qword ptr gs:[20h] ; rcx = CurrPrcb
fffff806`3d03a54a 488b91b8840000  mov     rdx,qword ptr [rcx+84B8h] ; SchedulerAssist
fffff806`3d03a551 4885d2          test    rdx,rdx
fffff806`3d03a554 0f85cbb11d00    jne     nt!KiExecuteAllDpcs+0x1db375 (fffff806`3d215725)  Branch

nt!KiExecuteAllDpcs+0x1aa:
fffff806`3d03a55a fb              sti ; Set interrupt flag - other interrupts are enabled
fffff806`3d03a55b f7051f0fac0000000400 test dword ptr [nt!PerfGlobalGroupMask+0x4 (fffff806`3dafb484)],40000h
fffff806`3d03a565 0f85f1b11d00    jne     nt!KiExecuteAllDpcs+0x1db3ac (fffff806`3d21575c)  Branch

nt!KiExecuteAllDpcs+0x1bb:
fffff806`3d03a56b 48837c247000    cmp     qword ptr [rsp+70h],0
fffff806`3d03a571 0f84b2000000    je      nt!KiExecuteAllDpcs+0x279 (fffff806`3d03a629)  Branch

nt!KiExecuteAllDpcs+0x1c7:
fffff806`3d03a577 4c8b052293ae00  mov     r8,qword ptr [nt!PspHostSiloGlobals+0x360 (fffff806`3db238a0)]
fffff806`3d03a57e 89742458        mov     dword ptr [rsp+58h],esi
fffff806`3d03a582 4d85c0          test    r8,r8
fffff806`3d03a585 0f84bf020000    je      nt!KiExecuteAllDpcs+0x49a (fffff806`3d03a84a)  Branch

nt!KiExecuteAllDpcs+0x1db:
fffff806`3d03a58b 418b9080100000  mov     edx,dword ptr [r8+1080h]
fffff806`3d03a592 0fbcca          bsf     ecx,edx
fffff806`3d03a595 894c2458        mov     dword ptr [rsp+58h],ecx
fffff806`3d03a599 7444            je      nt!KiExecuteAllDpcs+0x22f (fffff806`3d03a5df)  Branch

nt!KiExecuteAllDpcs+0x1eb:
fffff806`3d03a59b 8d42ff          lea     eax,[rdx-1]
fffff806`3d03a59e 23d0            and     edx,eax
fffff806`3d03a5a0 4d8d88a4100000  lea     r9,[r8+10A4h]
fffff806`3d03a5a7 8bc1            mov     eax,ecx
fffff806`3d03a5a9 48c1e005        shl     rax,5
fffff806`3d03a5ad 4c03c8          add     r9,rax
fffff806`3d03a5b0 741a            je      nt!KiExecuteAllDpcs+0x21c (fffff806`3d03a5cc)  Branch

nt!KiExecuteAllDpcs+0x202:
fffff806`3d03a5b2 418b4104        mov     eax,dword ptr [r9+4]
fffff806`3d03a5b6 84c0            test    al,al
fffff806`3d03a5b8 7912            jns     nt!KiExecuteAllDpcs+0x21c (fffff806`3d03a5cc)  Branch

nt!KiExecuteAllDpcs+0x20a:
fffff806`3d03a5ba 410fb68c4871100000 movzx ecx,byte ptr [r8+rcx*2+1071h]
fffff806`3d03a5c3 b801000000      mov     eax,1
fffff806`3d03a5c8 d3e0            shl     eax,cl
fffff806`3d03a5ca 0bf0            or      esi,eax

nt!KiExecuteAllDpcs+0x21c:
fffff806`3d03a5cc 0fbcca          bsf     ecx,edx
fffff806`3d03a5cf 75ca            jne     nt!KiExecuteAllDpcs+0x1eb (fffff806`3d03a59b)  Branch

nt!KiExecuteAllDpcs+0x221:
fffff806`3d03a5d1 4c8b542438      mov     r10,qword ptr [rsp+38h]
fffff806`3d03a5d6 4c8b4c2440      mov     r9,qword ptr [rsp+40h]
fffff806`3d03a5db 894c2458        mov     dword ptr [rsp+58h],ecx

nt!KiExecuteAllDpcs+0x22f:
fffff806`3d03a5df 40f6c602        test    sil,2
fffff806`3d03a5e3 0f85f8b11d00    jne     nt!KiExecuteAllDpcs+0x1db431 (fffff806`3d2157e1)  Branch

nt!KiExecuteAllDpcs+0x239:
fffff806`3d03a5e9 33c0            xor     eax,eax
fffff806`3d03a5eb 488945c0        mov     qword ptr [rbp-40h],rax

nt!KiExecuteAllDpcs+0x23f:
fffff806`3d03a5ef 40f6c604        test    sil,4
fffff806`3d03a5f3 0f8509b21d00    jne     nt!KiExecuteAllDpcs+0x1db452 (fffff806`3d215802)  Branch

nt!KiExecuteAllDpcs+0x249:
fffff806`3d03a5f9 488945c8        mov     qword ptr [rbp-38h],rax

nt!KiExecuteAllDpcs+0x24d:
fffff806`3d03a5fd 40f6c608        test    sil,8
fffff806`3d03a601 0f841ab21d00    je      nt!KiExecuteAllDpcs+0x1db471 (fffff806`3d215821)  Branch

nt!KiExecuteAllDpcs+0x257:
fffff806`3d03a607 0f31            rdtsc
fffff806`3d03a609 48c1e220        shl     rdx,20h
fffff806`3d03a60d 480bc2          or      rax,rdx
fffff806`3d03a610 488945d0        mov     qword ptr [rbp-30h],rax
fffff806`3d03a614 33c0            xor     eax,eax

nt!KiExecuteAllDpcs+0x266:
fffff806`3d03a616 40f6c610        test    sil,10h
fffff806`3d03a61a 0f850ab21d00    jne     nt!KiExecuteAllDpcs+0x1db47a (fffff806`3d21582a)  Branch

nt!KiExecuteAllDpcs+0x270:
fffff806`3d03a620 4c8b442450      mov     r8,qword ptr [rsp+50h]
fffff806`3d03a625 488945d8        mov     qword ptr [rbp-28h],rax

nt!KiExecuteAllDpcs+0x279:
fffff806`3d03a629 418b03          mov     eax,dword ptr [r11]
fffff806`3d03a62c 8bf0            mov     esi,eax
fffff806`3d03a62e 83e60f          and     esi,0Fh
fffff806`3d03a631 ffc0            inc     eax
fffff806`3d03a633 48ffc6          inc     rsi
fffff806`3d03a636 418903          mov     dword ptr [r11],eax
fffff806`3d03a639 488b442448      mov     rax,qword ptr [rsp+48h]
fffff806`3d03a63e 48c1e604        shl     rsi,4
fffff806`3d03a642 4903f3          add     rsi,r11
fffff806`3d03a645 488906          mov     qword ptr [rsi],rax
fffff806`3d03a648 a12003000080f7ffff mov   eax,dword ptr [FFFFF78000000320h]
fffff806`3d03a651 894608          mov     dword ptr [rsi+8],eax
fffff806`3d03a654 488b4580        mov     rax,qword ptr [rbp-80h]
fffff806`3d03a658 488b8fa8840000  mov     rcx,qword ptr [rdi+84A8h]
fffff806`3d03a65f 8b80e4010000    mov     eax,dword ptr [rax+1E4h]
fffff806`3d03a665 89442468        mov     dword ptr [rsp+68h],eax
fffff806`3d03a669 c7879c7e000000000000 mov dword ptr [rdi+7E9Ch],0
fffff806`3d03a673 4885c9          test    rcx,rcx
fffff806`3d03a676 740d            je      nt!KiExecuteAllDpcs+0x2d5 (fffff806`3d03a685)  Branch

nt!KiExecuteAllDpcs+0x2c8:
fffff806`3d03a678 48398fb0840000  cmp     qword ptr [rdi+84B0h],rcx
fffff806`3d03a67f 0f85d4b11d00    jne     nt!KiExecuteAllDpcs+0x1db4a9 (fffff806`3d215859)  Branch

nt!KiExecuteAllDpcs+0x2d5:
fffff806`3d03a685 0f31            rdtsc
fffff806`3d03a687 48c1e220        shl     rdx,20h
fffff806`3d03a68b 480bc2          or      rax,rdx
fffff806`3d03a68e 4c89bf902d0000  mov     qword ptr [rdi+2D90h],r15 ; Prcb.IsrDpcStats
fffff806`3d03a695 4c8be0          mov     r12,rax
fffff806`3d03a698 4983ff01        cmp     r15,1
fffff806`3d03a69c 7404            je      nt!KiExecuteAllDpcs+0x2f2 (fffff806`3d03a6a2)  Branch

nt!KiExecuteAllDpcs+0x2ee:
fffff806`3d03a69e 49894720        mov     qword ptr [r15+20h],rax

nt!KiExecuteAllDpcs+0x2f2:
fffff806`3d03a6a2 4585ed          test    r13d,r13d
fffff806`3d03a6a5 7507            jne     nt!KiExecuteAllDpcs+0x2fe (fffff806`3d03a6ae)  Branch

nt!KiExecuteAllDpcs+0x2f7:
fffff806`3d03a6a7 c6872a31000001  mov     byte ptr [rdi+312Ah],1 ; DpcRoutineActive = 1

nt!KiExecuteAllDpcs+0x2fe:
fffff806`3d03a6ae 488b442448      mov     rax,qword ptr [rsp+48h]
fffff806`3d03a6b3 498bd2          mov     rdx,r10
fffff806`3d03a6b6 498bce          mov     rcx,r14
fffff806`3d03a6b9 e822c41a00      call    nt!guard_dispatch_icall (fffff806`3d1e6ae0)
fffff806`3d03a6be 0f31            rdtsc
fffff806`3d03a6c0 48c1e220        shl     rdx,20h
fffff806`3d03a6c4 480bc2          or      rax,rdx
fffff806`3d03a6c7 4c8bf0          mov     r14,rax
fffff806`3d03a6ca 4585ed          test    r13d,r13d
fffff806`3d03a6cd 751d            jne     nt!KiExecuteAllDpcs+0x33c (fffff806`3d03a6ec)  Branch

nt!KiExecuteAllDpcs+0x31f:
fffff806`3d03a6cf 4c8bc8          mov     r9,rax
fffff806`3d03a6d2 4488af2a310000  mov     byte ptr [rdi+312Ah],r13b ; DpcRoutineActive = 0 (r13 must be 0)
fffff806`3d03a6d9 4c8b9790300000  mov     r10,qword ptr [rdi+3090h] ; DpcRuntimeHistoryHashTable
fffff806`3d03a6e0 4d2bcc          sub     r9,r12
fffff806`3d03a6e3 4d85d2          test    r10,r10
fffff806`3d03a6e6 0f85acb11d00    jne     nt!KiExecuteAllDpcs+0x1db4e8 (fffff806`3d215898)  Branch

nt!KiExecuteAllDpcs+0x33c:
fffff806`3d03a6ec 4983ff01        cmp     r15,1
fffff806`3d03a6f0 7414            je      nt!KiExecuteAllDpcs+0x356 (fffff806`3d03a706)  Branch

nt!KiExecuteAllDpcs+0x342:
fffff806`3d03a6f2 4d2b7720        sub     r14,qword ptr [r15+20h]
fffff806`3d03a6f6 4d017718        add     qword ptr [r15+18h],r14
fffff806`3d03a6fa 4d017750        add     qword ptr [r15+50h],r14
fffff806`3d03a6fe 49ff4728        inc     qword ptr [r15+28h]
fffff806`3d03a702 49ff4758        inc     qword ptr [r15+58h]

nt!KiExecuteAllDpcs+0x356:
fffff806`3d03a706 a12003000080f7ffff mov   eax,dword ptr [FFFFF78000000320h]
fffff806`3d03a70f 8b4c2468        mov     ecx,dword ptr [rsp+68h]
fffff806`3d03a713 89460c          mov     dword ptr [rsi+0Ch],eax
fffff806`3d03a716 488b4580        mov     rax,qword ptr [rbp-80h]
fffff806`3d03a71a 8b80e4010000    mov     eax,dword ptr [rax+1E4h]
fffff806`3d03a720 3bc8            cmp     ecx,eax
fffff806`3d03a722 0f85adb21d00    jne     nt!KiExecuteAllDpcs+0x1db625 (fffff806`3d2159d5)  Branch ; BugCheck

nt!KiExecuteAllDpcs+0x378:
fffff806`3d03a728 488b4c2470      mov     rcx,qword ptr [rsp+70h]
fffff806`3d03a72d 4885c9          test    rcx,rcx
fffff806`3d03a730 0f84a3000000    je      nt!KiExecuteAllDpcs+0x429 (fffff806`3d03a7d9)  Branch

nt!KiExecuteAllDpcs+0x386:
fffff806`3d03a736 448b7104        mov     r14d,dword ptr [rcx+4]
fffff806`3d03a73a 488d442448      lea     rax,[rsp+48h]
fffff806`3d03a73f 440fb739        movzx   r15d,word ptr [rcx]
fffff806`3d03a743 4533c9          xor     r9d,r9d
fffff806`3d03a746 48894500        mov     qword ptr [rbp],rax
fffff806`3d03a74a 488b05b7f8ab00  mov     rax,qword ptr [nt!EtwpHostSiloState (fffff806`3dafa008)]
fffff806`3d03a751 48c7450808000000 mov     qword ptr [rbp+8],8
fffff806`3d03a759 8bb080100000    mov     esi,dword ptr [rax+1080h]
fffff806`3d03a75f 0fbcce          bsf     ecx,esi
fffff806`3d03a762 894c245c        mov     dword ptr [rsp+5Ch],ecx
fffff806`3d03a766 7471            je      nt!KiExecuteAllDpcs+0x429 (fffff806`3d03a7d9)  Branch

nt!KiExecuteAllDpcs+0x3b8:
fffff806`3d03a768 488b1599f8ab00  mov     rdx,qword ptr [nt!EtwpHostSiloState (fffff806`3dafa008)]
fffff806`3d03a76f 8d46ff          lea     eax,[rsi-1]
fffff806`3d03a772 23f0            and     esi,eax
fffff806`3d03a774 448bc1          mov     r8d,ecx
fffff806`3d03a777 8bc1            mov     eax,ecx
fffff806`3d03a779 48c1e005        shl     rax,5
fffff806`3d03a77d 488d8aa4100000  lea     rcx,[rdx+10A4h]
fffff806`3d03a784 4803c8          add     rcx,rax
fffff806`3d03a787 7447            je      nt!KiExecuteAllDpcs+0x420 (fffff806`3d03a7d0)  Branch

nt!KiExecuteAllDpcs+0x3d9:
fffff806`3d03a789 8b4104          mov     eax,dword ptr [rcx+4]
fffff806`3d03a78c 84c0            test    al,al
fffff806`3d03a78e 7940            jns     nt!KiExecuteAllDpcs+0x420 (fffff806`3d03a7d0)  Branch

nt!KiExecuteAllDpcs+0x3e0:
fffff806`3d03a790 420fb6844271100000 movzx eax,byte ptr [rdx+r8*2+1071h]
fffff806`3d03a799 41b902000000    mov     r9d,2
fffff806`3d03a79f 460fb6844270100000 movzx r8d,byte ptr [rdx+r8*2+1070h]
fffff806`3d03a7a8 4489742428      mov     dword ptr [rsp+28h],r14d
fffff806`3d03a7ad 48c745f808000000 mov     qword ptr [rbp-8],8
fffff806`3d03a7b5 488d4cc5b8      lea     rcx,[rbp+rax*8-48h]
fffff806`3d03a7ba 6644897c2420    mov     word ptr [rsp+20h],r15w
fffff806`3d03a7c0 48894df0        mov     qword ptr [rbp-10h],rcx
fffff806`3d03a7c4 488d4df0        lea     rcx,[rbp-10h]
fffff806`3d03a7c8 e8c3000000      call    nt!EtwpLogKernelEvent (fffff806`3d03a890)
fffff806`3d03a7cd 4533c9          xor     r9d,r9d

nt!KiExecuteAllDpcs+0x420:
fffff806`3d03a7d0 0fbcce          bsf     ecx,esi
fffff806`3d03a7d3 7593            jne     nt!KiExecuteAllDpcs+0x3b8 (fffff806`3d03a768)  Branch

nt!KiExecuteAllDpcs+0x425:
fffff806`3d03a7d5 894c245c        mov     dword ptr [rsp+5Ch],ecx

nt!KiExecuteAllDpcs+0x429:
fffff806`3d03a7d9 fa              cli
fffff806`3d03a7da 8b4318          mov     eax,dword ptr [rbx+18h]
fffff806`3d03a7dd 85c0            test    eax,eax
fffff806`3d03a7df 753e            jne     nt!KiExecuteAllDpcs+0x46f (fffff806`3d03a81f)  Branch

nt!KiExecuteAllDpcs+0x431:
fffff806`3d03a7e1 488b45a0        mov     rax,qword ptr [rbp-60h]
fffff806`3d03a7e5 4c8bb42430010000 mov     r14,qword ptr [rsp+130h]
fffff806`3d03a7ed 4c8ba42438010000 mov     r12,qword ptr [rsp+138h]
fffff806`3d03a7f5 4c8bbc2428010000 mov     r15,qword ptr [rsp+128h]
fffff806`3d03a7fd 488987902d0000  mov     qword ptr [rdi+2D90h],rax ; IsrDpcStats

nt!KiExecuteAllDpcs+0x454:
fffff806`3d03a804 488b4d10        mov     rcx,qword ptr [rbp+10h]
fffff806`3d03a808 4833cc          xor     rcx,rsp
fffff806`3d03a80b e810eb1700      call    nt!_security_check_cookie (fffff806`3d1b9320)
fffff806`3d03a810 4881c440010000  add     rsp,140h
fffff806`3d03a817 415d            pop     r13
fffff806`3d03a819 5f              pop     rdi
fffff806`3d03a81a 5e              pop     rsi
fffff806`3d03a81b 5b              pop     rbx
fffff806`3d03a81c 5d              pop     rbp
fffff806`3d03a81d c3              ret

nt!KiExecuteAllDpcs+0x46f:
fffff806`3d03a81f 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
fffff806`3d03a824 498bd5          mov     rdx,r13
fffff806`3d03a827 33f6            xor     esi,esi
fffff806`3d03a829 e946fcffff      jmp     nt!KiExecuteAllDpcs+0xc4 (fffff806`3d03a474)  Branch

nt!KiExecuteAllDpcs+0x47e:
fffff806`3d03a82e 4889742470      mov     qword ptr [rsp+70h],rsi
fffff806`3d03a833 e931fcffff      jmp     nt!KiExecuteAllDpcs+0xb9 (fffff806`3d03a469)  Branch

nt!KiExecuteAllDpcs+0x488:
fffff806`3d03a838 b8420f0000      mov     eax,0F42h
fffff806`3d03a83d c744246402184000 mov     dword ptr [rsp+64h],401802h
fffff806`3d03a845 e910fcffff      jmp     nt!KiExecuteAllDpcs+0xaa (fffff806`3d03a45a)  Branch

nt!KiExecuteAllDpcs+0x49a:
fffff806`3d03a84a be1e000000      mov     esi,1Eh
fffff806`3d03a84f e98bfdffff      jmp     nt!KiExecuteAllDpcs+0x22f (fffff806`3d03a5df)  Branch

nt!KiExecuteAllDpcs+0x4a4:
fffff806`3d03a854 488b8eb8840000  mov     rcx,qword ptr [rsi+84B8h] ; schedulerassit
fffff806`3d03a85b 4885c9          test    rcx,rcx
fffff806`3d03a85e 0f855fae1d00    jne     nt!KiExecuteAllDpcs+0x1db313 (fffff806`3d2156c3)  Branch ?

nt!KiExecuteAllDpcs+0x4b4: ; spin on DpcLock
fffff806`3d03a864 498bcc          mov     rcx,r12
fffff806`3d03a867 e814cb0900      call    nt!KxWaitForSpinLockAndAcquire (fffff806`3d0d7380)
fffff806`3d03a86c 4c8b5c2430      mov     r11,qword ptr [rsp+30h] ; r11 = MaybeNumDpcsExecuted?
fffff806`3d03a871 498bd5          mov     rdx,r13
fffff806`3d03a874 41b8edffffff    mov     r8d,0FFFFFFEDh
fffff806`3d03a87a e932fcffff      jmp     nt!KiExecuteAllDpcs+0x101 (fffff806`3d03a4b1)  Branch

nt!KiExecuteAllDpcs+0x1db2c4:
fffff806`3d215674 498bcc          mov     rcx,r12
fffff806`3d215677 e8407b1000      call    nt!KiAcquireSpinLockInstrumented (fffff806`3d31d1bc)
fffff806`3d21567c 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
fffff806`3d215681 498bd5          mov     rdx,r13
fffff806`3d215684 41b8edffffff    mov     r8d,0FFFFFFEDh
fffff806`3d21568a e9244ee2ff      jmp     nt!KiExecuteAllDpcs+0x103 (fffff806`3d03a4b3)  Branch

nt!KiExecuteAllDpcs+0x1db2df:
fffff806`3d21568f 807e2001        cmp     byte ptr [rsi+20h],1
fffff806`3d215693 0f870b4ee2ff    ja      nt!KiExecuteAllDpcs+0xf4 (fffff806`3d03a4a4)  Branch

nt!KiExecuteAllDpcs+0x1db2e9:
fffff806`3d215699 8b4118          mov     eax,dword ptr [rcx+18h]
fffff806`3d21569c 83c001          add     eax,1
fffff806`3d21569f 894118          mov     dword ptr [rcx+18h],eax
fffff806`3d2156a2 0f85fc4de2ff    jne     nt!KiExecuteAllDpcs+0xf4 (fffff806`3d03a4a4)  Branch

nt!KiExecuteAllDpcs+0x1db2f8:
fffff806`3d2156a8 488bce          mov     rcx,rsi
fffff806`3d2156ab e8c40f1100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d2156b0 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
fffff806`3d2156b5 498bd5          mov     rdx,r13
fffff806`3d2156b8 41b8edffffff    mov     r8d,0FFFFFFEDh
fffff806`3d2156be e9e14de2ff      jmp     nt!KiExecuteAllDpcs+0xf4 (fffff806`3d03a4a4)  Branch

nt!KiExecuteAllDpcs+0x1db313:
fffff806`3d2156c3 807e2001        cmp     byte ptr [rsi+20h],1
fffff806`3d2156c7 0f879751e2ff    ja      nt!KiExecuteAllDpcs+0x4b4 (fffff806`3d03a864)  Branch

nt!KiExecuteAllDpcs+0x1db31d:
fffff806`3d2156cd 8b4118          mov     eax,dword ptr [rcx+18h]
fffff806`3d2156d0 83e801          sub     eax,1
fffff806`3d2156d3 894118          mov     dword ptr [rcx+18h],eax
fffff806`3d2156d6 0f858851e2ff    jne     nt!KiExecuteAllDpcs+0x4b4 (fffff806`3d03a864)  Branch

nt!KiExecuteAllDpcs+0x1db32c:
fffff806`3d2156dc 488bce          mov     rcx,rsi
fffff806`3d2156df e8900f1100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d2156e4 90              nop
fffff806`3d2156e5 e97a51e2ff      jmp     nt!KiExecuteAllDpcs+0x4b4 (fffff806`3d03a864)  Branch

nt!KiExecuteAllDpcs+0x1db33a:
fffff806`3d2156ea 4585ed          test    r13d,r13d
fffff806`3d2156ed 0f853b4ee2ff    jne     nt!KiExecuteAllDpcs+0x17e (fffff806`3d03a52e)  Branch

nt!KiExecuteAllDpcs+0x1db343:
fffff806`3d2156f3 8b411c          mov     eax,dword ptr [rcx+1Ch]
fffff806`3d2156f6 ffc8            dec     eax
fffff806`3d2156f8 89411c          mov     dword ptr [rcx+1Ch],eax
fffff806`3d2156fb e92e4ee2ff      jmp     nt!KiExecuteAllDpcs+0x17e (fffff806`3d03a52e)  Branch

nt!KiExecuteAllDpcs+0x1db350:
fffff806`3d215700 488b5568        mov     rdx,qword ptr [rbp+68h]
fffff806`3d215704 498bcc          mov     rcx,r12
fffff806`3d215707 e8bc7b1000      call    nt!KiReleaseSpinLockInstrumented (fffff806`3d31d2c8)
fffff806`3d21570c 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
fffff806`3d215711 4c8b542438      mov     r10,qword ptr [rsp+38h]
fffff806`3d215716 4c8b442450      mov     r8,qword ptr [rsp+50h]
fffff806`3d21571b 4c8b4c2440      mov     r9,qword ptr [rsp+40h]
fffff806`3d215720 e91c4ee2ff      jmp     nt!KiExecuteAllDpcs+0x191 (fffff806`3d03a541)  Branch

nt!KiExecuteAllDpcs+0x1db375:
fffff806`3d215725 80792001        cmp     byte ptr [rcx+20h],1
fffff806`3d215729 0f872b4ee2ff    ja      nt!KiExecuteAllDpcs+0x1aa (fffff806`3d03a55a)  Branch

nt!KiExecuteAllDpcs+0x1db37f:
fffff806`3d21572f 8b4218          mov     eax,dword ptr [rdx+18h]
fffff806`3d215732 83e801          sub     eax,1
fffff806`3d215735 894218          mov     dword ptr [rdx+18h],eax
fffff806`3d215738 0f851c4ee2ff    jne     nt!KiExecuteAllDpcs+0x1aa (fffff806`3d03a55a)  Branch

nt!KiExecuteAllDpcs+0x1db38e:
fffff806`3d21573e e8310f1100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d215743 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
fffff806`3d215748 4c8b542438      mov     r10,qword ptr [rsp+38h]
fffff806`3d21574d 4c8b442450      mov     r8,qword ptr [rsp+50h]
fffff806`3d215752 4c8b4c2440      mov     r9,qword ptr [rsp+40h]
fffff806`3d215757 e9fe4de2ff      jmp     nt!KiExecuteAllDpcs+0x1aa (fffff806`3d03a55a)  Branch

nt!KiExecuteAllDpcs+0x1db3ac:
fffff806`3d21575c 488b442448      mov     rax,qword ptr [rsp+48h]
fffff806`3d215761 41b9650f0000    mov     r9d,0F65h
fffff806`3d215767 488b158a628e00  mov     rdx,qword ptr [nt!KiWaitAlways (fffff806`3dafb9f8)]
fffff806`3d21576e 41b800000420    mov     r8d,20040000h
fffff806`3d215774 4933d6          xor     rdx,r14
fffff806`3d215777 488945a8        mov     qword ptr [rbp-58h],rax
fffff806`3d21577b 480fca          bswap   rdx
fffff806`3d21577e 4833d0          xor     rdx,rax
fffff806`3d215781 48c745e810000000 mov     qword ptr [rbp-18h],10h
fffff806`3d215789 488b0568608e00  mov     rax,qword ptr [nt!KiWaitNever (fffff806`3dafb7f8)]
fffff806`3d215790 8bc8            mov     ecx,eax
fffff806`3d215792 c7442420020a4000 mov     dword ptr [rsp+20h],400A02h
fffff806`3d21579a 48d3ca          ror     rdx,cl
fffff806`3d21579d 488d4de0        lea     rcx,[rbp-20h]
fffff806`3d2157a1 4833d0          xor     rdx,rax
fffff806`3d2157a4 48b87772ddf3c7c6357e mov rax,7E35C6C7F3DD7277h
fffff806`3d2157ae 480fafd0        imul    rdx,rax
fffff806`3d2157b2 488d45a8        lea     rax,[rbp-58h]
fffff806`3d2157b6 488955b0        mov     qword ptr [rbp-50h],rdx
fffff806`3d2157ba ba01000000      mov     edx,1
fffff806`3d2157bf 488945e0        mov     qword ptr [rbp-20h],rax
fffff806`3d2157c3 e818e7e5ff      call    nt!EtwTraceKernelEvent (fffff806`3d073ee0)
fffff806`3d2157c8 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
fffff806`3d2157cd 4c8b542438      mov     r10,qword ptr [rsp+38h]
fffff806`3d2157d2 4c8b442450      mov     r8,qword ptr [rsp+50h]
fffff806`3d2157d7 4c8b4c2440      mov     r9,qword ptr [rsp+40h]
fffff806`3d2157dc e98a4de2ff      jmp     nt!KiExecuteAllDpcs+0x1bb (fffff806`3d03a56b)  Branch

nt!KiExecuteAllDpcs+0x1db431:
fffff806`3d2157e1 33c9            xor     ecx,ecx
fffff806`3d2157e3 e85811edff      call    nt!KeQueryPerformanceCounter (fffff806`3d0e6940)
fffff806`3d2157e8 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
fffff806`3d2157ed 4c8b542438      mov     r10,qword ptr [rsp+38h]
fffff806`3d2157f2 4c8b4c2440      mov     r9,qword ptr [rsp+40h]
fffff806`3d2157f7 488945c0        mov     qword ptr [rbp-40h],rax
fffff806`3d2157fb 33c0            xor     eax,eax
fffff806`3d2157fd e9ed4de2ff      jmp     nt!KiExecuteAllDpcs+0x23f (fffff806`3d03a5ef)  Branch

nt!KiExecuteAllDpcs+0x1db452:
fffff806`3d215802 e86952dfff      call    nt!RtlGetSystemTimePrecise (fffff806`3d00aa70)
fffff806`3d215807 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
fffff806`3d21580c 4c8b542438      mov     r10,qword ptr [rsp+38h]
fffff806`3d215811 4c8b4c2440      mov     r9,qword ptr [rsp+40h]
fffff806`3d215816 488945c8        mov     qword ptr [rbp-38h],rax
fffff806`3d21581a 33c0            xor     eax,eax
fffff806`3d21581c e9dc4de2ff      jmp     nt!KiExecuteAllDpcs+0x24d (fffff806`3d03a5fd)  Branch

nt!KiExecuteAllDpcs+0x1db471:
fffff806`3d215821 488945d0        mov     qword ptr [rbp-30h],rax
fffff806`3d215825 e9ec4de2ff      jmp     nt!KiExecuteAllDpcs+0x266 (fffff806`3d03a616)  Branch

nt!KiExecuteAllDpcs+0x1db47a:
fffff806`3d21582a 4889442478      mov     qword ptr [rsp+78h],rax
fffff806`3d21582f 488d4c2478      lea     rcx,[rsp+78h]
fffff806`3d215834 488b05a5b17e00  mov     rax,qword ptr [nt!HalPrivateDispatchTable+0x450 (fffff806`3da009e0)]
fffff806`3d21583b e8a012fdff      call    nt!guard_dispatch_icall (fffff806`3d1e6ae0)
fffff806`3d215840 488b442478      mov     rax,qword ptr [rsp+78h]
fffff806`3d215845 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
fffff806`3d21584a 4c8b542438      mov     r10,qword ptr [rsp+38h]
fffff806`3d21584f 4c8b4c2440      mov     r9,qword ptr [rsp+40h]
fffff806`3d215854 e9c74de2ff      jmp     nt!KiExecuteAllDpcs+0x270 (fffff806`3d03a620)  Branch

nt!KiExecuteAllDpcs+0x1db4a9:
fffff806`3d215859 8b87f47b0000    mov     eax,dword ptr [rdi+7BF4h] ; DpcWatchdogCount
fffff806`3d21585f 3987ec7b0000    cmp     dword ptr [rdi+7BECh],eax ; DpcWatchdogProfileCumulativeDpcThreshold
fffff806`3d215865 0f8d1a4ee2ff    jge     nt!KiExecuteAllDpcs+0x2d5 (fffff806`3d03a685)  Branch

nt!KiExecuteAllDpcs+0x1db4bb:
fffff806`3d21586b 448b0536b28300  mov     r8d,dword ptr [nt!KiDpcWatchdogProfileArrayLength (fffff806`3da50aa8)]
fffff806`3d215872 33d2            xor     edx,edx
fffff806`3d215874 49c1e003        shl     r8,3
fffff806`3d215878 48898fb0840000  mov     qword ptr [rdi+84B0h],rcx ; DpcWatchdogProfileCurrentEmptyCapture
fffff806`3d21587f e8bcb7fdff      call    nt!memset (fffff806`3d1f1040)
fffff806`3d215884 4c8b542438      mov     r10,qword ptr [rsp+38h]
fffff806`3d215889 4c8b442450      mov     r8,qword ptr [rsp+50h]
fffff806`3d21588e 4c8b4c2440      mov     r9,qword ptr [rsp+40h]
fffff806`3d215893 e9ed4de2ff      jmp     nt!KiExecuteAllDpcs+0x2d5 (fffff806`3d03a685)  Branch

nt!KiExecuteAllDpcs+0x1db4e8:
fffff806`3d215898 458b6204        mov     r12d,dword ptr [r10+4]
fffff806`3d21589c 48c7c0ffffffff  mov     rax,0FFFFFFFFFFFFFFFFh
fffff806`3d2158a3 418bcc          mov     ecx,r12d
fffff806`3d2158a6 41c1ec05        shr     r12d,5
fffff806`3d2158aa 83e11f          and     ecx,1Fh
fffff806`3d2158ad 48d3e0          shl     rax,cl
fffff806`3d2158b0 4c8bd8          mov     r11,rax
fffff806`3d2158b3 48894598        mov     qword ptr [rbp-68h],rax
fffff806`3d2158b7 4c235c2448      and     r11,qword ptr [rsp+48h]
fffff806`3d2158bc 498bc3          mov     rax,r11
fffff806`3d2158bf 4d8bc3          mov     r8,r11
fffff806`3d2158c2 48c1e838        shr     rax,38h
fffff806`3d2158c6 498bd3          mov     rdx,r11
fffff806`3d2158c9 48894590        mov     qword ptr [rbp-70h],rax
fffff806`3d2158cd 498bc3          mov     rax,r11
fffff806`3d2158d0 48c1e828        shr     rax,28h
fffff806`3d2158d4 48894588        mov     qword ptr [rbp-78h],rax
fffff806`3d2158d8 498bc3          mov     rax,r11
fffff806`3d2158db 48c1e820        shr     rax,20h
fffff806`3d2158df 4889442438      mov     qword ptr [rsp+38h],rax
fffff806`3d2158e4 498bc3          mov     rax,r11
fffff806`3d2158e7 48c1e818        shr     rax,18h
fffff806`3d2158eb 4889442440      mov     qword ptr [rsp+40h],rax
fffff806`3d2158f0 498bc3          mov     rax,r11
fffff806`3d2158f3 48c1e810        shr     rax,10h
fffff806`3d2158f7 49c1e830        shr     r8,30h
fffff806`3d2158fb 48c1ea08        shr     rdx,8
fffff806`3d2158ff 4889442450      mov     qword ptr [rsp+50h],rax
fffff806`3d215904 4585e4          test    r12d,r12d
fffff806`3d215907 0f84a4000000    je      nt!KiExecuteAllDpcs+0x1db601 (fffff806`3d2159b1)  Branch

nt!KiExecuteAllDpcs+0x1db55d:
fffff806`3d21590d 410fb6c3        movzx   eax,r11b
fffff806`3d215911 4805cb5db100    add     rax,0B15DCBh
fffff806`3d215917 4c895db8        mov     qword ptr [rbp-48h],r11
fffff806`3d21591b 486bc825        imul    rcx,rax,25h
fffff806`3d21591f 0fb6c2          movzx   eax,dl
fffff806`3d215922 4803c8          add     rcx,rax
fffff806`3d215925 0fb6442450      movzx   eax,byte ptr [rsp+50h]
fffff806`3d21592a 486bd125        imul    rdx,rcx,25h
fffff806`3d21592e 4803d0          add     rdx,rax
fffff806`3d215931 0fb6442440      movzx   eax,byte ptr [rsp+40h]
fffff806`3d215936 486bca25        imul    rcx,rdx,25h
fffff806`3d21593a 4803c8          add     rcx,rax
fffff806`3d21593d 0fb6442438      movzx   eax,byte ptr [rsp+38h]
fffff806`3d215942 486bd125        imul    rdx,rcx,25h
fffff806`3d215946 4803d0          add     rdx,rax
fffff806`3d215949 0fb64588        movzx   eax,byte ptr [rbp-78h]
fffff806`3d21594d 486bca25        imul    rcx,rdx,25h
fffff806`3d215951 4803c8          add     rcx,rax
fffff806`3d215954 410fb6c0        movzx   eax,r8b
fffff806`3d215958 486bd125        imul    rdx,rcx,25h
fffff806`3d21595c 418d4c24ff      lea     ecx,[r12-1]
fffff806`3d215961 4803d0          add     rdx,rax
fffff806`3d215964 486bc225        imul    rax,rdx,25h
fffff806`3d215968 48034590        add     rax,qword ptr [rbp-70h]
fffff806`3d21596c 8bc0            mov     eax,eax
fffff806`3d21596e 4823c8          and     rcx,rax
fffff806`3d215971 498b4208        mov     rax,qword ptr [r10+8]
fffff806`3d215975 488d14c8        lea     rdx,[rax+rcx*8]
fffff806`3d215979 488b4d98        mov     rcx,qword ptr [rbp-68h]

nt!KiExecuteAllDpcs+0x1db5cd:
fffff806`3d21597d 488b12          mov     rdx,qword ptr [rdx]
fffff806`3d215980 f6c201          test    dl,1
fffff806`3d215983 752c            jne     nt!KiExecuteAllDpcs+0x1db601 (fffff806`3d2159b1)  Branch

nt!KiExecuteAllDpcs+0x1db5d5:
fffff806`3d215985 488b4208        mov     rax,qword ptr [rdx+8]
fffff806`3d215989 4823c1          and     rax,rcx
fffff806`3d21598c 4c3bd8          cmp     r11,rax
fffff806`3d21598f 75ec            jne     nt!KiExecuteAllDpcs+0x1db5cd (fffff806`3d21597d)  Branch

nt!KiExecuteAllDpcs+0x1db5e1:
fffff806`3d215991 488b4210        mov     rax,qword ptr [rdx+10h]
fffff806`3d215995 4b8d0c49        lea     rcx,[r9+r9*2]
fffff806`3d215999 48c1e902        shr     rcx,2
fffff806`3d21599d 48c1e802        shr     rax,2
fffff806`3d2159a1 4803c8          add     rcx,rax
fffff806`3d2159a4 c6421801        mov     byte ptr [rdx+18h],1
fffff806`3d2159a8 48894a10        mov     qword ptr [rdx+10h],rcx
fffff806`3d2159ac e93b4de2ff      jmp     nt!KiExecuteAllDpcs+0x33c (fffff806`3d03a6ec)  Branch

nt!KiExecuteAllDpcs+0x1db601:
fffff806`3d2159b1 488b542448      mov     rdx,qword ptr [rsp+48h]
fffff806`3d2159b6 4d8bc1          mov     r8,r9
fffff806`3d2159b9 498bca          mov     rcx,r10
fffff806`3d2159bc e8073c1100      call    nt!KiInsertNewDpcRuntime (fffff806`3d3295c8) ; # 1
fffff806`3d2159c1 90              nop
fffff806`3d2159c2 e9254de2ff      jmp     nt!KiExecuteAllDpcs+0x33c (fffff806`3d03a6ec)  Branch

nt!KiExecuteAllDpcs+0x1db617:
fffff806`3d2159c7 498bcc          mov     rcx,r12
fffff806`3d2159ca e8019febff      call    nt!KeReleaseSpinLockFromDpcLevel (fffff806`3d0cf8d0)
fffff806`3d2159cf 90              nop
fffff806`3d2159d0 e90c4ee2ff      jmp     nt!KiExecuteAllDpcs+0x431 (fffff806`3d03a7e1)  Branch

nt!KiExecuteAllDpcs+0x1db625:
fffff806`3d2159d5 4c8b442448      mov     r8,qword ptr [rsp+48h]
fffff806`3d2159da 4c8bc9          mov     r9,rcx
fffff806`3d2159dd b9c7000000      mov     ecx,0C7h
fffff806`3d2159e2 4889442420      mov     qword ptr [rsp+20h],rax
fffff806`3d2159e7 ba04000000      mov     edx,4
fffff806`3d2159ec e84f85fcff      call    nt!KeBugCheckEx (fffff806`3d1ddf40)
fffff806`3d2159f1 cc              int     3
fffff806`3d2159f2 e839cfe0ff      call    nt!KeLeaveCriticalRegion (fffff806`3d022930)
fffff806`3d2159f7 90              nop
fffff806`3d2159f8 e97851e2ff      jmp     nt!EtwpLogKernelEvent+0x2e5 (fffff806`3d03ab75)  Branch

nt!EtwpLogKernelEvent+0x2e5:
fffff806`3d03ab75 488b9c24b0000000 mov     rbx,qword ptr [rsp+0B0h]
fffff806`3d03ab7d 4883c470        add     rsp,70h
fffff806`3d03ab81 415f            pop     r15
fffff806`3d03ab83 415e            pop     r14
fffff806`3d03ab85 415d            pop     r13
fffff806`3d03ab87 415c            pop     r12
fffff806`3d03ab89 5f              pop     rdi
fffff806`3d03ab8a 5e              pop     rsi
fffff806`3d03ab8b 5d              pop     rbp
fffff806`3d03ab8c c3              ret
```
