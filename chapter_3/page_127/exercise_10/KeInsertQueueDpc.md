*** Far from finished, need revisitation ***

Map the possible values of register and stack locations:

rcx = SchedulerAssist

rdx = 
	_KPRCB.SchedulerAssist
OR
	[rsp+0C0h]

rdi = _KDPC

rbx = _KPRCB OR [rsp+78h]
rbp = _KPRCB

rsi = &
	_KPRCB.DpcData[0]
	OR
	_KPRCB.DpcData[0].DpcList
	OR
	_KPRCB.DpcData[0].DpcList.ListHead
	OR
	_KPRCB.DpcData[0].DpcList.ListHead.Next

r12 =  bit 40000h is set in PerfGlobalGroupMask+0x4

Post/Pre sub rsp,80h:

rsp+(N<80) = playground
rsp+(80=<N<=B0) saved registers

[RSP+30] = curr prcssr num
[rsp+34h] = _KDPC.DpcCount
[RSP+38] =  _KDPC.DpcQueueDepth
[rsp+40] = Prev CR8
[rsp+70h] = &_KPRCB.DpcData[0]

[rsp+0B0] = 1 OR 0 (some flag)
[rsp+0B8] = [rsp+10h] = rdx
[rsp+0C0] = [rsp+18h] = r8
[rsp+0C8] = [rsp+20h] = r9



1: kd> uf KeInsertQueueDpc
nt!KeInsertQueueDpc:
fffff800`7fac7f00 4883ec38        sub     rsp,38h
fffff800`7fac7f04 4533c9          xor     r9d,r9d
fffff800`7fac7f07 c644242000      mov     byte ptr [rsp+20h],0
fffff800`7fac7f0c e80f000000      call    nt!KiInsertQueueDpc (fffff800`7fac7f20)
fffff800`7fac7f11 4883c438        add     rsp,38h
fffff800`7fac7f15 c3              ret

1: kd> uf KiInsertQueueDpc
nt!KiInsertQueueDpc:
fffff800`7fac7f20 4c894c2420      mov     qword ptr [rsp+20h],r9 ; Always zero
fffff800`7fac7f25 4c89442418      mov     qword ptr [rsp+18h],r8 ; SysArg2
fffff800`7fac7f2a 4889542410      mov     qword ptr [rsp+10h],rdx ; SysArg1
fffff800`7fac7f2f 55              push    rbp
fffff800`7fac7f30 57              push    rdi
fffff800`7fac7f31 4154            push    r12
fffff800`7fac7f33 4155            push    r13
fffff800`7fac7f35 4157            push    r15
fffff800`7fac7f37 4881ec80000000  sub     rsp,80h ; After this
fffff800`7fac7f3e 440fb75102      movzx   r10d,word ptr [rcx+2] ; rcx is _KDPC. r10(d) = _KDPC.Number (presumably processor number to run on)
fffff800`7fac7f43 33c0            xor     eax,eax
fffff800`7fac7f45 4532ff          xor     r15b,r15b
fffff800`7fac7f48 89442434        mov     dword ptr [rsp+34h],eax
fffff800`7fac7f4c f7052e35a30000000400 test dword ptr [nt!PerfGlobalGroupMask+0x4 (fffff800`804fb484)],40000h
fffff800`7fac7f56 488bf9          mov     rdi,rcx ; rdi = _KDPC
fffff800`7fac7f59 89442438        mov     dword ptr [rsp+38h],eax
fffff800`7fac7f5d 0f85ede91800    jne     nt!KiInsertQueueDpc+0x18ea30 (fffff800`7fc56950)  Branch ; jump to r12 = 1, jmp fffff800`7fac7f66

nt!KiInsertQueueDpc+0x43:
fffff800`7fac7f63 4532e4          xor     r12b,r12b

nt!KiInsertQueueDpc+0x46:
fffff800`7fac7f66 888424b0000000  mov     byte ptr [rsp+0B0h],al
fffff800`7fac7f6d 450f20c5        mov     r13,cr8 ; save CR8
fffff800`7fac7f71 4c896c2440      mov     qword ptr [rsp+40h],r13
fffff800`7fac7f76 b80f000000      mov     eax,0Fh
fffff800`7fac7f7b 440f22c0        mov     cr8,rax ; disable all interrupts
fffff800`7fac7f7f 8b05d336a300    mov     eax,dword ptr [nt!KiIrqlFlags (fffff800`804fb658)]
fffff800`7fac7f85 85c0            test    eax,eax
fffff800`7fac7f87 0f85cbe91800    jne     nt!KiInsertQueueDpc+0x18ea38 (fffff800`7fc56958)  Branch

nt!KiInsertQueueDpc+0x6d:
fffff800`7fac7f8d 65488b2c2520000000 mov   rbp,qword ptr gs:[20h] ; _KPCR.CurrKPRCB
fffff800`7fac7f96 4c8d1d6380d3ff  lea     r11,[nt!PopNotifyWork <PERF> (nt+0x0) (fffff800`7f800000)] ; base of ntkrnlmp.exe
fffff800`7fac7f9d b800050000      mov     eax,500h
fffff800`7fac7fa2 48895c2478      mov     qword ptr [rsp+78h],rbx
fffff800`7fac7fa7 66443bd0        cmp     r10w,ax
fffff800`7fac7fab 0f8312020000    jae     nt!KiInsertQueueDpc+0x2a3 (fffff800`7fac81c3)  Branch

nt!KiInsertQueueDpc+0x91:
fffff800`7fac7fb1 8b4524          mov     eax,dword ptr [rbp+24h] ; _KPRCB.Number (of processor?)
fffff800`7fac7fb4 89442430        mov     dword ptr [rsp+30h],eax ; [rsp+30] is current processor number
fffff800`7fac7fb8 66443bd0        cmp     r10w,ax
fffff800`7fac7fbc 0f85be020000    jne     nt!KiInsertQueueDpc+0x360 (fffff800`7fac8280)  Branch ; Jump if NOT current processor

nt!KiInsertQueueDpc+0xa2:
fffff800`7fac7fc2 488bdd          mov     rbx,rbp ; rbx = _KPRCB if branched from 7fac7fbc

nt!KiInsertQueueDpc+0xa5:
fffff800`7fac7fc5 488b4710        mov     rax,qword ptr [rdi+10h] ; rax = _KDPC.ProcessorHistory
fffff800`7fac7fc9 4889742470      mov     qword ptr [rsp+70h],rsi ; 
fffff800`7fac7fce 4c89742468      mov     qword ptr [rsp+68h],r14
fffff800`7fac7fd3 488583c8000000  test    qword ptr [rbx+0C8h],rax ; this rbx is product of calculation at 7fac81cc
fffff800`7fac7fda 0f8483020000    je      nt!KiInsertQueueDpc+0x343 (fffff800`7fac8263)  Branch

nt!KiInsertQueueDpc+0xc0:
fffff800`7fac7fe0 803f1a          cmp     byte ptr [rdi],1Ah ; rdi is _KDPC
fffff800`7fac7fe3 0f842c030000    je      nt!KiInsertQueueDpc+0x3f5 (fffff800`7fac8315)  Branch ; _KDPC.Type == ThreadedDpcObject ?

nt!KiInsertQueueDpc+0xc9:
fffff800`7fac7fe9 b8c0300000      mov     eax,30C0h

nt!KiInsertQueueDpc+0xce:
fffff800`7fac7fee f6059134a30021  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff800`804fb486)],21h
fffff800`7fac7ff5 488d3403        lea     rsi,[rbx+rax] ; rsi = & _KPRCB.DpcData[0] or DpcData[1] depends on eax (_KDPC_DATA)
fffff800`7fac7ff9 0f85dae91800    jne     nt!KiInsertQueueDpc+0x18eab9 (fffff800`7fc569d9)  Branch

nt!KiInsertQueueDpc+0xdf:
fffff800`7fac7fff 654c8b2c2520000000 mov   r13,qword ptr gs:[20h]
fffff800`7fac8008 498b8db8840000  mov     rcx,qword ptr [r13+84B8h] ; _KPRCB.SchedulerAssist (pointer)
fffff800`7fac800f 4885c9          test    rcx,rcx
fffff800`7fac8012 0f85e7e91800    jne     nt!KiInsertQueueDpc+0x18eadf (fffff800`7fc569ff)  Branch

nt!KiInsertQueueDpc+0xf8: ; Lock _KPRCB.DpcData[0]/[1].DpcLock. If already locked, jump to spin lock and continue in 7fac8025
fffff800`7fac8018 f0480fba6e1000  lock bts qword ptr [rsi+10h],0 ; RFLAGS.CF = LSB of this value, and set LSB to 1. So this is an atomic cmpxchg.
fffff800`7fac801f 0f8230030000    jb      nt!KiInsertQueueDpc+0x435 (fffff800`7fac8355)  Branch ; jump if LSB was set, i.e. if was DpcLock != 0

nt!KiInsertQueueDpc+0x105:
fffff800`7fac8025 4c8b6c2440      mov     r13,qword ptr [rsp+40h] ; r13 = PrevCR8

nt!KiInsertQueueDpc+0x10a: ; jump here after locking the DPC
fffff800`7fac802a 448b5c2430      mov     r11d,dword ptr [rsp+30h] ; r11d = curr processor number
fffff800`7fac802f b801000000      mov     eax,1
fffff800`7fac8034 443b5d24        cmp     r11d,dword ptr [rbp+24h] ; curr processor number == curr processor number ????
fffff800`7fac8038 488b8d902d0000  mov     rcx,qword ptr [rbp+2D90h] ; rcx = _KPRCB.IsrDpcStats
fffff800`7fac803f 480f45c8        cmovne  rcx,rax ; if IsrDpcStats != 0 then rcx = 1
fffff800`7fac8043 33c0            xor     eax,eax
fffff800`7fac8045 f0480fb14f38    lock cmpxchg qword ptr [rdi+38h],rcx ; if DpcData == 0 then DpcData = 1
fffff800`7fac804b 755d            jne     nt!KiInsertQueueDpc+0x18a (fffff800`7fac80aa)  Branch ; if didn't xchg

nt!KiInsertQueueDpc+0x12d:
fffff800`7fac804d 8b4618          mov     eax,dword ptr [rsi+18h] ; eax = _KPRCB.DpcData[0].DpcQueueDepth
fffff800`7fac8050 ff461c          inc     dword ptr [rsi+1Ch] ; DpcData[0].DpcCount++
fffff800`7fac8053 ffc0            inc     eax
fffff800`7fac8055 894618          mov     dword ptr [rsi+18h],eax ; _KPRCB.DpcData[0].DpcQueueDepth++ (why not direct inc like rsi+1C?)
fffff800`7fac8058 48895728        mov     qword ptr [rdi+28h],rdx ; _KDPC.SystemArgument1 = _KPRCB.DpcData[0].ListHead.Next
fffff800`7fac805c 4c894730        mov     qword ptr [rdi+30h],r8 ; _KDPC.SystemArgument2 = r8 ?
fffff800`7fac8060 4584e4          test    r12b,r12b
fffff800`7fac8063 0f85fde91800    jne     nt!KiInsertQueueDpc+0x18eb46 (fffff800`7fc56a66)  Branch

nt!KiInsertQueueDpc+0x149:
fffff800`7fac8069 807f0102        cmp     byte ptr [rdi+1],2
fffff800`7fac806d 488d4f08        lea     rcx,[rdi+8] ; rcx = &_KDPC.DpcListEntry (_SINGLE_LIST_ENTRY)
fffff800`7fac8071 41b701          mov     r15b,1 ; r15 = 1
fffff800`7fac8074 0f8484020000    je      nt!KiInsertQueueDpc+0x3de (fffff800`7fac82fe)  Branch ; _KDPC.Importance == HighImportance ?

nt!KiInsertQueueDpc+0x15a:
fffff800`7fac807a 48c70100000000  mov     qword ptr [rcx],0 ; _KDPC.DpcListEntry.Next = 0
fffff800`7fac8081 488b4608        mov     rax,qword ptr [rsi+8] ; rax = _KPRCB.DpcData[0].DpcList.LastEntry
fffff800`7fac8085 488908          mov     qword ptr [rax],rcx ; _KPRCB.DpcData[0].DpcList.LastEntry->Next = _KDPC.DpcListEntry
fffff800`7fac8088 48894e08        mov     qword ptr [rsi+8],rcx ; _KPRCB.DpcData[0].DpcList.ListHead.Next _KDPC.DpcListEntry

nt!KiInsertQueueDpc+0x16c: ; if [rsp+0B0h] non zero then set _KDPC.Number = r11 and continue at 7fac809a
fffff800`7fac808c 80bc24b000000000 cmp     byte ptr [rsp+0B0h],0
fffff800`7fac8094 0f85f3010000    jne     nt!KiInsertQueueDpc+0x36d (fffff800`7fac828d)  Branch

nt!KiInsertQueueDpc+0x17a:
fffff800`7fac809a 488b8bb8840000  mov     rcx,qword ptr [rbx+84B8h] ; rcx = SchedulerAssist
fffff800`7fac80a1 4885c9          test    rcx,rcx
fffff800`7fac80a4 0f85cfe91800    jne     nt!KiInsertQueueDpc+0x18eb59 (fffff800`7fc56a79)  Branch

nt!KiInsertQueueDpc+0x18a:
fffff800`7fac80aa 4d85c9          test    r9,r9
fffff800`7fac80ad 0f85e4010000    jne     nt!KiInsertQueueDpc+0x377 (fffff800`7fac8297)  Branch ; Jump if r9 non null

nt!KiInsertQueueDpc+0x193:
fffff800`7fac80b3 f605cc33a30001  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff800`804fb486)],1
fffff800`7fac80ba 0f85d6e91800    jne     nt!KiInsertQueueDpc+0x18eb76 (fffff800`7fc56a96)  Branch

nt!KiInsertQueueDpc+0x1a0:
fffff800`7fac80c0 f04883661000    lock and qword ptr [rsi+10h],0 ; Clear DpcLock

nt!KiInsertQueueDpc+0x1a6:
fffff800`7fac80c6 65488b0c2520000000 mov   rcx,qword ptr gs:[20h] ; rcx = _KPRCB
fffff800`7fac80cf 4c8b742468      mov     r14,qword ptr [rsp+68h] ; r14 = ?
fffff800`7fac80d4 488b91b8840000  mov     rdx,qword ptr [rcx+84B8h] ; rdx = SchedulerAssist
fffff800`7fac80db 4885d2          test    rdx,rdx
fffff800`7fac80de 0f85cde91800    jne     nt!KiInsertQueueDpc+0x18eb91 (fffff800`7fc56ab1)  Branch

nt!KiInsertQueueDpc+0x1c4:
fffff800`7fac80e4 4584ff          test    r15b,r15b
fffff800`7fac80e7 0f84a1000000    je      nt!KiInsertQueueDpc+0x26e (fffff800`7fac818e)  Branch

nt!KiInsertQueueDpc+0x1cd:
fffff800`7fac80ed 4584e4          test    r12b,r12b
fffff800`7fac80f0 0f85e3e91800    jne     nt!KiInsertQueueDpc+0x18ebb9 (fffff800`7fc56ad9)  Branch

nt!KiInsertQueueDpc+0x1d6:
fffff800`7fac80f6 488d83e8300000  lea     rax,[rbx+30E8h] ; rax = & DpcData[1]
fffff800`7fac80fd 483bf0          cmp     rsi,rax
fffff800`7fac8100 0f8426020000    je      nt!KiInsertQueueDpc+0x40c (fffff800`7fac832c)  Branch ; jump if already pointing to second member?

nt!KiInsertQueueDpc+0x1e6:
fffff800`7fac8106 8b4618          mov     eax,dword ptr [rsi+18h] ; eax = DpcQueueDepth
fffff800`7fac8109 3b8318310000    cmp     eax,dword ptr [rbx+3118h] ; 
fffff800`7fac810f 7d15            jge     nt!KiInsertQueueDpc+0x206 (fffff800`7fac8126)  Branch ; jump if DpcQueueDepth >= _KPRCB.MaximumDpcQueueDepth

nt!KiInsertQueueDpc+0x1f1:
fffff800`7fac8111 0fb64701        movzx   eax,byte ptr [rdi+1]
fffff800`7fac8115 483beb          cmp     rbp,rbx
fffff800`7fac8118 0f85c4000000    jne     nt!KiInsertQueueDpc+0x2c2 (fffff800`7fac81e2)  Branch

nt!KiInsertQueueDpc+0x1fe:
fffff800`7fac811e 84c0            test    al,al
fffff800`7fac8120 0f848b010000    je      nt!KiInsertQueueDpc+0x391 (fffff800`7fac82b1)  Branch

nt!KiInsertQueueDpc+0x206: ; jumped to if DpcQueueDepth >= MaximumDpcQueueDepth
fffff800`7fac8126 bf02000000      mov     edi,2
fffff800`7fac812b 440fb7d7        movzx   r10d,di

nt!KiInsertQueueDpc+0x20f:
fffff800`7fac812f be2f000000      mov     esi,2Fh
fffff800`7fac8134 440fb7ce        movzx   r9d,si
fffff800`7fac8138 483bdd          cmp     rbx,rbp
fffff800`7fac813b 7509            jne     nt!KiInsertQueueDpc+0x226 (fffff800`7fac8146)  Branch

nt!KiInsertQueueDpc+0x21d:
fffff800`7fac813d 448d4efa        lea     r9d,[rsi-6]
fffff800`7fac8141 664183ca20      or      r10w,20h

nt!KiInsertQueueDpc+0x226:
fffff800`7fac8146 c744243c00000000 mov     dword ptr [rsp+3Ch],0
fffff800`7fac814e 0f0d8b2c310000  prefetchw [rbx+312Ch]
fffff800`7fac8155 0fb7932c310000  movzx   edx,word ptr [rbx+312Ch]
fffff800`7fac815c 0fb7ca          movzx   ecx,dx
fffff800`7fac815f 0fb7c2          movzx   eax,dx
fffff800`7fac8162 66410bca        or      cx,r10w
fffff800`7fac8166 66f00fb18b2c310000 lock cmpxchg word ptr [rbx+312Ch],cx
fffff800`7fac816f 0f851b020000    jne     nt!KiInsertQueueDpc+0x470 (fffff800`7fac8390)  Branch

nt!KiInsertQueueDpc+0x255:
fffff800`7fac8175 664185d1        test    r9w,dx
fffff800`7fac8179 7513            jne     nt!KiInsertQueueDpc+0x26e (fffff800`7fac818e)  Branch

nt!KiInsertQueueDpc+0x25b:
fffff800`7fac817b 483bdd          cmp     rbx,rbp
fffff800`7fac817e 7571            jne     nt!KiInsertQueueDpc+0x2d1 (fffff800`7fac81f1)  Branch

nt!KiInsertQueueDpc+0x260:
fffff800`7fac8180 807d2000        cmp     byte ptr [rbp+20h],0
fffff800`7fac8184 0f84cd000000    je      nt!KiInsertQueueDpc+0x337 (fffff800`7fac8257)  Branch

nt!KiInsertQueueDpc+0x26a:
fffff800`7fac818a c6450601        mov     byte ptr [rbp+6],1

nt!KiInsertQueueDpc+0x26e: ; if KiIrqlFlags == 0 then we finally exit
fffff800`7fac818e 8b05c434a300    mov     eax,dword ptr [nt!KiIrqlFlags (fffff800`804fb658)]
fffff800`7fac8194 488b742470      mov     rsi,qword ptr [rsp+70h]
fffff800`7fac8199 85c0            test    eax,eax
fffff800`7fac819b 0f8518ea1800    jne     nt!KiInsertQueueDpc+0x18ec99 (fffff800`7fc56bb9)  Branch

nt!KiInsertQueueDpc+0x281:
fffff800`7fac81a1 410fb6cd        movzx   ecx,r13b
fffff800`7fac81a5 440f22c1        mov     cr8,rcx
fffff800`7fac81a9 488b5c2478      mov     rbx,qword ptr [rsp+78h]
fffff800`7fac81ae 410fb6c7        movzx   eax,r15b
fffff800`7fac81b2 4881c480000000  add     rsp,80h
fffff800`7fac81b9 415f            pop     r15
fffff800`7fac81bb 415d            pop     r13
fffff800`7fac81bd 415c            pop     r12
fffff800`7fac81bf 5f              pop     rdi
fffff800`7fac81c0 5d              pop     rbp
fffff800`7fac81c1 c3              ret

nt!KiInsertQueueDpc+0x2a3:
fffff800`7fac81c3 418bca          mov     ecx,r10d
fffff800`7fac81c6 2bc8            sub     ecx,eax
fffff800`7fac81c8 894c2430        mov     dword ptr [rsp+30h],ecx
fffff800`7fac81cc 498b9ccb80cccf00 mov     rbx,qword ptr [r11+rcx*8+0CFCC80h]
fffff800`7fac81d4 4885db          test    rbx,rbx
fffff800`7fac81d7 0f85e8fdffff    jne     nt!KiInsertQueueDpc+0xa5 (fffff800`7fac7fc5)  Branch

nt!KiInsertQueueDpc+0x2bd:
fffff800`7fac81dd e9d6e71800      jmp     nt!KiInsertQueueDpc+0x18ea98 (fffff800`7fc569b8)  Branch ; bugcheck

nt!KiInsertQueueDpc+0x2c2:
fffff800`7fac81e2 2c02            sub     al,2
fffff800`7fac81e4 3c01            cmp     al,1
fffff800`7fac81e6 0f863affffff    jbe     nt!KiInsertQueueDpc+0x206 (fffff800`7fac8126)  Branch

nt!KiInsertQueueDpc+0x2cc:
fffff800`7fac81ec e9d2000000      jmp     nt!KiInsertQueueDpc+0x3a3 (fffff800`7fac82c3)  Branch

nt!KiInsertQueueDpc+0x2d1:
fffff800`7fac81f1 488b4308        mov     rax,qword ptr [rbx+8] ; CurrentThread
fffff800`7fac81f5 483b4318        cmp     rax,qword ptr [rbx+18h] ; IdleThread
fffff800`7fac81f9 747a            je      nt!KiInsertQueueDpc+0x355 (fffff800`7fac8275)  Branch ; CurrentThread == IdleThread ?

nt!KiInsertQueueDpc+0x2db:
fffff800`7fac81fb 8b054f32a300    mov     eax,dword ptr [nt!KiVelocityFlags (fffff800`804fb450)]
fffff800`7fac8201 8b0d151ea300    mov     ecx,dword ptr [nt!KiVpThreadSystemWorkPriority (fffff800`804fa01c)]
fffff800`7fac8207 a802            test    al,2
fffff800`7fac8209 7410            je      nt!KiInsertQueueDpc+0x2fb (fffff800`7fac821b)  Branch

nt!KiInsertQueueDpc+0x2eb:
fffff800`7fac820b 488b83b8840000  mov     rax,qword ptr [rbx+84B8h]
fffff800`7fac8212 4885c0          test    rax,rax
fffff800`7fac8215 0f8515e91800    jne     nt!KiInsertQueueDpc+0x18ec10 (fffff800`7fc56b30)  Branch

nt!KiInsertQueueDpc+0x2fb:
fffff800`7fac821b 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff800`7fac8224 488d4c2448      lea     rcx,[rsp+48h]
fffff800`7fac8229 0f57c0          xorps   xmm0,xmm0
fffff800`7fac822c 8bd6            mov     edx,esi
fffff800`7fac822e 0f11442448      movups  xmmword ptr [rsp+48h],xmm0
fffff800`7fac8233 c744244806000000 mov     dword ptr [rsp+48h],6
fffff800`7fac823b ff80d4840000    inc     dword ptr [rax+84D4h]
fffff800`7fac8241 33c0            xor     eax,eax
fffff800`7fac8243 4889442458      mov     qword ptr [rsp+58h],rax
fffff800`7fac8248 44895c2450      mov     dword ptr [rsp+50h],r11d
fffff800`7fac824d e87e010000      call    nt!HalpInterruptSendIpi (fffff800`7fac83d0)
fffff800`7fac8252 e937ffffff      jmp     nt!KiInsertQueueDpc+0x26e (fffff800`7fac818e)  Branch

nt!KiInsertQueueDpc+0x337:
fffff800`7fac8257 b102            mov     cl,2
fffff800`7fac8259 e8122d0300      call    nt!HalRequestSoftwareInterrupt (fffff800`7fafaf70)
fffff800`7fac825e e92bffffff      jmp     nt!KiInsertQueueDpc+0x26e (fffff800`7fac818e)  Branch

nt!KiInsertQueueDpc+0x343:
fffff800`7fac8263 0fb683d1000000  movzx   eax,byte ptr [rbx+0D1h] ; _KPRCB.GroupIndex
fffff800`7fac826a f0480fab4710    lock bts qword ptr [rdi+10h],rax
fffff800`7fac8270 e96bfdffff      jmp     nt!KiInsertQueueDpc+0xc0 (fffff800`7fac7fe0)  Branch

nt!KiInsertQueueDpc+0x355:
fffff800`7fac8275 807b0700        cmp     byte ptr [rbx+7],0
fffff800`7fac8279 7580            jne     nt!KiInsertQueueDpc+0x2db (fffff800`7fac81fb)  Branch ; IdleHalt ?

nt!KiInsertQueueDpc+0x35b:
fffff800`7fac827b e90effffff      jmp     nt!KiInsertQueueDpc+0x26e (fffff800`7fac818e)  Branch

nt!KiInsertQueueDpc+0x360:
fffff800`7fac8280 c68424b000000001 mov     byte ptr [rsp+0B0h],1
fffff800`7fac8288 e935fdffff      jmp     nt!KiInsertQueueDpc+0xa2 (fffff800`7fac7fc2)  Branch

nt!KiInsertQueueDpc+0x36d:
fffff800`7fac828d 6644895f02      mov     word ptr [rdi+2],r11w
fffff800`7fac8292 e903feffff      jmp     nt!KiInsertQueueDpc+0x17a (fffff800`7fac809a)  Branch

nt!KiInsertQueueDpc+0x377:
fffff800`7fac8297 0fb68424d0000000 movzx   eax,byte ptr [rsp+0D0h]
fffff800`7fac829f c1e018          shl     eax,18h
fffff800`7fac82a2 0fbae807        bts     eax,7
fffff800`7fac82a6 f7d0            not     eax
fffff800`7fac82a8 f0412101        lock and dword ptr [r9],eax
fffff800`7fac82ac e902feffff      jmp     nt!KiInsertQueueDpc+0x193 (fffff800`7fac80b3)  Branch

nt!KiInsertQueueDpc+0x391:
fffff800`7fac82b1 8b8320310000    mov     eax,dword ptr [rbx+3120h]
fffff800`7fac82b7 39831c310000    cmp     dword ptr [rbx+311Ch],eax
fffff800`7fac82bd 0f8263feffff    jb      nt!KiInsertQueueDpc+0x206 (fffff800`7fac8126)  Branch

nt!KiInsertQueueDpc+0x3a3:
fffff800`7fac82c3 ba10000000      mov     edx,10h
fffff800`7fac82c8 488d8b2c310000  lea     rcx,[rbx+312Ch]
fffff800`7fac82cf e82055f8ff      call    nt!KiSetDpcRequestFlag (fffff800`7fa4d7f4)
fffff800`7fac82d4 a82f            test    al,2Fh
fffff800`7fac82d6 0f85b2feffff    jne     nt!KiInsertQueueDpc+0x26e (fffff800`7fac818e)  Branch

nt!KiInsertQueueDpc+0x3bc:
fffff800`7fac82dc 488b83c0000000  mov     rax,qword ptr [rbx+0C0h]
fffff800`7fac82e3 488b4840        mov     rcx,qword ptr [rax+40h]
fffff800`7fac82e7 48858bc8000000  test    qword ptr [rbx+0C8h],rcx
fffff800`7fac82ee 0f849afeffff    je      nt!KiInsertQueueDpc+0x26e (fffff800`7fac818e)  Branch

nt!KiInsertQueueDpc+0x3d4:
fffff800`7fac82f4 448b5c2430      mov     r11d,dword ptr [rsp+30h]
fffff800`7fac82f9 e928feffff      jmp     nt!KiInsertQueueDpc+0x206 (fffff800`7fac8126)  Branch

nt!KiInsertQueueDpc+0x3de: ; Branch here if high importance
fffff800`7fac82fe 488b06          mov     rax,qword ptr [rsi] ; rax = ListHead.Next
fffff800`7fac8301 4885c0          test    rax,rax
fffff800`7fac8304 7504            jne     nt!KiInsertQueueDpc+0x3ea (fffff800`7fac830a)  Branch ; Jump if non-zero

; Why is this DPC both first (Head.Next) and last?
nt!KiInsertQueueDpc+0x3e6:
fffff800`7fac8306 48894e08        mov     qword ptr [rsi+8],rcx ; DpcData[0].DpcList.ListHead.LastEntry = _KDPC.DpcListEntry

nt!KiInsertQueueDpc+0x3ea:
fffff800`7fac830a 488901          mov     qword ptr [rcx],rax ; _KDPC.DpcListEntry.Next = ListHead.Next
fffff800`7fac830d 48890e          mov     qword ptr [rsi],rcx ; ListHead.Next = _KDPC.DpcListEntry
fffff800`7fac8310 e977fdffff      jmp     nt!KiInsertQueueDpc+0x16c (fffff800`7fac808c)  Branch

nt!KiInsertQueueDpc+0x3f5:
fffff800`7fac8315 4438bb28310000  cmp     byte ptr [rbx+3128h],r15b
fffff800`7fac831c 0f84c7fcffff    je      nt!KiInsertQueueDpc+0xc9 (fffff800`7fac7fe9)  Branch ; _KPRCB.ThreadDpcEnable == x ?

nt!KiInsertQueueDpc+0x402:
fffff800`7fac8322 b8e8300000      mov     eax,30E8h ; eax = offset of DpcData[1]
fffff800`7fac8327 e9c2fcffff      jmp     nt!KiInsertQueueDpc+0xce (fffff800`7fac7fee)  Branch

nt!KiInsertQueueDpc+0x40c:
fffff800`7fac832c bf02000000      mov     edi,2
fffff800`7fac8331 488d8b2e310000  lea     rcx,[rbx+312Eh] ; rcx = _KPRCB.ThreadDpcState
fffff800`7fac8338 8bd7            mov     edx,edi
fffff800`7fac833a e8b554f8ff      call    nt!KiSetDpcRequestFlag (fffff800`7fa4d7f4) ; Set flag to 2
fffff800`7fac833f a82f            test    al,2Fh
fffff800`7fac8341 0f8547feffff    jne     nt!KiInsertQueueDpc+0x26e (fffff800`7fac818e)  Branch

nt!KiInsertQueueDpc+0x427:
fffff800`7fac8347 448b5c2430      mov     r11d,dword ptr [rsp+30h] ; r11 = curr processor number
fffff800`7fac834c 448d5702        lea     r10d,[rdi+2] ; r10 = DPC processor number
fffff800`7fac8350 e9dafdffff      jmp     nt!KiInsertQueueDpc+0x20f (fffff800`7fac812f)  Branch

nt!KiInsertQueueDpc+0x435: ; Jump if SchedulerAssist != 0
fffff800`7fac8355 498b8db8840000  mov     rcx,qword ptr [r13+84B8h]
fffff800`7fac835c 4885c9          test    rcx,rcx
fffff800`7fac835f 0f85d9e61800    jne     nt!KiInsertQueueDpc+0x18eb1e (fffff800`7fc56a3e)  Branch

nt!KiInsertQueueDpc+0x445: ; Lock _KPRCB.DpcData[0/1].DpcLock
fffff800`7fac8365 488d4e10        lea     rcx,[rsi+10h]
fffff800`7fac8369 e812f00000      call    nt!KxWaitForSpinLockAndAcquire (fffff800`7fad7380)
fffff800`7fac836e 4c8b8424c0000000 mov     r8,qword ptr [rsp+0C0h]
fffff800`7fac8376 488b9424b8000000 mov     rdx,qword ptr [rsp+0B8h]
fffff800`7fac837e 4c8b8c24c8000000 mov     r9,qword ptr [rsp+0C8h]
fffff800`7fac8386 e99afcffff      jmp     nt!KiInsertQueueDpc+0x105 (fffff800`7fac8025)  Branch

nt!KiInsertQueueDpc+0x470:
fffff800`7fac8390 488d4c243c      lea     rcx,[rsp+3Ch]
fffff800`7fac8395 e8f6330300      call    nt!RtlBackoff (fffff800`7fafb790)
fffff800`7fac839a 0f0d8b2c310000  prefetchw [rbx+312Ch]
fffff800`7fac83a1 0fb7932c310000  movzx   edx,word ptr [rbx+312Ch]
fffff800`7fac83a8 0fb7ca          movzx   ecx,dx
fffff800`7fac83ab 0fb7c2          movzx   eax,dx
fffff800`7fac83ae 66410bca        or      cx,r10w
fffff800`7fac83b2 66f00fb18b2c310000 lock cmpxchg word ptr [rbx+312Ch],cx
fffff800`7fac83bb 0f84b4fdffff    je      nt!KiInsertQueueDpc+0x255 (fffff800`7fac8175)  Branch

nt!KiInsertQueueDpc+0x4a1:
fffff800`7fac83c1 ebcd            jmp     nt!KiInsertQueueDpc+0x470 (fffff800`7fac8390)  Branch

nt!KiInsertQueueDpc+0x18ea30:
fffff800`7fc56950 41b401          mov     r12b,1
fffff800`7fc56953 e90e16e7ff      jmp     nt!KiInsertQueueDpc+0x46 (fffff800`7fac7f66)  Branch

nt!KiInsertQueueDpc+0x18ea38:
fffff800`7fc56958 a801            test    al,1
fffff800`7fc5695a 0f842d16e7ff    je      nt!KiInsertQueueDpc+0x6d (fffff800`7fac7f8d)  Branch

nt!KiInsertQueueDpc+0x18ea40:
fffff800`7fc56960 4180fd0f        cmp     r13b,0Fh
fffff800`7fc56964 0f872316e7ff    ja      nt!KiInsertQueueDpc+0x6d (fffff800`7fac7f8d)  Branch

nt!KiInsertQueueDpc+0x18ea4a:
fffff800`7fc5696a 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff800`7fc56973 48c7c2ffffffff  mov     rdx,0FFFFFFFFFFFFFFFFh
fffff800`7fc5697a 410fb6cd        movzx   ecx,r13b
fffff800`7fc5697e ffc1            inc     ecx
fffff800`7fc56980 48d3e2          shl     rdx,cl
fffff800`7fc56983 4c8b88b8840000  mov     r9,qword ptr [rax+84B8h]
fffff800`7fc5698a 81e2fcff0000    and     edx,0FFFCh
fffff800`7fc56990 458b4114        mov     r8d,dword ptr [r9+14h]
fffff800`7fc56994 440bc2          or      r8d,edx
fffff800`7fc56997 488b9424b8000000 mov     rdx,qword ptr [rsp+0B8h]
fffff800`7fc5699f 45894114        mov     dword ptr [r9+14h],r8d
fffff800`7fc569a3 4c8b8424c0000000 mov     r8,qword ptr [rsp+0C0h]
fffff800`7fc569ab 4c8b8c24c8000000 mov     r9,qword ptr [rsp+0C8h]
fffff800`7fc569b3 e9d515e7ff      jmp     nt!KiInsertQueueDpc+0x6d (fffff800`7fac7f8d)  Branch

nt!KiInsertQueueDpc+0x18ea98:
fffff800`7fc569b8 8b05464a8a00    mov     eax,dword ptr [nt!KeNumberProcessors (fffff800`804fb404)]
fffff800`7fc569be 4d8bca          mov     r9,r10
fffff800`7fc569c1 4c8bc7          mov     r8,rdi
fffff800`7fc569c4 4889442420      mov     qword ptr [rsp+20h],rax
fffff800`7fc569c9 ba03000000      mov     edx,3
fffff800`7fc569ce b9c7000000      mov     ecx,0C7h
fffff800`7fc569d3 e86875f8ff      call    nt!KeBugCheckEx (fffff800`7fbddf40)
fffff800`7fc569d8 cc              int     3

nt!KiInsertQueueDpc+0x18eab9: ; Lock _KDPC.DpcLock
fffff800`7fc569d9 488d4e10        lea     rcx,[rsi+10h] ; _KDPC.DpcLock
fffff800`7fc569dd e8da670c00      call    nt!KiAcquireSpinLockInstrumented (fffff800`7fd1d1bc) ; Lock DPC object
fffff800`7fc569e2 4c8b8424c0000000 mov     r8,qword ptr [rsp+0C0h] ; Restore registers to parameters
fffff800`7fc569ea 488b9424b8000000 mov     rdx,qword ptr [rsp+0B8h]
fffff800`7fc569f2 4c8b8c24c8000000 mov     r9,qword ptr [rsp+0C8h]
fffff800`7fc569fa e92b16e7ff      jmp     nt!KiInsertQueueDpc+0x10a (fffff800`7fac802a)  Branch

nt!KiInsertQueueDpc+0x18eadf:
fffff800`7fc569ff 41807d2001      cmp     byte ptr [r13+20h],1
fffff800`7fc56a04 0f870e16e7ff    ja      nt!KiInsertQueueDpc+0xf8 (fffff800`7fac8018)  Branch

nt!KiInsertQueueDpc+0x18eaea:
fffff800`7fc56a0a 8b4118          mov     eax,dword ptr [rcx+18h]
fffff800`7fc56a0d 83c001          add     eax,1
fffff800`7fc56a10 894118          mov     dword ptr [rcx+18h],eax
fffff800`7fc56a13 0f85ff15e7ff    jne     nt!KiInsertQueueDpc+0xf8 (fffff800`7fac8018)  Branch

nt!KiInsertQueueDpc+0x18eaf9:
fffff800`7fc56a19 498bcd          mov     rcx,r13
fffff800`7fc56a1c e853fc0c00      call    nt!KiRemoveSystemWorkPriorityKick (fffff800`7fd26674)
fffff800`7fc56a21 4c8b8424c0000000 mov     r8,qword ptr [rsp+0C0h]
fffff800`7fc56a29 488b9424b8000000 mov     rdx,qword ptr [rsp+0B8h]
fffff800`7fc56a31 4c8b8c24c8000000 mov     r9,qword ptr [rsp+0C8h]
fffff800`7fc56a39 e9da15e7ff      jmp     nt!KiInsertQueueDpc+0xf8 (fffff800`7fac8018)  Branch

nt!KiInsertQueueDpc+0x18eb1e:
fffff800`7fc56a3e 41807d2001      cmp     byte ptr [r13+20h],1
fffff800`7fc56a43 0f871c19e7ff    ja      nt!KiInsertQueueDpc+0x445 (fffff800`7fac8365)  Branch

nt!KiInsertQueueDpc+0x18eb29:
fffff800`7fc56a49 8b4118          mov     eax,dword ptr [rcx+18h]
fffff800`7fc56a4c 83e801          sub     eax,1
fffff800`7fc56a4f 894118          mov     dword ptr [rcx+18h],eax
fffff800`7fc56a52 0f850d19e7ff    jne     nt!KiInsertQueueDpc+0x445 (fffff800`7fac8365)  Branch

nt!KiInsertQueueDpc+0x18eb38:
fffff800`7fc56a58 498bcd          mov     rcx,r13
fffff800`7fc56a5b e814fc0c00      call    nt!KiRemoveSystemWorkPriorityKick (fffff800`7fd26674)
fffff800`7fc56a60 90              nop
fffff800`7fc56a61 e9ff18e7ff      jmp     nt!KiInsertQueueDpc+0x445 (fffff800`7fac8365)  Branch

nt!KiInsertQueueDpc+0x18eb46:
fffff800`7fc56a66 8b4618          mov     eax,dword ptr [rsi+18h]
fffff800`7fc56a69 89442438        mov     dword ptr [rsp+38h],eax ; [rsp+38h] = DpcQueueDepth
fffff800`7fc56a6d 8b461c          mov     eax,dword ptr [rsi+1Ch] ; DpcCount
fffff800`7fc56a70 89442434        mov     dword ptr [rsp+34h],eax ; [rsp+34h] = DpcCount
fffff800`7fc56a74 e9f015e7ff      jmp     nt!KiInsertQueueDpc+0x149 (fffff800`7fac8069)  Branch

nt!KiInsertQueueDpc+0x18eb59:
fffff800`7fc56a79 488d83c0300000  lea     rax,[rbx+30C0h]
fffff800`7fc56a80 483bf0          cmp     rsi,rax
fffff800`7fc56a83 0f852116e7ff    jne     nt!KiInsertQueueDpc+0x18a (fffff800`7fac80aa)  Branch ; rsi != & DpcData[0]

nt!KiInsertQueueDpc+0x18eb69:
fffff800`7fc56a89 8b411c          mov     eax,dword ptr [rcx+1Ch]
fffff800`7fc56a8c ffc0            inc     eax
fffff800`7fc56a8e 89411c          mov     dword ptr [rcx+1Ch],eax
fffff800`7fc56a91 e91416e7ff      jmp     nt!KiInsertQueueDpc+0x18a (fffff800`7fac80aa)  Branch

nt!KiInsertQueueDpc+0x18eb76:
fffff800`7fc56a96 488b9424a8000000 mov     rdx,qword ptr [rsp+0A8h]
fffff800`7fc56a9e 488d4e10        lea     rcx,[rsi+10h]
fffff800`7fc56aa2 e821680c00      call    nt!KiReleaseSpinLockInstrumented (fffff800`7fd1d2c8)
fffff800`7fc56aa7 448b5c2430      mov     r11d,dword ptr [rsp+30h]
fffff800`7fc56aac e91516e7ff      jmp     nt!KiInsertQueueDpc+0x1a6 (fffff800`7fac80c6)  Branch

nt!KiInsertQueueDpc+0x18eb91:
fffff800`7fc56ab1 80792001        cmp     byte ptr [rcx+20h],1
fffff800`7fc56ab5 0f872916e7ff    ja      nt!KiInsertQueueDpc+0x1c4 (fffff800`7fac80e4)  Branch

nt!KiInsertQueueDpc+0x18eb9b:
fffff800`7fc56abb 8b4218          mov     eax,dword ptr [rdx+18h]
fffff800`7fc56abe 83e801          sub     eax,1
fffff800`7fc56ac1 894218          mov     dword ptr [rdx+18h],eax
fffff800`7fc56ac4 0f851a16e7ff    jne     nt!KiInsertQueueDpc+0x1c4 (fffff800`7fac80e4)  Branch

nt!KiInsertQueueDpc+0x18ebaa:
fffff800`7fc56aca e8a5fb0c00      call    nt!KiRemoveSystemWorkPriorityKick (fffff800`7fd26674)
fffff800`7fc56acf 448b5c2430      mov     r11d,dword ptr [rsp+30h]
fffff800`7fc56ad4 e90b16e7ff      jmp     nt!KiInsertQueueDpc+0x1c4 (fffff800`7fac80e4)  Branch

nt!KiInsertQueueDpc+0x18ebb9:
fffff800`7fc56ad9 488b05184d8a00  mov     rax,qword ptr [nt!KiWaitNever (fffff800`804fb7f8)]
fffff800`7fc56ae0 4c8b15114f8a00  mov     r10,qword ptr [nt!KiWaitAlways (fffff800`804fb9f8)]
fffff800`7fc56ae7 8bc8            mov     ecx,eax
fffff800`7fc56ae9 488b5718        mov     rdx,qword ptr [rdi+18h]
fffff800`7fc56aed 4c33d7          xor     r10,rdi
fffff800`7fc56af0 448b4c2434      mov     r9d,dword ptr [rsp+34h]
fffff800`7fc56af5 448b442438      mov     r8d,dword ptr [rsp+38h]
fffff800`7fc56afa 490fca          bswap   r10
fffff800`7fc56afd 4c33d2          xor     r10,rdx
fffff800`7fc56b00 49d3ca          ror     r10,cl
fffff800`7fc56b03 48b97772ddf3c7c6357e mov rcx,7E35C6C7F3DD7277h
fffff800`7fc56b0d 4c33d0          xor     r10,rax
fffff800`7fc56b10 0fb64701        movzx   eax,byte ptr [rdi+1]
fffff800`7fc56b14 88442428        mov     byte ptr [rsp+28h],al
fffff800`7fc56b18 490fafca        imul    rcx,r10
fffff800`7fc56b1c 44895c2420      mov     dword ptr [rsp+20h],r11d
fffff800`7fc56b21 e8be9a1500      call    nt!EtwTraceDpcEnqueueEvent (fffff800`7fdb05e4)
fffff800`7fc56b26 448b5c2430      mov     r11d,dword ptr [rsp+30h]
fffff800`7fc56b2b e9c615e7ff      jmp     nt!KiInsertQueueDpc+0x1d6 (fffff800`7fac80f6)  Branch

nt!KiInsertQueueDpc+0x18ec10:
fffff800`7fc56b30 4883bdb884000000 cmp     qword ptr [rbp+84B8h],0
fffff800`7fc56b38 0f84dd16e7ff    je      nt!KiInsertQueueDpc+0x2fb (fffff800`7fac821b)  Branch

nt!KiInsertQueueDpc+0x18ec1e:
fffff800`7fc56b3e 83f908          cmp     ecx,8
fffff800`7fc56b41 0f8cd416e7ff    jl      nt!KiInsertQueueDpc+0x2fb (fffff800`7fac821b)  Branch

nt!KiInsertQueueDpc+0x18ec27:
fffff800`7fc56b47 8b00            mov     eax,dword ptr [rax]
fffff800`7fc56b49 8bd0            mov     edx,eax
fffff800`7fc56b4b 81e200000400    and     edx,40000h
fffff800`7fc56b51 440fb6c0        movzx   r8d,al
fffff800`7fc56b55 0fbae014        bt      eax,14h
fffff800`7fc56b59 7211            jb      nt!KiInsertQueueDpc+0x18ec4c (fffff800`7fc56b6c)  Branch

nt!KiInsertQueueDpc+0x18ec3b:
fffff800`7fc56b5b 85d2            test    edx,edx
fffff800`7fc56b5d 0f84b816e7ff    je      nt!KiInsertQueueDpc+0x2fb (fffff800`7fac821b)  Branch

nt!KiInsertQueueDpc+0x18ec43:
fffff800`7fc56b63 443bc1          cmp     r8d,ecx
fffff800`7fc56b66 0f8daf16e7ff    jge     nt!KiInsertQueueDpc+0x2fb (fffff800`7fac821b)  Branch

nt!KiInsertQueueDpc+0x18ec4c:
fffff800`7fc56b6c 803da4348a0000  cmp     byte ptr [nt!HvlpVirtualProcessorsIdentityMapped (fffff800`804fa017)],0
fffff800`7fc56b73 488b95b8840000  mov     rdx,qword ptr [rbp+84B8h]
fffff800`7fc56b7a 897a0c          mov     dword ptr [rdx+0Ch],edi
fffff800`7fc56b7d 8b4b24          mov     ecx,dword ptr [rbx+24h]
fffff800`7fc56b80 7520            jne     nt!KiInsertQueueDpc+0x18ec82 (fffff800`7fc56ba2)  Branch

nt!KiInsertQueueDpc+0x18ec62:
fffff800`7fc56b82 8bc1            mov     eax,ecx
fffff800`7fc56b84 4c8d057594baff  lea     r8,[nt!PopNotifyWork <PERF> (nt+0x0) (fffff800`7f800000)]
fffff800`7fc56b8b 410fb68c4880f6cf00 movzx ecx,byte ptr [r8+rcx*2+0CFF680h]
fffff800`7fc56b94 c1e106          shl     ecx,6
fffff800`7fc56b97 410fb6844081f6cf00 movzx eax,byte ptr [r8+rax*2+0CFF681h]
fffff800`7fc56ba0 0bc8            or      ecx,eax

nt!KiInsertQueueDpc+0x18ec82:
fffff800`7fc56ba2 894a08          mov     dword ptr [rdx+8],ecx
fffff800`7fc56ba5 8bd1            mov     edx,ecx
fffff800`7fc56ba7 8bc1            mov     eax,ecx
fffff800`7fc56ba9 b9c2000040      mov     ecx,400000C2h
fffff800`7fc56bae 48c1ea20        shr     rdx,20h
fffff800`7fc56bb2 0f30            wrmsr
fffff800`7fc56bb4 e96216e7ff      jmp     nt!KiInsertQueueDpc+0x2fb (fffff800`7fac821b)  Branch

nt!KiInsertQueueDpc+0x18ec99:
fffff800`7fc56bb9 a801            test    al,1 ; al is KiIrqlFlags
fffff800`7fc56bbb 0f84e015e7ff    je      nt!KiInsertQueueDpc+0x281 (fffff800`7fac81a1)  Branch

nt!KiInsertQueueDpc+0x18eca1:
fffff800`7fc56bc1 440f20c0        mov     rax,cr8
fffff800`7fc56bc5 3c0f            cmp     al,0Fh
fffff800`7fc56bc7 0f87d415e7ff    ja      nt!KiInsertQueueDpc+0x281 (fffff800`7fac81a1)  Branch

nt!KiInsertQueueDpc+0x18ecad:
fffff800`7fc56bcd 4180fd0f        cmp     r13b,0Fh
fffff800`7fc56bd1 0f87ca15e7ff    ja      nt!KiInsertQueueDpc+0x281 (fffff800`7fac81a1)  Branch

nt!KiInsertQueueDpc+0x18ecb7:
fffff800`7fc56bd7 3c02            cmp     al,2
fffff800`7fc56bd9 0f82c215e7ff    jb      nt!KiInsertQueueDpc+0x281 (fffff800`7fac81a1)  Branch

nt!KiInsertQueueDpc+0x18ecbf:
fffff800`7fc56bdf 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff800`7fc56be8 48c7c2ffffffff  mov     rdx,0FFFFFFFFFFFFFFFFh
fffff800`7fc56bef 410fb6cd        movzx   ecx,r13b
fffff800`7fc56bf3 ffc1            inc     ecx
fffff800`7fc56bf5 48d3e2          shl     rdx,cl
fffff800`7fc56bf8 4c8b88b8840000  mov     r9,qword ptr [rax+84B8h]
fffff800`7fc56bff 0fb7d2          movzx   edx,dx
fffff800`7fc56c02 f7d2            not     edx
fffff800`7fc56c04 458b4114        mov     r8d,dword ptr [r9+14h]
fffff800`7fc56c08 4423c2          and     r8d,edx
fffff800`7fc56c0b 45894114        mov     dword ptr [r9+14h],r8d
fffff800`7fc56c0f 0f858c15e7ff    jne     nt!KiInsertQueueDpc+0x281 (fffff800`7fac81a1)  Branch

nt!KiInsertQueueDpc+0x18ecf5:
fffff800`7fc56c15 488bc8          mov     rcx,rax
fffff800`7fc56c18 e857fa0c00      call    nt!KiRemoveSystemWorkPriorityKick (fffff800`7fd26674)
fffff800`7fc56c1d 90              nop
fffff800`7fc56c1e e97e15e7ff      jmp     nt!KiInsertQueueDpc+0x281 (fffff800`7fac81a1)  Branch
