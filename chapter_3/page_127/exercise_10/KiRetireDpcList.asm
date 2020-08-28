*** Requires revisitation, this would take a while to fully explain ***

0: kd> uf /c /o KiRetireDpcList
nt!KiRetireDpcList (fffff806`3d0397b0)
  nt!KiRetireDpcList+0x4c (fffff806`3d0397fc):
    call to nt!memset (fffff806`3d1f1040)
  nt!KiRetireDpcList+0x1ef (fffff806`3d03999f):
    call to nt!KiExecuteAllDpcs (fffff806`3d03a3b0)
  nt!KiRetireDpcList+0x2ec (fffff806`3d039a9c):
    call to nt!_security_check_cookie (fffff806`3d1b9320)
  nt!KiRetireDpcList+0x318 (fffff806`3d039ac8):
    call to nt!KiSelectActiveTimerTable (fffff806`3d037134)
  nt!KiRetireDpcList+0x45d (fffff806`3d039c0d):
    call to nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
  nt!KiRetireDpcList+0x469 (fffff806`3d039c19):
    call to nt!guard_dispatch_icall (fffff806`3d1e6ae0)
  nt!KiRetireDpcList+0x5d8 (fffff806`3d039d88):
    call to nt!KiProcessExpiredTimerList (fffff806`3d036780)
  nt!KiRetireDpcList+0x735 (fffff806`3d039ee5):
    call to nt!KiRemoveEntryTimer (fffff806`3d037850)
  nt!KiRetireDpcList+0x86f (fffff806`3d03a01f):
    call to nt!KiTimer2Expiration (fffff806`3d030d80)
  nt!KiRetireDpcList+0x8a9 (fffff806`3d03a059):
    call to nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
  nt!KiRetireDpcList+0x8b5 (fffff806`3d03a065):
    call to nt!guard_dispatch_icall (fffff806`3d1e6ae0)
  nt!KiRetireDpcList+0x999 (fffff806`3d03a149):
    call to nt!KiRemoveEntryTimer (fffff806`3d037850)
  nt!KiRetireDpcList+0x9d4 (fffff806`3d03a184):
    call to nt!KiProcessExpiredTimerList (fffff806`3d036780)
  nt!KiRetireDpcList+0xa20 (fffff806`3d03a1d0):
    call to nt!HalpTimerScaleCounter (fffff806`3d180b30)
  nt!KiRetireDpcList+0xa41 (fffff806`3d03a1f1):
    call to nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
  nt!KiRetireDpcList+0xa4d (fffff806`3d03a1fd):
    call to nt!guard_dispatch_icall (fffff806`3d1e6ae0)
  nt!KiRetireDpcList+0xb6e (fffff806`3d03a31e):
    call to nt!KeSignalGate (fffff806`3d142240)
  nt!KiRetireDpcList+0xb9b (fffff806`3d03a34b):
    call to nt!KeYieldProcessorEx (fffff806`3d0333a0)
  nt!KiRetireDpcList+0xbd2 (fffff806`3d03a382):
    call to nt!KeYieldProcessorEx (fffff806`3d0333a0)
  nt!KiExecuteAllDpcs+0x309 (fffff806`3d03a6b9):
    call to nt!guard_dispatch_icall (fffff806`3d1e6ae0)
  nt!KiExecuteAllDpcs+0x418 (fffff806`3d03a7c8):
    call to nt!EtwpLogKernelEvent (fffff806`3d03a890)
  nt!KiExecuteAllDpcs+0x45b (fffff806`3d03a80b):
    call to nt!_security_check_cookie (fffff806`3d1b9320)
  nt!KiExecuteAllDpcs+0x4b7 (fffff806`3d03a867):
    call to nt!KxWaitForSpinLockAndAcquire (fffff806`3d0d7380)
  nt!KiRetireDpcList+0x1dba52 (fffff806`3d215202):
    call to nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
  nt!KiRetireDpcList+0x1dba5e (fffff806`3d21520e):
    call to nt!guard_dispatch_icall (fffff806`3d1e6ae0)
  nt!KiRetireDpcList+0x1dba83 (fffff806`3d215233):
    call to nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
  nt!KiRetireDpcList+0x1dba8f (fffff806`3d21523f):
    call to nt!guard_dispatch_icall (fffff806`3d1e6ae0)
  nt!KiRetireDpcList+0x1dbb45 (fffff806`3d2152f5):
    call to nt!HalpTimerScaleCounter (fffff806`3d180b30)
  nt!KiRetireDpcList+0x1dbbd0 (fffff806`3d215380):
    call to nt!EtwTraceKernelEvent (fffff806`3d073ee0)
  nt!KiRetireDpcList+0x1dbc42 (fffff806`3d2153f2):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiRetireDpcList+0x1dbc69 (fffff806`3d215419):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiRetireDpcList+0x1dbc90 (fffff806`3d215440):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiRetireDpcList+0x1dbcca (fffff806`3d21547a):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiRetireDpcList+0x1dbce3 (fffff806`3d215493):
    call to nt!KiProcessExpiredTimerList (fffff806`3d036780)
  nt!KiRetireDpcList+0x1dbd14 (fffff806`3d2154c4):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiRetireDpcList+0x1dbd5a (fffff806`3d21550a):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiRetireDpcList+0x1dbd83 (fffff806`3d215533):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiRetireDpcList+0x1dbdda (fffff806`3d21558a):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiRetireDpcList+0x1dbdf3 (fffff806`3d2155a3):
    call to nt!KiProcessExpiredTimerList (fffff806`3d036780)
  nt!KiRetireDpcList+0x1dbe25 (fffff806`3d2155d5):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiRetireDpcList+0x1dbe7f (fffff806`3d21562f):
    call to nt!KiBeginCounterAccumulation (fffff806`3d3226a0)
  nt!KiRetireDpcList+0x1dbea1 (fffff806`3d215651):
    call to nt!KeBugCheckEx (fffff806`3d1ddf40)
  nt!KiRetireDpcList+0x1dbebd (fffff806`3d21566d):
    call to nt!KeBugCheckEx (fffff806`3d1ddf40)
  nt!KiExecuteAllDpcs+0x1db2c7 (fffff806`3d215677):
    call to nt!KiAcquireSpinLockInstrumented (fffff806`3d31d1bc)
  nt!KiExecuteAllDpcs+0x1db2fb (fffff806`3d2156ab):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiExecuteAllDpcs+0x1db32f (fffff806`3d2156df):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiExecuteAllDpcs+0x1db357 (fffff806`3d215707):
    call to nt!KiReleaseSpinLockInstrumented (fffff806`3d31d2c8)
  nt!KiExecuteAllDpcs+0x1db38e (fffff806`3d21573e):
    call to nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
  nt!KiExecuteAllDpcs+0x1db413 (fffff806`3d2157c3):
    call to nt!EtwTraceKernelEvent (fffff806`3d073ee0)
  nt!KiExecuteAllDpcs+0x1db433 (fffff806`3d2157e3):
    call to nt!KeQueryPerformanceCounter (fffff806`3d0e6940)
  nt!KiExecuteAllDpcs+0x1db452 (fffff806`3d215802):
    call to nt!RtlGetSystemTimePrecise (fffff806`3d00aa70)
  nt!KiExecuteAllDpcs+0x1db48b (fffff806`3d21583b):
    call to nt!guard_dispatch_icall (fffff806`3d1e6ae0)
  nt!KiExecuteAllDpcs+0x1db4cf (fffff806`3d21587f):
    call to nt!memset (fffff806`3d1f1040)
  nt!KiExecuteAllDpcs+0x1db60c (fffff806`3d2159bc):
    call to nt!KiInsertNewDpcRuntime (fffff806`3d3295c8)
  nt!KiExecuteAllDpcs+0x1db61a (fffff806`3d2159ca):
    call to nt!KeReleaseSpinLockFromDpcLevel (fffff806`3d0cf8d0)
  nt!KiExecuteAllDpcs+0x1db63c (fffff806`3d2159ec):
    call to nt!KeBugCheckEx (fffff806`3d1ddf40)
  nt!EtwpLogKernelEvent+0x1db162 (fffff806`3d2159f2):
    call to nt!KeLeaveCriticalRegion (fffff806`3d022930)
	
* Placing a breakpoint at KiRetireDpcList, we examine how it's called. The only parameter is RCX (set to the current _KPRCB).
  Also RSP is set to _KPRCB.DpcStack (and the previous RSP is saved to this RSP's [rsp+40] to restore it just after KxRetireDpcList).
  
* This function will call KiExecuteAllDpcs()  as well as KiProcessExpiredTimerList().
	
0: kd> uf nt!KiRetireDpcList
nt!KiRetireDpcList:
fffff806`3d0397b0 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff806`3d0397b5 4889742418      mov     qword ptr [rsp+18h],rsi
fffff806`3d0397ba 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff806`3d0397bf 55              push    rbp
fffff806`3d0397c0 4154            push    r12
fffff806`3d0397c2 4155            push    r13
fffff806`3d0397c4 4156            push    r14
fffff806`3d0397c6 4157            push    r15
fffff806`3d0397c8 488dac24a0feffff lea     rbp,[rsp-160h]
fffff806`3d0397d0 4881ec60020000  sub     rsp,260h
fffff806`3d0397d7 488b05528a9d00  mov     rax,qword ptr [nt!_security_cookie (fffff806`3da12230)]
fffff806`3d0397de 4833c4          xor     rax,rsp
fffff806`3d0397e1 48898550010000  mov     qword ptr [rbp+150h],rax
fffff806`3d0397e8 488bf9          mov     rdi,rcx ; rdi = rcx is _KPRCB
fffff806`3d0397eb 48894c2470      mov     qword ptr [rsp+70h],rcx
fffff806`3d0397f0 488d4d44        lea     rcx,[rbp+44h]
fffff806`3d0397f4 33d2            xor     edx,edx
fffff806`3d0397f6 41b80c010000    mov     r8d,10Ch
fffff806`3d0397fc e83f781b00      call    nt!memset (fffff806`3d1f1040)
fffff806`3d039801 488b7708        mov     rsi,qword ptr [rdi+8] ; rsi = CurrentThread _KTHREAD
fffff806`3d039805 4533ed          xor     r13d,r13d
fffff806`3d039808 44896d40        mov     dword ptr [rbp+40h],r13d
fffff806`3d03980c 488975a0        mov     qword ptr [rbp-60h],rsi ; save in [rbp-60]

nt!KiRetireDpcList+0x60:
fffff806`3d039810 49b91400000080f7ffff mov r9,0FFFFF78000000014h ; ?
fffff806`3d03981a c6472001        mov     byte ptr [rdi+20h],1 ; _KPRCB.NestingLevel++
fffff806`3d03981e 49bb0800000080f7ffff mov r11,0FFFFF78000000008h
fffff806`3d039828 41b8ffffffff    mov     r8d,0FFFFFFFFh
fffff806`3d03982e 0f31            rdtsc           ; read timestamp counter (clock cycles)
fffff806`3d039830 48c1e220        shl     rdx,20h ; shift the bits in rdx 32 positions leftwards and OR with rax to get the complete value
fffff806`3d039834 480bc2          or      rax,rdx
fffff806`3d039837 488b5648        mov     rdx,qword ptr [rsi+48h] ; CurrentThread.CycleTime
fffff806`3d03983b 8b4e50          mov     ecx,dword ptr [rsi+50h] ; CurrentThread.CurrentRunTime
fffff806`3d03983e 4c8bd0          mov     r10,rax
fffff806`3d039841 4c2b97c07e0000  sub     r10,qword ptr [rdi+7EC0h] ; r10 = ClockCycles - _KPRCB.StartCycles (start of what?)
                                         ; So now R10 holds what delta?
fffff806`3d039848 4903d2          add     rdx,r10 ; CurrentThread.CycleTime + (ClockCycles - StartCycles)
fffff806`3d03984b 4903ca          add     rcx,r10 ; CurrentThread.CurrentRunTime + (ClockCycles - StartCycles)
fffff806`3d03984e 493bc8          cmp     rcx,r8
fffff806`3d039851 48895648        mov     qword ptr [rsi+48h],rdx
fffff806`3d039855 488987c07e0000  mov     qword ptr [rdi+7EC0h],rax
fffff806`3d03985c 490f47c8        cmova   rcx,r8
fffff806`3d039860 440fb64602      movzx   r8d,byte ptr [rsi+2]
fffff806`3d039865 894e50          mov     dword ptr [rsi+50h],ecx
fffff806`3d039868 41f6c03e        test    r8b,3Eh ; All flags off (but Timer2Inserted)
fffff806`3d03986c 0f8407010000    je      nt!KiRetireDpcList+0x1c9 (fffff806`3d039979)  Branch

nt!KiRetireDpcList+0xc2:
fffff806`3d039872 41f6c010        test    r8b,10h
fffff806`3d039876 0f855e0a0000    jne     nt!KiRetireDpcList+0xb2a (fffff806`3d03a2da)  Branch ; Timer2Running off ?

nt!KiRetireDpcList+0xcc:
fffff806`3d03987c 41f6c020        test    r8b,20h
fffff806`3d039880 0f84df000000    je      nt!KiRetireDpcList+0x1b5 (fffff806`3d039965)  Branch ; Time2Disabled off ?

nt!KiRetireDpcList+0xd6:
fffff806`3d039886 4c8b8ef8050000  mov     r9,qword ptr [rsi+5F8h]
fffff806`3d03988d 4d85c9          test    r9,r9
fffff806`3d039890 0f84c1000000    je      nt!KiRetireDpcList+0x1a7 (fffff806`3d039957)  Branch

nt!KiRetireDpcList+0xe6:
fffff806`3d039896 488b9768810000  mov     rdx,qword ptr [rdi+8168h]
fffff806`3d03989d 488b8770810000  mov     rax,qword ptr [rdi+8170h]
fffff806`3d0398a4 4885d2          test    rdx,rdx
fffff806`3d0398a7 0f84230a0000    je      nt!KiRetireDpcList+0xb20 (fffff806`3d03a2d0)  Branch

nt!KiRetireDpcList+0xfd:
fffff806`3d0398ad 4885c0          test    rax,rax
fffff806`3d0398b0 0f841a0a0000    je      nt!KiRetireDpcList+0xb20 (fffff806`3d03a2d0)  Branch

nt!KiRetireDpcList+0x106:
fffff806`3d0398b6 80786400        cmp     byte ptr [rax+64h],0
fffff806`3d0398ba 0f855ab81d00    jne     nt!KiRetireDpcList+0x1db96a (fffff806`3d21511a)  Branch

nt!KiRetireDpcList+0x110:
fffff806`3d0398c0 8b4848          mov     ecx,dword ptr [rax+48h]
fffff806`3d0398c3 8b8270010000    mov     eax,dword ptr [rdx+170h]
fffff806`3d0398c9 3bc8            cmp     ecx,eax
fffff806`3d0398cb 7202            jb      nt!KiRetireDpcList+0x11f (fffff806`3d0398cf)  Branch

nt!KiRetireDpcList+0x11d:
fffff806`3d0398cd 8bc8            mov     ecx,eax

nt!KiRetireDpcList+0x11f:
fffff806`3d0398cf 83f94b          cmp     ecx,4Bh
fffff806`3d0398d2 0f824ab81d00    jb      nt!KiRetireDpcList+0x1db972 (fffff806`3d215122)  Branch

nt!KiRetireDpcList+0x128:
fffff806`3d0398d8 ba03000000      mov     edx,3

nt!KiRetireDpcList+0x12d:
fffff806`3d0398dd 0fb69fb8810000  movzx   ebx,byte ptr [rdi+81B8h]
fffff806`3d0398e4 448bda          mov     r11d,edx
fffff806`3d0398e7 4c896c2448      mov     qword ptr [rsp+48h],r13
fffff806`3d0398ec 4a8d045b        lea     rax,[rbx+r11*2]
fffff806`3d0398f0 498b0cc1        mov     rcx,qword ptr [r9+rax*8]
fffff806`3d0398f4 498d14c1        lea     rdx,[r9+rax*8]
fffff806`3d0398f8 8b052a169f00    mov     eax,dword ptr [nt!KiTimelineBitmapTime (fffff806`3da2af28)]
fffff806`3d0398fe 4903ca          add     rcx,r10
fffff806`3d039901 48890a          mov     qword ptr [rdx],rcx
fffff806`3d039904 418b89c0000000  mov     ecx,dword ptr [r9+0C0h]
fffff806`3d03990b 3bc1            cmp     eax,ecx
fffff806`3d03990d 0f8757090000    ja      nt!KiRetireDpcList+0xaba (fffff806`3d03a26a)  Branch

nt!KiRetireDpcList+0x163:
fffff806`3d039913 2bc8            sub     ecx,eax
fffff806`3d039915 83f920          cmp     ecx,20h
fffff806`3d039918 730e            jae     nt!KiRetireDpcList+0x178 (fffff806`3d039928)  Branch

nt!KiRetireDpcList+0x16a:
fffff806`3d03991a b801000000      mov     eax,1
fffff806`3d03991f d3e0            shl     eax,cl
fffff806`3d039921 410981c4000000  or      dword ptr [r9+0C4h],eax

nt!KiRetireDpcList+0x178:
fffff806`3d039928 833de51fac0000  cmp     dword ptr [nt!KiEfficiencyClassSystem (fffff806`3dafb914)],0
fffff806`3d03992f 750e            jne     nt!KiRetireDpcList+0x18f (fffff806`3d03993f)  Branch

nt!KiRetireDpcList+0x181:
fffff806`3d039931 8b8600020000    mov     eax,dword ptr [rsi+200h]
fffff806`3d039937 3c02            cmp     al,2
fffff806`3d039939 0f84f2b71d00    je      nt!KiRetireDpcList+0x1db981 (fffff806`3d215131)  Branch

nt!KiRetireDpcList+0x18f:
fffff806`3d03993f 4883bec005000000 cmp     qword ptr [rsi+5C0h],0
fffff806`3d039947 0f8544070000    jne     nt!KiRetireDpcList+0x8e1 (fffff806`3d03a091)  Branch

nt!KiRetireDpcList+0x19d:
fffff806`3d03994d 49bb0800000080f7ffff mov r11,0FFFFF78000000008h

nt!KiRetireDpcList+0x1a7:
fffff806`3d039957 4180e0df        and     r8b,0DFh
fffff806`3d03995b 49b91400000080f7ffff mov r9,0FFFFF78000000014h

nt!KiRetireDpcList+0x1b5:
fffff806`3d039965 41f6c040        test    r8b,40h
fffff806`3d039969 0f85dab71d00    jne     nt!KiRetireDpcList+0x1db999 (fffff806`3d215149)  Branch

nt!KiRetireDpcList+0x1bf:
fffff806`3d03996f 41f6c03e        test    r8b,3Eh
fffff806`3d039973 0f8597050000    jne     nt!KiRetireDpcList+0x760 (fffff806`3d039f10)  Branch

nt!KiRetireDpcList+0x1c9:
fffff806`3d039979 bb01000000      mov     ebx,1
fffff806`3d03997e 66879f2c310000  xchg    bx,word ptr [rdi+312Ch]
fffff806`3d039985 895c246c        mov     dword ptr [rsp+6Ch],ebx
fffff806`3d039989 f6c308          test    bl,8
fffff806`3d03998c 0f8531010000    jne     nt!KiRetireDpcList+0x313 (fffff806`3d039ac3)  Branch

nt!KiRetireDpcList+0x1e2:
fffff806`3d039992 4533c9          xor     r9d,r9d
fffff806`3d039995 4c8d4540        lea     r8,[rbp+40h]
fffff806`3d039999 488bd6          mov     rdx,rsi
fffff806`3d03999c 488bcf          mov     rcx,rdi
fffff806`3d03999f e80c0a0000      call    nt!KiExecuteAllDpcs (fffff806`3d03a3b0)
fffff806`3d0399a4 f6c304          test    bl,4
fffff806`3d0399a7 0f8567090000    jne     nt!KiRetireDpcList+0xb64 (fffff806`3d03a314)  Branch

nt!KiRetireDpcList+0x1fd: ; update cycle times (branches 
fffff806`3d0399ad 0f31            rdtsc
fffff806`3d0399af 48c1e220        shl     rdx,20h
fffff806`3d0399b3 480bc2          or      rax,rdx
fffff806`3d0399b6 4c8bc0          mov     r8,rax
fffff806`3d0399b9 4c8bc8          mov     r9,rax
fffff806`3d0399bc 4c2b87c07e0000  sub     r8,qword ptr [rdi+7EC0h]
fffff806`3d0399c3 4c0187387f0000  add     qword ptr [rdi+7F38h],r8
fffff806`3d0399ca 0fb64e02        movzx   ecx,byte ptr [rsi+2]
fffff806`3d0399ce f6c120          test    cl,20h
fffff806`3d0399d1 746d            je      nt!KiRetireDpcList+0x290 (fffff806`3d039a40)  Branch

nt!KiRetireDpcList+0x223:
fffff806`3d0399d3 488b9768810000  mov     rdx,qword ptr [rdi+8168h]
fffff806`3d0399da 488b8770810000  mov     rax,qword ptr [rdi+8170h]
fffff806`3d0399e1 4885d2          test    rdx,rdx
fffff806`3d0399e4 0f84dc080000    je      nt!KiRetireDpcList+0xb16 (fffff806`3d03a2c6)  Branch

nt!KiRetireDpcList+0x23a:
fffff806`3d0399ea 4885c0          test    rax,rax
fffff806`3d0399ed 0f84d3080000    je      nt!KiRetireDpcList+0xb16 (fffff806`3d03a2c6)  Branch

nt!KiRetireDpcList+0x243:
fffff806`3d0399f3 80786400        cmp     byte ptr [rax+64h],0
fffff806`3d0399f7 0f85fdbb1d00    jne     nt!KiRetireDpcList+0x1dbe4a (fffff806`3d2155fa)  Branch

nt!KiRetireDpcList+0x24d:
fffff806`3d0399fd 8b4848          mov     ecx,dword ptr [rax+48h]
fffff806`3d039a00 8b8270010000    mov     eax,dword ptr [rdx+170h]
fffff806`3d039a06 3bc8            cmp     ecx,eax
fffff806`3d039a08 7202            jb      nt!KiRetireDpcList+0x25c (fffff806`3d039a0c)  Branch

nt!KiRetireDpcList+0x25a:
fffff806`3d039a0a 8bc8            mov     ecx,eax

nt!KiRetireDpcList+0x25c:
fffff806`3d039a0c 83f94b          cmp     ecx,4Bh
fffff806`3d039a0f 0f82edbb1d00    jb      nt!KiRetireDpcList+0x1dbe52 (fffff806`3d215602)  Branch

nt!KiRetireDpcList+0x265:
fffff806`3d039a15 ba03000000      mov     edx,3

nt!KiRetireDpcList+0x26a:
fffff806`3d039a1a 0fb687b8810000  movzx   eax,byte ptr [rdi+81B8h]
fffff806`3d039a21 8bca            mov     ecx,edx
fffff806`3d039a23 4881c1f4070000  add     rcx,7F4h
fffff806`3d039a2a 488d0c48        lea     rcx,[rax+rcx*2]
fffff806`3d039a2e 488d14cf        lea     rdx,[rdi+rcx*8]
fffff806`3d039a32 488b0ccf        mov     rcx,qword ptr [rdi+rcx*8]
fffff806`3d039a36 4903c8          add     rcx,r8
fffff806`3d039a39 48890a          mov     qword ptr [rdx],rcx
fffff806`3d039a3c 0fb64e02        movzx   ecx,byte ptr [rsi+2]

nt!KiRetireDpcList+0x290:
fffff806`3d039a40 f6c140          test    cl,40h
fffff806`3d039a43 0f85c8bb1d00    jne     nt!KiRetireDpcList+0x1dbe61 (fffff806`3d215611)  Branch

nt!KiRetireDpcList+0x299:
fffff806`3d039a49 4c898fc07e0000  mov     qword ptr [rdi+7EC0h],r9
fffff806`3d039a50 f6460210        test    byte ptr [rsi+2],10h
fffff806`3d039a54 0f85aa080000    jne     nt!KiRetireDpcList+0xb54 (fffff806`3d03a304)  Branch

nt!KiRetireDpcList+0x2aa:
fffff806`3d039a5a f6460202        test    byte ptr [rsi+2],2
fffff806`3d039a5e 0f85c6bb1d00    jne     nt!KiRetireDpcList+0x1dbe7a (fffff806`3d21562a)  Branch

nt!KiRetireDpcList+0x2b4:
fffff806`3d039a64 807f0600        cmp     byte ptr [rdi+6],0
fffff806`3d039a68 c6472000        mov     byte ptr [rdi+20h],0
fffff806`3d039a6c 0f8583060000    jne     nt!KiRetireDpcList+0x945 (fffff806`3d03a0f5)  Branch

nt!KiRetireDpcList+0x2c2:
fffff806`3d039a72 b801000000      mov     eax,1
fffff806`3d039a77 66f0440fb1af2c310000 lock cmpxchg word ptr [rdi+312Ch],r13w
fffff806`3d039a81 6683f801        cmp     ax,1
fffff806`3d039a85 0f8585fdffff    jne     nt!KiRetireDpcList+0x60 (fffff806`3d039810)  Branch

nt!KiRetireDpcList+0x2db:
fffff806`3d039a8b 4c89afe0300000  mov     qword ptr [rdi+30E0h],r13
fffff806`3d039a92 488b8d50010000  mov     rcx,qword ptr [rbp+150h]
fffff806`3d039a99 4833cc          xor     rcx,rsp
fffff806`3d039a9c e87ff81700      call    nt!_security_check_cookie (fffff806`3d1b9320)
fffff806`3d039aa1 4c8d9c2460020000 lea     r11,[rsp+260h]
fffff806`3d039aa9 498b5b38        mov     rbx,qword ptr [r11+38h]
fffff806`3d039aad 498b7340        mov     rsi,qword ptr [r11+40h]
fffff806`3d039ab1 498b7b48        mov     rdi,qword ptr [r11+48h]
fffff806`3d039ab5 498be3          mov     rsp,r11
fffff806`3d039ab8 415f            pop     r15
fffff806`3d039aba 415e            pop     r14
fffff806`3d039abc 415d            pop     r13
fffff806`3d039abe 415c            pop     r12
fffff806`3d039ac0 5d              pop     rbp
fffff806`3d039ac1 c3              ret

nt!KiRetireDpcList+0x313:
fffff806`3d039ac3 b201            mov     dl,1
fffff806`3d039ac5 488bcf          mov     rcx,rdi
fffff806`3d039ac8 e867d6ffff      call    nt!KiSelectActiveTimerTable (fffff806`3d037134)
fffff806`3d039acd 488bd0          mov     rdx,rax
fffff806`3d039ad0 4885c0          test    rax,rax
fffff806`3d039ad3 0f8414bb1d00    je      nt!KiRetireDpcList+0x1dbe3d (fffff806`3d2155ed)  Branch

nt!KiRetireDpcList+0x329:
fffff806`3d039ad9 4d8b3b          mov     r15,qword ptr [r11]
fffff806`3d039adc 4c8b058d28a100  mov     r8,qword ptr [nt!KiLastNonHrTimerExpiration (fffff806`3da4c370)]
fffff806`3d039ae3 448bb010420000  mov     r14d,dword ptr [rax+4210h]
fffff806`3d039aea 4c897c2448      mov     qword ptr [rsp+48h],r15
fffff806`3d039aef 4c3b8008420000  cmp     r8,qword ptr [rax+4208h]
fffff806`3d039af6 0f849c060000    je      nt!KiRetireDpcList+0x9e8 (fffff806`3d03a198)  Branch

nt!KiRetireDpcList+0x34c:
fffff806`3d039afc 41b101          mov     r9b,1

nt!KiRetireDpcList+0x34f:
fffff806`3d039aff 488b0d6228a100  mov     rcx,qword ptr [nt!KiLastPseudoHrTimerExpiration (fffff806`3da4c368)]
fffff806`3d039b06 483b8800420000  cmp     rcx,qword ptr [rax+4200h]
fffff806`3d039b0d 0f848b070000    je      nt!KiRetireDpcList+0xaee (fffff806`3d03a29e)  Branch

nt!KiRetireDpcList+0x363:
fffff806`3d039b13 41b301          mov     r11b,1

nt!KiRetireDpcList+0x366:
fffff806`3d039b16 f7053019ac0000200000 test dword ptr [nt!KiVelocityFlags (fffff806`3dafb450)],2000h
fffff806`3d039b20 4d8be7          mov     r12,r15
fffff806`3d039b23 450fb6d3        movzx   r10d,r11b
fffff806`3d039b27 410fb6c1        movzx   eax,r9b
fffff806`3d039b2b 440f45d0        cmovne  r10d,eax
fffff806`3d039b2f 44885c2430      mov     byte ptr [rsp+30h],r11b
fffff806`3d039b34 49c1ec12        shr     r12,12h
fffff806`3d039b38 4489542450      mov     dword ptr [rsp+50h],r10d
fffff806`3d039b3d 4584db          test    r11b,r11b
fffff806`3d039b40 740e            je      nt!KiRetireDpcList+0x3a0 (fffff806`3d039b50)  Branch

nt!KiRetireDpcList+0x392:
fffff806`3d039b42 48898a00420000  mov     qword ptr [rdx+4200h],rcx
fffff806`3d039b49 4489a210420000  mov     dword ptr [rdx+4210h],r12d

nt!KiRetireDpcList+0x3a0:
fffff806`3d039b50 4584d2          test    r10b,r10b
fffff806`3d039b53 7424            je      nt!KiRetireDpcList+0x3c9 (fffff806`3d039b79)  Branch

nt!KiRetireDpcList+0x3a5:
fffff806`3d039b55 8b8a14420000    mov     ecx,dword ptr [rdx+4214h]
fffff806`3d039b5b 498bc7          mov     rax,r15
fffff806`3d039b5e 48c1e812        shr     rax,12h
fffff806`3d039b62 443bf1          cmp     r14d,ecx
fffff806`3d039b65 4c898208420000  mov     qword ptr [rdx+4208h],r8
fffff806`3d039b6c 898214420000    mov     dword ptr [rdx+4214h],eax
fffff806`3d039b72 410f42ce        cmovb   ecx,r14d
fffff806`3d039b76 448bf1          mov     r14d,ecx

nt!KiRetireDpcList+0x3c9:
fffff806`3d039b79 4584db          test    r11b,r11b
fffff806`3d039b7c 0f8424070000    je      nt!KiRetireDpcList+0xaf6 (fffff806`3d03a2a6)  Branch

nt!KiRetireDpcList+0x3d2:
fffff806`3d039b82 fb              sti
fffff806`3d039b83 48b81400000080f7ffff mov rax,0FFFFF78000000014h
fffff806`3d039b8d 0f57c0          xorps   xmm0,xmm0
fffff806`3d039b90 488b00          mov     rax,qword ptr [rax]
fffff806`3d039b93 833d8a04ac0000  cmp     dword ptr [nt!KiSerializeTimerExpiration (fffff806`3dafa024)],0
fffff806`3d039b9a 48894548        mov     qword ptr [rbp+48h],rax
fffff806`3d039b9e 0f114518        movups  xmmword ptr [rbp+18h],xmm0
fffff806`3d039ba2 0f8582040000    jne     nt!KiRetireDpcList+0x87a (fffff806`3d03a02a)  Branch

nt!KiRetireDpcList+0x3f8:
fffff806`3d039ba8 488bc7          mov     rax,rdi

nt!KiRetireDpcList+0x3fb:
fffff806`3d039bab 480540390000    add     rax,3940h
fffff806`3d039bb1 4889442440      mov     qword ptr [rsp+40h],rax
fffff806`3d039bb6 0f8435020000    je      nt!KiRetireDpcList+0x641 (fffff806`3d039df1)  Branch

nt!KiRetireDpcList+0x40c:
fffff806`3d039bbc 8b8f008b0000    mov     ecx,dword ptr [rdi+8B00h]
fffff806`3d039bc2 8bf1            mov     esi,ecx
fffff806`3d039bc4 48c1e604        shl     rsi,4
fffff806`3d039bc8 4803f7          add     rsi,rdi
fffff806`3d039bcb 8d4101          lea     eax,[rcx+1]
fffff806`3d039bce 83e00f          and     eax,0Fh
fffff806`3d039bd1 8987008b0000    mov     dword ptr [rdi+8B00h],eax
fffff806`3d039bd7 488b3d2a22a100  mov     rdi,qword ptr [nt!HalpPerformanceCounter (fffff806`3da4be08)]
fffff806`3d039bde 4c89be088b0000  mov     qword ptr [rsi+8B08h],r15
fffff806`3d039be5 83bfe400000005  cmp     dword ptr [rdi+0E4h],5
fffff806`3d039bec 0f844e040000    je      nt!KiRetireDpcList+0x890 (fffff806`3d03a040)  Branch

nt!KiRetireDpcList+0x442:
fffff806`3d039bf2 83bfdc00000040  cmp     dword ptr [rdi+0DCh],40h
fffff806`3d039bf9 488b87c0000000  mov     rax,qword ptr [rdi+0C0h]
fffff806`3d039c00 488945a8        mov     qword ptr [rbp-58h],rax
fffff806`3d039c04 0f85d6050000    jne     nt!KiRetireDpcList+0xa30 (fffff806`3d03a1e0)  Branch

nt!KiRetireDpcList+0x45a:
fffff806`3d039c0a 488bcf          mov     rcx,rdi
fffff806`3d039c0d e89ed40800      call    nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
fffff806`3d039c12 488bc8          mov     rcx,rax
fffff806`3d039c15 488b4770        mov     rax,qword ptr [rdi+70h]
fffff806`3d039c19 e8c2ce1a00      call    nt!guard_dispatch_icall (fffff806`3d1e6ae0)
fffff806`3d039c1e 4c8bbfd0000000  mov     r15,qword ptr [rdi+0D0h]
fffff806`3d039c25 488bd0          mov     rdx,rax

nt!KiRetireDpcList+0x478:
fffff806`3d039c28 498d0417        lea     rax,[r15+rdx]

nt!KiRetireDpcList+0x47c:
fffff806`3d039c2c 4c8b7c2448      mov     r15,qword ptr [rsp+48h]

nt!KiRetireDpcList+0x481:
fffff806`3d039c31 488b0dc821a100  mov     rcx,qword ptr [nt!HalpOriginalPerformanceCounter (fffff806`3da4be00)]
fffff806`3d039c38 483bf9          cmp     rdi,rcx
fffff806`3d039c3b 0f8569050000    jne     nt!KiRetireDpcList+0x9fa (fffff806`3d03a1aa)  Branch

nt!KiRetireDpcList+0x491:
fffff806`3d039c41 488986108b0000  mov     qword ptr [rsi+8B10h],rax
fffff806`3d039c48 f7053618ac0000000200 test dword ptr [nt!PerfGlobalGroupMask+0x8 (fffff806`3dafb488)],20000h
fffff806`3d039c52 0f85f3b61d00    jne     nt!KiRetireDpcList+0x1dbb9b (fffff806`3d21534b)  Branch

nt!KiRetireDpcList+0x4a8:
fffff806`3d039c58 418bcc          mov     ecx,r12d
fffff806`3d039c5b 4d8bdd          mov     r11,r13
fffff806`3d039c5e 412bce          sub     ecx,r14d
fffff806`3d039c61 ffc1            inc     ecx
fffff806`3d039c63 894c2478        mov     dword ptr [rsp+78h],ecx
fffff806`3d039c67 81f900010000    cmp     ecx,100h
fffff806`3d039c6d 0f8718b71d00    ja      nt!KiRetireDpcList+0x1dbbdb (fffff806`3d21538b)  Branch

nt!KiRetireDpcList+0x4c3:
fffff806`3d039c73 b800010000      mov     eax,100h
fffff806`3d039c78 894c2468        mov     dword ptr [rsp+68h],ecx
fffff806`3d039c7c 2bc1            sub     eax,ecx
fffff806`3d039c7e 4c897c2458      mov     qword ptr [rsp+58h],r15
fffff806`3d039c83 4d8bdf          mov     r11,r15
fffff806`3d039c86 83f818          cmp     eax,18h
fffff806`3d039c89 7605            jbe     nt!KiRetireDpcList+0x4e0 (fffff806`3d039c90)  Branch

nt!KiRetireDpcList+0x4db:
fffff806`3d039c8b b818000000      mov     eax,18h

nt!KiRetireDpcList+0x4e0:
fffff806`3d039c90 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff806`3d039c95 33c9            xor     ecx,ecx
fffff806`3d039c97 48894dc8        mov     qword ptr [rbp-38h],rcx
fffff806`3d039c9b 33f6            xor     esi,esi
fffff806`3d039c9d 8b4c2468        mov     ecx,dword ptr [rsp+68h]
fffff806`3d039ca1 0f57c0          xorps   xmm0,xmm0
fffff806`3d039ca4 4103ce          add     ecx,r14d
fffff806`3d039ca7 4c896d80        mov     qword ptr [rbp-80h],r13
fffff806`3d039cab 41ffce          dec     r14d
fffff806`3d039cae 894d98          mov     dword ptr [rbp-68h],ecx
fffff806`3d039cb1 4533c9          xor     r9d,r9d
fffff806`3d039cb4 418bde          mov     ebx,r14d
fffff806`3d039cb7 0f1145b8        movups  xmmword ptr [rbp-48h],xmm0
fffff806`3d039cbb 448d41ff        lea     r8d,[rcx-1]
fffff806`3d039cbf 44894c2434      mov     dword ptr [rsp+34h],r9d
fffff806`3d039cc4 4489442438      mov     dword ptr [rsp+38h],r8d
fffff806`3d039cc9 458d2c00        lea     r13d,[r8+rax]
fffff806`3d039ccd c645bbc0        mov     byte ptr [rbp-45h],0C0h

nt!KiRetireDpcList+0x521:
fffff806`3d039cd1 ffc3            inc     ebx
fffff806`3d039cd3 440fb6e3        movzx   r12d,bl
fffff806`3d039cd7 4d8d7c2410      lea     r15,[r12+10h]
fffff806`3d039cdc 49c1e705        shl     r15,5
fffff806`3d039ce0 4d03fa          add     r15,r10
fffff806`3d039ce3 413bf0          cmp     esi,r8d
fffff806`3d039ce6 0f87d6b61d00    ja      nt!KiRetireDpcList+0x1dbc12 (fffff806`3d2153c2)  Branch

nt!KiRetireDpcList+0x53c:
fffff806`3d039cec 498d7f08        lea     rdi,[r15+8]
fffff806`3d039cf0 483b3f          cmp     rdi,qword ptr [rdi]
fffff806`3d039cf3 0f8577020000    jne     nt!KiRetireDpcList+0x7c0 (fffff806`3d039f70)  Branch

nt!KiRetireDpcList+0x549:
fffff806`3d039cf9 ffc6            inc     esi

nt!KiRetireDpcList+0x54b:
fffff806`3d039cfb 413bdd          cmp     ebx,r13d
fffff806`3d039cfe 75d1            jne     nt!KiRetireDpcList+0x521 (fffff806`3d039cd1)  Branch

nt!KiRetireDpcList+0x550:
fffff806`3d039d00 4585c9          test    r9d,r9d
fffff806`3d039d03 0f856f040000    jne     nt!KiRetireDpcList+0x9c8 (fffff806`3d03a178)  Branch

nt!KiRetireDpcList+0x559:
fffff806`3d039d09 807c245000      cmp     byte ptr [rsp+50h],0
fffff806`3d039d0e 0f848c040000    je      nt!KiRetireDpcList+0x9f0 (fffff806`3d03a1a0)  Branch

nt!KiRetireDpcList+0x564:
fffff806`3d039d14 33c0            xor     eax,eax
fffff806`3d039d16 48c7458800000000 mov     qword ptr [rbp-78h],0
fffff806`3d039d1e 33ff            xor     edi,edi
fffff806`3d039d20 488945e0        mov     qword ptr [rbp-20h],rax
fffff806`3d039d24 0f57c0          xorps   xmm0,xmm0
fffff806`3d039d27 33d2            xor     edx,edx
fffff806`3d039d29 0f1145d0        movups  xmmword ptr [rbp-30h],xmm0
fffff806`3d039d2d 89542434        mov     dword ptr [rsp+34h],edx
fffff806`3d039d31 c645d3c0        mov     byte ptr [rbp-2Dh],0C0h
fffff806`3d039d35 6666660f1f840000000000 nop word ptr [rax+rax]

nt!KiRetireDpcList+0x590:
fffff806`3d039d40 41ffc6          inc     r14d
fffff806`3d039d43 450fb6fe        movzx   r15d,r14b
fffff806`3d039d47 498db710010000  lea     rsi,[r15+110h]
fffff806`3d039d4e 48c1e605        shl     rsi,5
fffff806`3d039d52 4903f2          add     rsi,r10
fffff806`3d039d55 413bf8          cmp     edi,r8d
fffff806`3d039d58 0f877ab71d00    ja      nt!KiRetireDpcList+0x1dbd28 (fffff806`3d2154d8)  Branch

nt!KiRetireDpcList+0x5ae:
fffff806`3d039d5e 488d5e08        lea     rbx,[rsi+8]
fffff806`3d039d62 483b1b          cmp     rbx,qword ptr [rbx]
fffff806`3d039d65 0f85a5000000    jne     nt!KiRetireDpcList+0x660 (fffff806`3d039e10)  Branch

nt!KiRetireDpcList+0x5bb:
fffff806`3d039d6b ffc7            inc     edi

nt!KiRetireDpcList+0x5bd:
fffff806`3d039d6d 453bf5          cmp     r14d,r13d
fffff806`3d039d70 75ce            jne     nt!KiRetireDpcList+0x590 (fffff806`3d039d40)  Branch

nt!KiRetireDpcList+0x5c2:
fffff806`3d039d72 488b7c2470      mov     rdi,qword ptr [rsp+70h]
fffff806`3d039d77 85d2            test    edx,edx
fffff806`3d039d79 7412            je      nt!KiRetireDpcList+0x5dd (fffff806`3d039d8d)  Branch

nt!KiRetireDpcList+0x5cb:
fffff806`3d039d7b 448bca          mov     r9d,edx
fffff806`3d039d7e 4d8bc2          mov     r8,r10
fffff806`3d039d81 488d5540        lea     rdx,[rbp+40h]
fffff806`3d039d85 488bcf          mov     rcx,rdi
fffff806`3d039d88 e8f3c9ffff      call    nt!KiProcessExpiredTimerList (fffff806`3d036780)

nt!KiRetireDpcList+0x5dd:
fffff806`3d039d8d 8b4c2478        mov     ecx,dword ptr [rsp+78h]
fffff806`3d039d91 41bd00000000    mov     r13d,0
fffff806`3d039d97 2b4c2468        sub     ecx,dword ptr [rsp+68h]
fffff806`3d039d9b 448b7598        mov     r14d,dword ptr [rbp-68h]
fffff806`3d039d9f 4c8b5c2458      mov     r11,qword ptr [rsp+58h]
fffff806`3d039da4 4c8b7c2448      mov     r15,qword ptr [rsp+48h]
fffff806`3d039da9 894c2478        mov     dword ptr [rsp+78h],ecx
fffff806`3d039dad 0f85e7b51d00    jne     nt!KiRetireDpcList+0x1dbbea (fffff806`3d21539a)  Branch

nt!KiRetireDpcList+0x603:
fffff806`3d039db3 f6872c31000008  test    byte ptr [rdi+312Ch],8
fffff806`3d039dba 488b75a0        mov     rsi,qword ptr [rbp-60h]
fffff806`3d039dbe 8b5c246c        mov     ebx,dword ptr [rsp+6Ch]
fffff806`3d039dc2 448b542450      mov     r10d,dword ptr [rsp+50h]
fffff806`3d039dc7 440fb65c2430    movzx   r11d,byte ptr [rsp+30h]
fffff806`3d039dcd 7522            jne     nt!KiRetireDpcList+0x641 (fffff806`3d039df1)  Branch

nt!KiRetireDpcList+0x61f:
fffff806`3d039dcf 8b87a87e0000    mov     eax,dword ptr [rdi+7EA8h]
fffff806`3d039dd5 4489afa47e0000  mov     dword ptr [rdi+7EA4h],r13d
fffff806`3d039ddc 8b0d8616ac00    mov     ecx,dword ptr [nt!KeTimeIncrement (fffff806`3dafb468)]
fffff806`3d039de2 3bc1            cmp     eax,ecx
fffff806`3d039de4 0f83f6b71d00    jae     nt!KiRetireDpcList+0x1dbe30 (fffff806`3d2155e0)  Branch

nt!KiRetireDpcList+0x63a:
fffff806`3d039dea 4489afa87e0000  mov     dword ptr [rdi+7EA8h],r13d

nt!KiRetireDpcList+0x641:
fffff806`3d039df1 807f2100        cmp     byte ptr [rdi+21h],0
fffff806`3d039df5 0f850d020000    jne     nt!KiRetireDpcList+0x858 (fffff806`3d03a008)  Branch

nt!KiRetireDpcList+0x64b:
fffff806`3d039dfb fa              cli
fffff806`3d039dfc e991fbffff      jmp     nt!KiRetireDpcList+0x1e2 (fffff806`3d039992)  Branch

nt!KiRetireDpcList+0x660:
fffff806`3d039e10 654c8b242520000000 mov   r12,qword ptr gs:[20h]
fffff806`3d039e19 c7459400000000  mov     dword ptr [rbp-6Ch],0
fffff806`3d039e20 498b8c24b8840000 mov     rcx,qword ptr [r12+84B8h]
fffff806`3d039e28 4885c9          test    rcx,rcx
fffff806`3d039e2b 0f85bbb61d00    jne     nt!KiRetireDpcList+0x1dbd3c (fffff806`3d2154ec)  Branch

nt!KiRetireDpcList+0x681: ; Attempt to lock DPC. 
fffff806`3d039e31 f0480fba2e00    lock bts qword ptr [rsi],0
fffff806`3d039e37 0f82f9040000    jb      nt!KiRetireDpcList+0xb86 (fffff806`3d03a336)  Branch

nt!KiRetireDpcList+0x68d:
fffff806`3d039e3d 8b542434        mov     edx,dword ptr [rsp+34h]
fffff806`3d039e41 48897588        mov     qword ptr [rbp-78h],rsi

nt!KiRetireDpcList+0x695:
fffff806`3d039e45 488b03          mov     rax,qword ptr [rbx]
fffff806`3d039e48 483bd8          cmp     rbx,rax
fffff806`3d039e4b 7413            je      nt!KiRetireDpcList+0x6b0 (fffff806`3d039e60)  Branch

nt!KiRetireDpcList+0x69d:
fffff806`3d039e4d 4c8d60e0        lea     r12,[rax-20h]
fffff806`3d039e51 488b40f8        mov     rax,qword ptr [rax-8]
fffff806`3d039e55 483b442458      cmp     rax,qword ptr [rsp+58h]
fffff806`3d039e5a 7639            jbe     nt!KiRetireDpcList+0x6e5 (fffff806`3d039e95)  Branch

nt!KiRetireDpcList+0x6ac:
fffff806`3d039e5c 48894618        mov     qword ptr [rsi+18h],rax

nt!KiRetireDpcList+0x6b0:
fffff806`3d039e60 488b4588        mov     rax,qword ptr [rbp-78h]
fffff806`3d039e64 f048832000      lock and qword ptr [rax],0
fffff806`3d039e69 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff806`3d039e72 488b91b8840000  mov     rdx,qword ptr [rcx+84B8h]
fffff806`3d039e79 4885d2          test    rdx,rdx
fffff806`3d039e7c 0f853ab71d00    jne     nt!KiRetireDpcList+0x1dbe0c (fffff806`3d2155bc)  Branch

nt!KiRetireDpcList+0x6d2:
fffff806`3d039e82 8b542434        mov     edx,dword ptr [rsp+34h]

nt!KiRetireDpcList+0x6d6:
fffff806`3d039e86 448b442438      mov     r8d,dword ptr [rsp+38h]
fffff806`3d039e8b 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff806`3d039e90 e9d6feffff      jmp     nt!KiRetireDpcList+0x5bb (fffff806`3d039d6b)  Branch

nt!KiRetireDpcList+0x6e5:
fffff806`3d039e95 0fb64dd3        movzx   ecx,byte ptr [rbp-2Dh]
fffff806`3d039e99 0fb6c2          movzx   eax,dl
fffff806`3d039e9c 32c1            xor     al,cl
fffff806`3d039e9e 0f57c0          xorps   xmm0,xmm0
fffff806`3d039ea1 243f            and     al,3Fh
fffff806`3d039ea3 32c8            xor     cl,al
fffff806`3d039ea5 33c0            xor     eax,eax
fffff806`3d039ea7 48894510        mov     qword ptr [rbp+10h],rax
fffff806`3d039eab 410fb6442403    movzx   eax,byte ptr [r12+3]
fffff806`3d039eb1 32c1            xor     al,cl
fffff806`3d039eb3 884dd3          mov     byte ptr [rbp-2Dh],cl
fffff806`3d039eb6 0f114500        movups  xmmword ptr [rbp],xmm0
fffff806`3d039eba 884503          mov     byte ptr [rbp+3],al
fffff806`3d039ebd 8b4500          mov     eax,dword ptr [rbp]
fffff806`3d039ec0 f041310424      lock xor dword ptr [r12],eax
fffff806`3d039ec5 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff806`3d039eca 4c8d4d88        lea     r9,[rbp-78h]
fffff806`3d039ece 8bc2            mov     eax,edx
fffff806`3d039ed0 498bcc          mov     rcx,r12
fffff806`3d039ed3 458bc7          mov     r8d,r15d
fffff806`3d039ed6 498bd4          mov     rdx,r12
fffff806`3d039ed9 49870cc2        xchg    rcx,qword ptr [r10+rax*8]
fffff806`3d039edd 48894c2460      mov     qword ptr [rsp+60h],rcx
fffff806`3d039ee2 498bca          mov     rcx,r10
fffff806`3d039ee5 e866d9ffff      call    nt!KiRemoveEntryTimer (fffff806`3d037850)
fffff806`3d039eea 8b542434        mov     edx,dword ptr [rsp+34h]
fffff806`3d039eee 488b442460      mov     rax,qword ptr [rsp+60h]
fffff806`3d039ef3 ffc2            inc     edx
fffff806`3d039ef5 89542434        mov     dword ptr [rsp+34h],edx
fffff806`3d039ef9 4885c0          test    rax,rax
fffff806`3d039efc 0f8555b71d00    jne     nt!KiRetireDpcList+0x1dbea7 (fffff806`3d215657)  Branch

nt!KiRetireDpcList+0x752:
fffff806`3d039f02 83fa40          cmp     edx,40h
fffff806`3d039f05 0f853affffff    jne     nt!KiRetireDpcList+0x695 (fffff806`3d039e45)  Branch

nt!KiRetireDpcList+0x75b:
fffff806`3d039f0b e94bb61d00      jmp     nt!KiRetireDpcList+0x1dbdab (fffff806`3d21555b)  Branch

nt!KiRetireDpcList+0x760:
fffff806`3d039f10 488b4e68        mov     rcx,qword ptr [rsi+68h]
fffff806`3d039f14 4885c9          test    rcx,rcx
fffff806`3d039f17 0f85b1010000    jne     nt!KiRetireDpcList+0x91e (fffff806`3d03a0ce)  Branch

nt!KiRetireDpcList+0x76d:
fffff806`3d039f1d f6460208        test    byte ptr [rsi+2],8
fffff806`3d039f21 7427            je      nt!KiRetireDpcList+0x79a (fffff806`3d039f4a)  Branch

nt!KiRetireDpcList+0x773:
fffff806`3d039f23 488b87c0000000  mov     rax,qword ptr [rdi+0C0h]
fffff806`3d039f2a 488b8e40020000  mov     rcx,qword ptr [rsi+240h]
fffff806`3d039f31 488b9088000000  mov     rdx,qword ptr [rax+88h]
fffff806`3d039f38 488bc2          mov     rax,rdx
fffff806`3d039f3b 4823c1          and     rax,rcx
fffff806`3d039f3e 483bc2          cmp     rax,rdx
fffff806`3d039f41 7407            je      nt!KiRetireDpcList+0x79a (fffff806`3d039f4a)  Branch

nt!KiRetireDpcList+0x793:
fffff806`3d039f43 4c0197e87e0000  add     qword ptr [rdi+7EE8h],r10

nt!KiRetireDpcList+0x79a:
fffff806`3d039f4a 807e7d00        cmp     byte ptr [rsi+7Dh],0
fffff806`3d039f4e 0f850eb21d00    jne     nt!KiRetireDpcList+0x1db9b2 (fffff806`3d215162)  Branch

nt!KiRetireDpcList+0x7a4:
fffff806`3d039f54 488b8668010000  mov     rax,qword ptr [rsi+168h]
fffff806`3d039f5b 4885c0          test    rax,rax
fffff806`3d039f5e 0f8415faffff    je      nt!KiRetireDpcList+0x1c9 (fffff806`3d039979)  Branch

nt!KiRetireDpcList+0x7b4:
fffff806`3d039f64 e91bb21d00      jmp     nt!KiRetireDpcList+0x1db9d4 (fffff806`3d215184)  Branch

nt!KiRetireDpcList+0x7c0:
fffff806`3d039f70 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff806`3d039f79 4889442460      mov     qword ptr [rsp+60h],rax
fffff806`3d039f7e c7459000000000  mov     dword ptr [rbp-70h],0
fffff806`3d039f85 488b88b8840000  mov     rcx,qword ptr [rax+84B8h]
fffff806`3d039f8c 4885c9          test    rcx,rcx
fffff806`3d039f8f 0f853cb41d00    jne     nt!KiRetireDpcList+0x1dbc21 (fffff806`3d2153d1)  Branch

nt!KiRetireDpcList+0x7e5:
fffff806`3d039f95 488bf8          mov     rdi,rax

nt!KiRetireDpcList+0x7e8:
fffff806`3d039f98 f0490fba2f00    lock bts qword ptr [r15],0
fffff806`3d039f9e 0f82ca030000    jb      nt!KiRetireDpcList+0xbbe (fffff806`3d03a36e)  Branch

nt!KiRetireDpcList+0x7f4:
fffff806`3d039fa4 448b4c2434      mov     r9d,dword ptr [rsp+34h]
fffff806`3d039fa9 498d7f08        lea     rdi,[r15+8]
fffff806`3d039fad 4c897d80        mov     qword ptr [rbp-80h],r15

nt!KiRetireDpcList+0x801:
fffff806`3d039fb1 488b07          mov     rax,qword ptr [rdi]
fffff806`3d039fb4 4c8b5c2458      mov     r11,qword ptr [rsp+58h]
fffff806`3d039fb9 483bf8          cmp     rdi,rax
fffff806`3d039fbc 7419            je      nt!KiRetireDpcList+0x827 (fffff806`3d039fd7)  Branch

nt!KiRetireDpcList+0x80e:
fffff806`3d039fbe 488d50e0        lea     rdx,[rax-20h]
fffff806`3d039fc2 488b40f8        mov     rax,qword ptr [rax-8]
fffff806`3d039fc6 488955b0        mov     qword ptr [rbp-50h],rdx
fffff806`3d039fca 493bc3          cmp     rax,r11
fffff806`3d039fcd 0f862b010000    jbe     nt!KiRetireDpcList+0x94e (fffff806`3d03a0fe)  Branch

nt!KiRetireDpcList+0x823:
fffff806`3d039fd3 49894718        mov     qword ptr [r15+18h],rax

nt!KiRetireDpcList+0x827:
fffff806`3d039fd7 488b4580        mov     rax,qword ptr [rbp-80h]
fffff806`3d039fdb f048832000      lock and qword ptr [rax],0
fffff806`3d039fe0 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff806`3d039fe9 488b91b8840000  mov     rdx,qword ptr [rcx+84B8h]
fffff806`3d039ff0 4885d2          test    rdx,rdx
fffff806`3d039ff3 0f85b2b41d00    jne     nt!KiRetireDpcList+0x1dbcfb (fffff806`3d2154ab)  Branch

nt!KiRetireDpcList+0x849:
fffff806`3d039ff9 448b442438      mov     r8d,dword ptr [rsp+38h]
fffff806`3d039ffe 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff806`3d03a003 e9f1fcffff      jmp     nt!KiRetireDpcList+0x549 (fffff806`3d039cf9)  Branch

nt!KiRetireDpcList+0x858:
fffff806`3d03a008 488d4540        lea     rax,[rbp+40h]
fffff806`3d03a00c 450fb6ca        movzx   r9d,r10b
fffff806`3d03a010 450fb6c3        movzx   r8d,r11b
fffff806`3d03a014 4889442420      mov     qword ptr [rsp+20h],rax
fffff806`3d03a019 498bd7          mov     rdx,r15
fffff806`3d03a01c 488bcf          mov     rcx,rdi
fffff806`3d03a01f e85c6dffff      call    nt!KiTimer2Expiration (fffff806`3d030d80)
fffff806`3d03a024 fa              cli
fffff806`3d03a025 e968f9ffff      jmp     nt!KiRetireDpcList+0x1e2 (fffff806`3d039992)  Branch

nt!KiRetireDpcList+0x87a:
fffff806`3d03a02a 807f2100        cmp     byte ptr [rdi+21h],0
fffff806`3d03a02e 0f84c7fdffff    je      nt!KiRetireDpcList+0x64b (fffff806`3d039dfb)  Branch

nt!KiRetireDpcList+0x884:
fffff806`3d03a034 488b05452cac00  mov     rax,qword ptr [nt!KiProcessorBlock (fffff806`3dafcc80)]
fffff806`3d03a03b e96bfbffff      jmp     nt!KiRetireDpcList+0x3fb (fffff806`3d039bab)  Branch

nt!KiRetireDpcList+0x890:
fffff806`3d03a040 48833dd01ea10000 cmp     qword ptr [nt!HalpTimerReferencePage (fffff806`3da4bf18)],0
fffff806`3d03a048 48c745a880969800 mov     qword ptr [rbp-58h],989680h
fffff806`3d03a050 0f84a0b11d00    je      nt!KiRetireDpcList+0x1dba46 (fffff806`3d2151f6)  Branch

nt!KiRetireDpcList+0x8a6:
fffff806`3d03a056 488bcf          mov     rcx,rdi
fffff806`3d03a059 e852d00800      call    nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
fffff806`3d03a05e 488bc8          mov     rcx,rax
fffff806`3d03a061 488b4770        mov     rax,qword ptr [rdi+70h]
fffff806`3d03a065 e876ca1a00      call    nt!guard_dispatch_icall (fffff806`3d1e6ae0)
fffff806`3d03a06a 488bc8          mov     rcx,rax
fffff806`3d03a06d 48bab803000080f7ffff mov rdx,0FFFFF780000003B8h
fffff806`3d03a077 488b059a1ea100  mov     rax,qword ptr [nt!HalpTimerReferencePage (fffff806`3da4bf18)]
fffff806`3d03a07e 488b4008        mov     rax,qword ptr [rax+8]
fffff806`3d03a082 4c8b02          mov     r8,qword ptr [rdx]
fffff806`3d03a085 48f7e1          mul     rax,rcx
fffff806`3d03a088 498d0410        lea     rax,[r8+rdx]
fffff806`3d03a08c e9a0fbffff      jmp     nt!KiRetireDpcList+0x481 (fffff806`3d039c31)  Branch

nt!KiRetireDpcList+0x8e1:
fffff806`3d03a091 498d4308        lea     rax,[r11+8]
fffff806`3d03a095 488d0443        lea     rax,[rbx+rax*2]
fffff806`3d03a099 498b0cc1        mov     rcx,qword ptr [r9+rax*8]
fffff806`3d03a09d 498d14c1        lea     rdx,[r9+rax*8]
fffff806`3d03a0a1 4903ca          add     rcx,r10
fffff806`3d03a0a4 48890a          mov     qword ptr [rdx],rcx
fffff806`3d03a0a7 4983c304        add     r11,4
fffff806`3d03a0ab 488b86c0050000  mov     rax,qword ptr [rsi+5C0h]
fffff806`3d03a0b2 4a8d0c5b        lea     rcx,[rbx+r11*2]
fffff806`3d03a0b6 488b80f8050000  mov     rax,qword ptr [rax+5F8h]
fffff806`3d03a0bd 488d14c8        lea     rdx,[rax+rcx*8]
fffff806`3d03a0c1 498bc2          mov     rax,r10
fffff806`3d03a0c4 f0480fc102      lock xadd qword ptr [rdx],rax
fffff806`3d03a0c9 e97ff8ffff      jmp     nt!KiRetireDpcList+0x19d (fffff806`3d03994d)  Branch

nt!KiRetireDpcList+0x91e:
fffff806`3d03a0ce 8b87d8000000    mov     eax,dword ptr [rdi+0D8h]
fffff806`3d03a0d4 4803c8          add     rcx,rax
fffff806`3d03a0d7 4885c9          test    rcx,rcx
fffff806`3d03a0da 0f843dfeffff    je      nt!KiRetireDpcList+0x76d (fffff806`3d039f1d)  Branch

nt!KiRetireDpcList+0x930:
fffff806`3d03a0e0 4c0111          add     qword ptr [rcx],r10
fffff806`3d03a0e3 488b8998010000  mov     rcx,qword ptr [rcx+198h]
fffff806`3d03a0ea 4885c9          test    rcx,rcx
fffff806`3d03a0ed 0f842afeffff    je      nt!KiRetireDpcList+0x76d (fffff806`3d039f1d)  Branch

nt!KiRetireDpcList+0x943:
fffff806`3d03a0f3 ebeb            jmp     nt!KiRetireDpcList+0x930 (fffff806`3d03a0e0)  Branch

nt!KiRetireDpcList+0x945:
fffff806`3d03a0f5 c6470600        mov     byte ptr [rdi+6],0
fffff806`3d03a0f9 e974f9ffff      jmp     nt!KiRetireDpcList+0x2c2 (fffff806`3d039a72)  Branch

nt!KiRetireDpcList+0x94e:
fffff806`3d03a0fe 0fb64dbb        movzx   ecx,byte ptr [rbp-45h]
fffff806`3d03a102 410fb6c1        movzx   eax,r9b
fffff806`3d03a106 32c1            xor     al,cl
fffff806`3d03a108 0f57c0          xorps   xmm0,xmm0
fffff806`3d03a10b 243f            and     al,3Fh
fffff806`3d03a10d 32c8            xor     cl,al
fffff806`3d03a10f 33c0            xor     eax,eax
fffff806`3d03a111 488945f8        mov     qword ptr [rbp-8],rax
fffff806`3d03a115 0fb64203        movzx   eax,byte ptr [rdx+3]
fffff806`3d03a119 32c1            xor     al,cl
fffff806`3d03a11b 884dbb          mov     byte ptr [rbp-45h],cl
fffff806`3d03a11e 0f1145e8        movups  xmmword ptr [rbp-18h],xmm0
fffff806`3d03a122 8845eb          mov     byte ptr [rbp-15h],al
fffff806`3d03a125 8b45e8          mov     eax,dword ptr [rbp-18h]
fffff806`3d03a128 f03102          lock xor dword ptr [rdx],eax
fffff806`3d03a12b 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff806`3d03a130 488bca          mov     rcx,rdx
fffff806`3d03a133 418bc1          mov     eax,r9d
fffff806`3d03a136 458bc4          mov     r8d,r12d
fffff806`3d03a139 4c8d4d80        lea     r9,[rbp-80h]
fffff806`3d03a13d 49870cc2        xchg    rcx,qword ptr [r10+rax*8]
fffff806`3d03a141 48894c2460      mov     qword ptr [rsp+60h],rcx
fffff806`3d03a146 498bca          mov     rcx,r10
fffff806`3d03a149 e802d7ffff      call    nt!KiRemoveEntryTimer (fffff806`3d037850)
fffff806`3d03a14e 448b4c2434      mov     r9d,dword ptr [rsp+34h]
fffff806`3d03a153 488b442460      mov     rax,qword ptr [rsp+60h]
fffff806`3d03a158 41ffc1          inc     r9d
fffff806`3d03a15b 44894c2434      mov     dword ptr [rsp+34h],r9d
fffff806`3d03a160 4885c0          test    rax,rax
fffff806`3d03a163 0f85d1b41d00    jne     nt!KiRetireDpcList+0x1dbe8a (fffff806`3d21563a)  Branch

nt!KiRetireDpcList+0x9b9:
fffff806`3d03a169 4183f940        cmp     r9d,40h
fffff806`3d03a16d 0f853efeffff    jne     nt!KiRetireDpcList+0x801 (fffff806`3d039fb1)  Branch

nt!KiRetireDpcList+0x9c3:
fffff806`3d03a173 e9d3b21d00      jmp     nt!KiRetireDpcList+0x1dbc9b (fffff806`3d21544b)  Branch

nt!KiRetireDpcList+0x9c8:
fffff806`3d03a178 488b4c2470      mov     rcx,qword ptr [rsp+70h]
fffff806`3d03a17d 488d5540        lea     rdx,[rbp+40h]
fffff806`3d03a181 4d8bc2          mov     r8,r10
fffff806`3d03a184 e8f7c5ffff      call    nt!KiProcessExpiredTimerList (fffff806`3d036780)
fffff806`3d03a189 448b442438      mov     r8d,dword ptr [rsp+38h]
fffff806`3d03a18e 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff806`3d03a193 e971fbffff      jmp     nt!KiRetireDpcList+0x559 (fffff806`3d039d09)  Branch

nt!KiRetireDpcList+0x9e8:
fffff806`3d03a198 4532c9          xor     r9b,r9b
fffff806`3d03a19b e95ff9ffff      jmp     nt!KiRetireDpcList+0x34f (fffff806`3d039aff)  Branch

nt!KiRetireDpcList+0x9f0:
fffff806`3d03a1a0 488b7c2470      mov     rdi,qword ptr [rsp+70h]
fffff806`3d03a1a5 e9e3fbffff      jmp     nt!KiRetireDpcList+0x5dd (fffff806`3d039d8d)  Branch

nt!KiRetireDpcList+0x9fa:
fffff806`3d03a1aa 4885c9          test    rcx,rcx
fffff806`3d03a1ad 0f848efaffff    je      nt!KiRetireDpcList+0x491 (fffff806`3d039c41)  Branch

nt!KiRetireDpcList+0xa03:
fffff806`3d03a1b3 83b9e400000005  cmp     dword ptr [rcx+0E4h],5
fffff806`3d03a1ba 4c8b81c0000000  mov     r8,qword ptr [rcx+0C0h]
fffff806`3d03a1c1 7506            jne     nt!KiRetireDpcList+0xa19 (fffff806`3d03a1c9)  Branch

nt!KiRetireDpcList+0xa13:
fffff806`3d03a1c3 41b880969800    mov     r8d,989680h

nt!KiRetireDpcList+0xa19:
fffff806`3d03a1c9 488b55a8        mov     rdx,qword ptr [rbp-58h]
fffff806`3d03a1cd 488bc8          mov     rcx,rax
fffff806`3d03a1d0 e85b691400      call    nt!HalpTimerScaleCounter (fffff806`3d180b30)
fffff806`3d03a1d5 e967faffff      jmp     nt!KiRetireDpcList+0x491 (fffff806`3d039c41)  Branch

nt!KiRetireDpcList+0xa30:
fffff806`3d03a1e0 4c8bbfd0000000  mov     r15,qword ptr [rdi+0D0h]

nt!KiRetireDpcList+0xa37:
fffff806`3d03a1e7 488b9fc8000000  mov     rbx,qword ptr [rdi+0C8h]
fffff806`3d03a1ee 488bcf          mov     rcx,rdi
fffff806`3d03a1f1 e8bace0800      call    nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
fffff806`3d03a1f6 488bc8          mov     rcx,rax
fffff806`3d03a1f9 488b4770        mov     rax,qword ptr [rdi+70h]
fffff806`3d03a1fd e8dec81a00      call    nt!guard_dispatch_icall (fffff806`3d1e6ae0)
fffff806`3d03a202 4c8bc8          mov     r9,rax
fffff806`3d03a205 f0830c2400      lock or dword ptr [rsp],0
fffff806`3d03a20a 488b87c8000000  mov     rax,qword ptr [rdi+0C8h]
fffff806`3d03a211 483bd8          cmp     rbx,rax
fffff806`3d03a214 75d1            jne     nt!KiRetireDpcList+0xa37 (fffff806`3d03a1e7)  Branch

nt!KiRetireDpcList+0xa66:
fffff806`3d03a216 488b8fd0000000  mov     rcx,qword ptr [rdi+0D0h]
fffff806`3d03a21d 4c3bf9          cmp     r15,rcx
fffff806`3d03a220 75be            jne     nt!KiRetireDpcList+0xa30 (fffff806`3d03a1e0)  Branch

nt!KiRetireDpcList+0xa72:
fffff806`3d03a222 448b87dc000000  mov     r8d,dword ptr [rdi+0DCh]
fffff806`3d03a229 ba01000000      mov     edx,1
fffff806`3d03a22e 418d48ff        lea     ecx,[r8-1]
fffff806`3d03a232 48d3e2          shl     rdx,cl
fffff806`3d03a235 498bc9          mov     rcx,r9
fffff806`3d03a238 4833cb          xor     rcx,rbx
fffff806`3d03a23b 4885ca          test    rdx,rcx
fffff806`3d03a23e 0f85bcb01d00    jne     nt!KiRetireDpcList+0x1dbb50 (fffff806`3d215300)  Branch

nt!KiRetireDpcList+0xa94:
fffff806`3d03a244 4183f840        cmp     r8d,40h
fffff806`3d03a248 0f84f1b01d00    je      nt!KiRetireDpcList+0x1dbb8f (fffff806`3d21533f)  Branch

nt!KiRetireDpcList+0xa9e:
fffff806`3d03a24e 418bc8          mov     ecx,r8d
fffff806`3d03a251 ba01000000      mov     edx,1
fffff806`3d03a256 48d3e2          shl     rdx,cl
fffff806`3d03a259 48ffca          dec     rdx

nt!KiRetireDpcList+0xaac:
fffff806`3d03a25c 48f7d2          not     rdx
fffff806`3d03a25f 4823d3          and     rdx,rbx
fffff806`3d03a262 490bd1          or      rdx,r9
fffff806`3d03a265 e9bef9ffff      jmp     nt!KiRetireDpcList+0x478 (fffff806`3d039c28)  Branch

nt!KiRetireDpcList+0xaba:
fffff806`3d03a26a 8bd0            mov     edx,eax
fffff806`3d03a26c 89442448        mov     dword ptr [rsp+48h],eax
fffff806`3d03a270 2bd1            sub     edx,ecx
fffff806`3d03a272 83fa20          cmp     edx,20h
fffff806`3d03a275 0f83ae000000    jae     nt!KiRetireDpcList+0xb79 (fffff806`3d03a329)  Branch

nt!KiRetireDpcList+0xacb:
fffff806`3d03a27b 418b81c4000000  mov     eax,dword ptr [r9+0C4h]
fffff806`3d03a282 8bca            mov     ecx,edx
fffff806`3d03a284 d3e0            shl     eax,cl
fffff806`3d03a286 83c801          or      eax,1
fffff806`3d03a289 8944244c        mov     dword ptr [rsp+4Ch],eax

nt!KiRetireDpcList+0xadd:
fffff806`3d03a28d 488b442448      mov     rax,qword ptr [rsp+48h]
fffff806`3d03a292 498981c0000000  mov     qword ptr [r9+0C0h],rax
fffff806`3d03a299 e98af6ffff      jmp     nt!KiRetireDpcList+0x178 (fffff806`3d039928)  Branch

nt!KiRetireDpcList+0xaee:
fffff806`3d03a29e 4532db          xor     r11b,r11b
fffff806`3d03a2a1 e970f8ffff      jmp     nt!KiRetireDpcList+0x366 (fffff806`3d039b16)  Branch

nt!KiRetireDpcList+0xaf6:
fffff806`3d03a2a6 4584d2          test    r10b,r10b
fffff806`3d03a2a9 0f85d3f8ffff    jne     nt!KiRetireDpcList+0x3d2 (fffff806`3d039b82)  Branch

nt!KiRetireDpcList+0xaff:
fffff806`3d03a2af fb              sti
fffff806`3d03a2b0 48b81400000080f7ffff mov rax,0FFFFF78000000014h
fffff806`3d03a2ba 488b00          mov     rax,qword ptr [rax]
fffff806`3d03a2bd 48894548        mov     qword ptr [rbp+48h],rax
fffff806`3d03a2c1 e92bfbffff      jmp     nt!KiRetireDpcList+0x641 (fffff806`3d039df1)  Branch

nt!KiRetireDpcList+0xb16:
fffff806`3d03a2c6 b964000000      mov     ecx,64h
fffff806`3d03a2cb e93cf7ffff      jmp     nt!KiRetireDpcList+0x25c (fffff806`3d039a0c)  Branch

nt!KiRetireDpcList+0xb20:
fffff806`3d03a2d0 b964000000      mov     ecx,64h
fffff806`3d03a2d5 e9f5f5ffff      jmp     nt!KiRetireDpcList+0x11f (fffff806`3d0398cf)  Branch

nt!KiRetireDpcList+0xb2a:
fffff806`3d03a2da 0fb6467c        movzx   eax,byte ptr [rsi+7Ch]
fffff806`3d03a2de 488b97c07e0000  mov     rdx,qword ptr [rdi+7EC0h]
fffff806`3d03a2e5 482b97c87e0000  sub     rdx,qword ptr [rdi+7EC8h]
fffff806`3d03a2ec 480194c7d07e0000 add     qword ptr [rdi+rax*8+7ED0h],rdx
fffff806`3d03a2f4 4180e0ef        and     r8b,0EFh
fffff806`3d03a2f8 4c89afc87e0000  mov     qword ptr [rdi+7EC8h],r13
fffff806`3d03a2ff e978f5ffff      jmp     nt!KiRetireDpcList+0xcc (fffff806`3d03987c)  Branch

nt!KiRetireDpcList+0xb54:
fffff806`3d03a304 0fb6467c        movzx   eax,byte ptr [rsi+7Ch]
fffff806`3d03a308 4c898fc87e0000  mov     qword ptr [rdi+7EC8h],r9
fffff806`3d03a30f e946f7ffff      jmp     nt!KiRetireDpcList+0x2aa (fffff806`3d039a5a)  Branch

nt!KiRetireDpcList+0xb64:
fffff806`3d03a314 fb              sti ; Set interrupt flag (allow maskable interrupts)
fffff806`3d03a315 488d8f807b0000  lea     rcx,[rdi+7B80h] ; DpcGate (a _KGATE which is nothing but _DISPATCHER_HEADER)
fffff806`3d03a31c 33d2            xor     edx,edx
fffff806`3d03a31e e81d7f1000      call    nt!KeSignalGate (fffff806`3d142240) ; Signaling a gate means "we're finished"
fffff806`3d03a323 fa              cli ; clear interrupt flag
fffff806`3d03a324 e984f6ffff      jmp     nt!KiRetireDpcList+0x1fd (fffff806`3d0399ad)  Branch

nt!KiRetireDpcList+0xb79:
fffff806`3d03a329 c744244c01000000 mov     dword ptr [rsp+4Ch],1
fffff806`3d03a331 e957ffffff      jmp     nt!KiRetireDpcList+0xadd (fffff806`3d03a28d)  Branch

nt!KiRetireDpcList+0xb86:
fffff806`3d03a336 498b8c24b8840000 mov     rcx,qword ptr [r12+84B8h]
fffff806`3d03a33e 4885c9          test    rcx,rcx
fffff806`3d03a341 0f85ceb11d00    jne     nt!KiRetireDpcList+0x1dbd65 (fffff806`3d215515)  Branch

nt!KiRetireDpcList+0xb97:
fffff806`3d03a347 488d4d94        lea     rcx,[rbp-6Ch]
fffff806`3d03a34b e85090ffff      call    nt!KeYieldProcessorEx (fffff806`3d0333a0)
fffff806`3d03a350 488b06          mov     rax,qword ptr [rsi]
fffff806`3d03a353 4885c0          test    rax,rax
fffff806`3d03a356 75ef            jne     nt!KiRetireDpcList+0xb97 (fffff806`3d03a347)  Branch

nt!KiRetireDpcList+0xba8:
fffff806`3d03a358 498b8c24b8840000 mov     rcx,qword ptr [r12+84B8h]
fffff806`3d03a360 4885c9          test    rcx,rcx
fffff806`3d03a363 0f84c8faffff    je      nt!KiRetireDpcList+0x681 (fffff806`3d039e31)  Branch

nt!KiRetireDpcList+0xbb9:
fffff806`3d03a369 e9d0b11d00      jmp     nt!KiRetireDpcList+0x1dbd8e (fffff806`3d21553e)  Branch

nt!KiRetireDpcList+0xbbe:
fffff806`3d03a36e 488b8fb8840000  mov     rcx,qword ptr [rdi+84B8h]
fffff806`3d03a375 4885c9          test    rcx,rcx
fffff806`3d03a378 0f857fb01d00    jne     nt!KiRetireDpcList+0x1dbc4d (fffff806`3d2153fd)  Branch

nt!KiRetireDpcList+0xbce:
fffff806`3d03a37e 488d4d90        lea     rcx,[rbp-70h]
fffff806`3d03a382 e81990ffff      call    nt!KeYieldProcessorEx (fffff806`3d0333a0)
fffff806`3d03a387 498b07          mov     rax,qword ptr [r15]
fffff806`3d03a38a 4885c0          test    rax,rax
fffff806`3d03a38d 75ef            jne     nt!KiRetireDpcList+0xbce (fffff806`3d03a37e)  Branch

nt!KiRetireDpcList+0xbdf:
fffff806`3d03a38f 488b8fb8840000  mov     rcx,qword ptr [rdi+84B8h]
fffff806`3d03a396 4885c9          test    rcx,rcx
fffff806`3d03a399 0f84f9fbffff    je      nt!KiRetireDpcList+0x7e8 (fffff806`3d039f98)  Branch

nt!KiRetireDpcList+0xbef:
fffff806`3d03a39f e980b01d00      jmp     nt!KiRetireDpcList+0x1dbc74 (fffff806`3d215424)  Branch

nt!KiRetireDpcList+0x1db96a:
fffff806`3d21511a 8b4874          mov     ecx,dword ptr [rax+74h]
fffff806`3d21511d e9ad47e2ff      jmp     nt!KiRetireDpcList+0x11f (fffff806`3d0398cf)  Branch

nt!KiRetireDpcList+0x1db972:
fffff806`3d215122 b81f85eb51      mov     eax,51EB851Fh
fffff806`3d215127 f7e1            mul     eax,ecx
fffff806`3d215129 c1ea03          shr     edx,3
fffff806`3d21512c e9ac47e2ff      jmp     nt!KiRetireDpcList+0x12d (fffff806`3d0398dd)  Branch

nt!KiRetireDpcList+0x1db981:
fffff806`3d215131 498bd3          mov     rdx,r11
fffff806`3d215134 4803d2          add     rdx,rdx
fffff806`3d215137 498b4cd108      mov     rcx,qword ptr [r9+rdx*8+8]
fffff806`3d21513c 4903ca          add     rcx,r10
fffff806`3d21513f 49894cd108      mov     qword ptr [r9+rdx*8+8],rcx
fffff806`3d215144 e9f647e2ff      jmp     nt!KiRetireDpcList+0x18f (fffff806`3d03993f)  Branch

nt!KiRetireDpcList+0x1db999:
fffff806`3d215149 488b86c8030000  mov     rax,qword ptr [rsi+3C8h]
fffff806`3d215150 4885c0          test    rax,rax
fffff806`3d215153 7404            je      nt!KiRetireDpcList+0x1db9a9 (fffff806`3d215159)  Branch

nt!KiRetireDpcList+0x1db9a5:
fffff806`3d215155 c6404000        mov     byte ptr [rax+40h],0

nt!KiRetireDpcList+0x1db9a9:
fffff806`3d215159 4180e0bf        and     r8b,0BFh
fffff806`3d21515d e90d48e2ff      jmp     nt!KiRetireDpcList+0x1bf (fffff806`3d03996f)  Branch

nt!KiRetireDpcList+0x1db9b2:
fffff806`3d215162 8b8600020000    mov     eax,dword ptr [rsi+200h]
fffff806`3d215168 3c02            cmp     al,2
fffff806`3d21516a 740c            je      nt!KiRetireDpcList+0x1db9c8 (fffff806`3d215178)  Branch

nt!KiRetireDpcList+0x1db9bc:
fffff806`3d21516c 4c0197f07e0000  add     qword ptr [rdi+7EF0h],r10
fffff806`3d215173 e9dc4de2ff      jmp     nt!KiRetireDpcList+0x7a4 (fffff806`3d039f54)  Branch

nt!KiRetireDpcList+0x1db9c8:
fffff806`3d215178 4c0197f87e0000  add     qword ptr [rdi+7EF8h],r10
fffff806`3d21517f e9d04de2ff      jmp     nt!KiRetireDpcList+0x7a4 (fffff806`3d039f54)  Branch

nt!KiRetireDpcList+0x1db9d4:
fffff806`3d215184 488b5820        mov     rbx,qword ptr [rax+20h]
fffff806`3d215188 4885db          test    rbx,rbx
fffff806`3d21518b 0f84e847e2ff    je      nt!KiRetireDpcList+0x1c9 (fffff806`3d039979)  Branch

nt!KiRetireDpcList+0x1db9e1:
fffff806`3d215191 8b0de14a8e00    mov     ecx,dword ptr [nt!KiHwCountersCount (fffff806`3daf9c78)]
fffff806`3d215197 41b901000000    mov     r9d,1
fffff806`3d21519d 85c9            test    ecx,ecx
fffff806`3d21519f 7446            je      nt!KiRetireDpcList+0x1dba37 (fffff806`3d2151e7)  Branch

nt!KiRetireDpcList+0x1db9f1:
fffff806`3d2151a1 4c8d1518608100  lea     r10,[nt!KiHwCounters (fffff806`3da2b1c0)]
fffff806`3d2151a8 448bd9          mov     r11d,ecx
fffff806`3d2151ab 4c8d4030        lea     r8,[rax+30h]

nt!KiRetireDpcList+0x1db9ff:
fffff806`3d2151af 4985d9          test    r9,rbx
fffff806`3d2151b2 7418            je      nt!KiRetireDpcList+0x1dba1c (fffff806`3d2151cc)  Branch

nt!KiRetireDpcList+0x1dba04:
fffff806`3d2151b4 418b0a          mov     ecx,dword ptr [r10]
fffff806`3d2151b7 0f33            rdpmc
fffff806`3d2151b9 48c1e220        shl     rdx,20h
fffff806`3d2151bd 480bc2          or      rax,rdx
fffff806`3d2151c0 8bc8            mov     ecx,eax
fffff806`3d2151c2 412b08          sub     ecx,dword ptr [r8]
fffff806`3d2151c5 49014808        add     qword ptr [r8+8],rcx
fffff806`3d2151c9 498900          mov     qword ptr [r8],rax

nt!KiRetireDpcList+0x1dba1c:
fffff806`3d2151cc 4d03c9          add     r9,r9
fffff806`3d2151cf 4983c204        add     r10,4
fffff806`3d2151d3 4983c018        add     r8,18h
fffff806`3d2151d7 4983eb01        sub     r11,1
fffff806`3d2151db 75d2            jne     nt!KiRetireDpcList+0x1db9ff (fffff806`3d2151af)  Branch

nt!KiRetireDpcList+0x1dba2d:
fffff806`3d2151dd 49bb0800000080f7ffff mov r11,0FFFFF78000000008h

nt!KiRetireDpcList+0x1dba37:
fffff806`3d2151e7 49b91400000080f7ffff mov r9,0FFFFF78000000014h
fffff806`3d2151f1 e98347e2ff      jmp     nt!KiRetireDpcList+0x1c9 (fffff806`3d039979)  Branch

nt!KiRetireDpcList+0x1dba46:
fffff806`3d2151f6 83bfdc00000040  cmp     dword ptr [rdi+0DCh],40h
fffff806`3d2151fd 7523            jne     nt!KiRetireDpcList+0x1dba72 (fffff806`3d215222)  Branch

nt!KiRetireDpcList+0x1dba4f:
fffff806`3d2151ff 488bcf          mov     rcx,rdi
fffff806`3d215202 e8a91eebff      call    nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
fffff806`3d215207 488bc8          mov     rcx,rax
fffff806`3d21520a 488b4770        mov     rax,qword ptr [rdi+70h]
fffff806`3d21520e e8cd18fdff      call    nt!guard_dispatch_icall (fffff806`3d1e6ae0)
fffff806`3d215213 4c8bbfd0000000  mov     r15,qword ptr [rdi+0D0h]
fffff806`3d21521a 488bd0          mov     rdx,rax
fffff806`3d21521d e9c2000000      jmp     nt!KiRetireDpcList+0x1dbb34 (fffff806`3d2152e4)  Branch

nt!KiRetireDpcList+0x1dba72:
fffff806`3d215222 4c8bbfd0000000  mov     r15,qword ptr [rdi+0D0h]

nt!KiRetireDpcList+0x1dba79:
fffff806`3d215229 488b9fc8000000  mov     rbx,qword ptr [rdi+0C8h]
fffff806`3d215230 488bcf          mov     rcx,rdi
fffff806`3d215233 e8781eebff      call    nt!HalpTimerGetInternalData (fffff806`3d0c70b0)
fffff806`3d215238 488bc8          mov     rcx,rax
fffff806`3d21523b 488b4770        mov     rax,qword ptr [rdi+70h]
fffff806`3d21523f e89c18fdff      call    nt!guard_dispatch_icall (fffff806`3d1e6ae0)
fffff806`3d215244 4c8bd0          mov     r10,rax
fffff806`3d215247 f0830c2400      lock or dword ptr [rsp],0
fffff806`3d21524c 488b87c8000000  mov     rax,qword ptr [rdi+0C8h]
fffff806`3d215253 483bd8          cmp     rbx,rax
fffff806`3d215256 75d1            jne     nt!KiRetireDpcList+0x1dba79 (fffff806`3d215229)  Branch

nt!KiRetireDpcList+0x1dbaa8:
fffff806`3d215258 488b8fd0000000  mov     rcx,qword ptr [rdi+0D0h]
fffff806`3d21525f 4c3bf9          cmp     r15,rcx
fffff806`3d215262 75be            jne     nt!KiRetireDpcList+0x1dba72 (fffff806`3d215222)  Branch

nt!KiRetireDpcList+0x1dbab4:
fffff806`3d215264 448b8fdc000000  mov     r9d,dword ptr [rdi+0DCh]
fffff806`3d21526b ba01000000      mov     edx,1
fffff806`3d215270 418d49ff        lea     ecx,[r9-1]
fffff806`3d215274 48d3e2          shl     rdx,cl
fffff806`3d215277 498bca          mov     rcx,r10
fffff806`3d21527a 4833cb          xor     rcx,rbx
fffff806`3d21527d 4885ca          test    rdx,rcx
fffff806`3d215280 743c            je      nt!KiRetireDpcList+0x1dbb0e (fffff806`3d2152be)  Branch

nt!KiRetireDpcList+0x1dbad2:
fffff806`3d215282 418bc9          mov     ecx,r9d
fffff806`3d215285 41b801000000    mov     r8d,1
fffff806`3d21528b 49d3e0          shl     r8,cl
fffff806`3d21528e 48c7c1ffffffff  mov     rcx,0FFFFFFFFFFFFFFFFh
fffff806`3d215295 4183f940        cmp     r9d,40h
fffff806`3d215299 7404            je      nt!KiRetireDpcList+0x1dbaef (fffff806`3d21529f)  Branch

nt!KiRetireDpcList+0x1dbaeb:
fffff806`3d21529b 498d48ff        lea     rcx,[r8-1]

nt!KiRetireDpcList+0x1dbaef:
fffff806`3d21529f 4823cb          and     rcx,rbx
fffff806`3d2152a2 488bd1          mov     rdx,rcx
fffff806`3d2152a5 4833d3          xor     rdx,rbx
fffff806`3d2152a8 490bd2          or      rdx,r10
fffff806`3d2152ab 4c3bd1          cmp     r10,rcx
fffff806`3d2152ae 7303            jae     nt!KiRetireDpcList+0x1dbb03 (fffff806`3d2152b3)  Branch

nt!KiRetireDpcList+0x1dbb00:
fffff806`3d2152b0 4903d0          add     rdx,r8

nt!KiRetireDpcList+0x1dbb03:
fffff806`3d2152b3 f0480fb197c8000000 lock cmpxchg qword ptr [rdi+0C8h],rdx
fffff806`3d2152bc eb26            jmp     nt!KiRetireDpcList+0x1dbb34 (fffff806`3d2152e4)  Branch

nt!KiRetireDpcList+0x1dbb0e:
fffff806`3d2152be 4183f940        cmp     r9d,40h
fffff806`3d2152c2 7509            jne     nt!KiRetireDpcList+0x1dbb1d (fffff806`3d2152cd)  Branch

nt!KiRetireDpcList+0x1dbb14:
fffff806`3d2152c4 48c7c2ffffffff  mov     rdx,0FFFFFFFFFFFFFFFFh
fffff806`3d2152cb eb0e            jmp     nt!KiRetireDpcList+0x1dbb2b (fffff806`3d2152db)  Branch

nt!KiRetireDpcList+0x1dbb1d:
fffff806`3d2152cd 418bc9          mov     ecx,r9d
fffff806`3d2152d0 ba01000000      mov     edx,1
fffff806`3d2152d5 48d3e2          shl     rdx,cl
fffff806`3d2152d8 48ffca          dec     rdx

nt!KiRetireDpcList+0x1dbb2b:
fffff806`3d2152db 48f7d2          not     rdx
fffff806`3d2152de 4823d3          and     rdx,rbx
fffff806`3d2152e1 490bd2          or      rdx,r10

nt!KiRetireDpcList+0x1dbb34:
fffff806`3d2152e4 498d0c17        lea     rcx,[r15+rdx]
fffff806`3d2152e8 41b880969800    mov     r8d,989680h
fffff806`3d2152ee 488b97c0000000  mov     rdx,qword ptr [rdi+0C0h]
fffff806`3d2152f5 e836b8f6ff      call    nt!HalpTimerScaleCounter (fffff806`3d180b30)
fffff806`3d2152fa 90              nop
fffff806`3d2152fb e92c49e2ff      jmp     nt!KiRetireDpcList+0x47c (fffff806`3d039c2c)  Branch

nt!KiRetireDpcList+0x1dbb50:
fffff806`3d215300 418bc8          mov     ecx,r8d
fffff806`3d215303 41ba01000000    mov     r10d,1
fffff806`3d215309 49d3e2          shl     r10,cl
fffff806`3d21530c 48c7c1ffffffff  mov     rcx,0FFFFFFFFFFFFFFFFh
fffff806`3d215313 4183f840        cmp     r8d,40h
fffff806`3d215317 7404            je      nt!KiRetireDpcList+0x1dbb6d (fffff806`3d21531d)  Branch

nt!KiRetireDpcList+0x1dbb69:
fffff806`3d215319 498d4aff        lea     rcx,[r10-1]

nt!KiRetireDpcList+0x1dbb6d:
fffff806`3d21531d 4823cb          and     rcx,rbx
fffff806`3d215320 488bd1          mov     rdx,rcx
fffff806`3d215323 4833d3          xor     rdx,rbx
fffff806`3d215326 490bd1          or      rdx,r9
fffff806`3d215329 4c3bc9          cmp     r9,rcx
fffff806`3d21532c 7303            jae     nt!KiRetireDpcList+0x1dbb81 (fffff806`3d215331)  Branch

nt!KiRetireDpcList+0x1dbb7e:
fffff806`3d21532e 4903d2          add     rdx,r10

nt!KiRetireDpcList+0x1dbb81:
fffff806`3d215331 f0480fb197c8000000 lock cmpxchg qword ptr [rdi+0C8h],rdx
fffff806`3d21533a e9e948e2ff      jmp     nt!KiRetireDpcList+0x478 (fffff806`3d039c28)  Branch

nt!KiRetireDpcList+0x1dbb8f:
fffff806`3d21533f 48c7c2ffffffff  mov     rdx,0FFFFFFFFFFFFFFFFh
fffff806`3d215346 e9114fe2ff      jmp     nt!KiRetireDpcList+0xaac (fffff806`3d03a25c)  Branch

nt!KiRetireDpcList+0x1dbb9b:
fffff806`3d21534b 488d4518        lea     rax,[rbp+18h]
fffff806`3d21534f 4c897d18        mov     qword ptr [rbp+18h],r15
fffff806`3d215353 41b9500f0000    mov     r9d,0F50h
fffff806`3d215359 48894528        mov     qword ptr [rbp+28h],rax
fffff806`3d21535d ba01000000      mov     edx,1
fffff806`3d215362 c6452000        mov     byte ptr [rbp+20h],0
fffff806`3d215366 41b800000240    mov     r8d,40020000h
fffff806`3d21536c 48c7453010000000 mov     qword ptr [rbp+30h],10h
fffff806`3d215374 488d4d28        lea     rcx,[rbp+28h]
fffff806`3d215378 c744242002060000 mov     dword ptr [rsp+20h],602h
fffff806`3d215380 e85bebe5ff      call    nt!EtwTraceKernelEvent (fffff806`3d073ee0)
fffff806`3d215385 90              nop
fffff806`3d215386 e9cd48e2ff      jmp     nt!KiRetireDpcList+0x4a8 (fffff806`3d039c58)  Branch

nt!KiRetireDpcList+0x1dbbdb:
fffff806`3d21538b 8bc1            mov     eax,ecx
fffff806`3d21538d 4d8bdc          mov     r11,r12
fffff806`3d215390 4c2bd8          sub     r11,rax
fffff806`3d215393 49ffc3          inc     r11
fffff806`3d215396 49c1e312        shl     r11,12h

nt!KiRetireDpcList+0x1dbbea:
fffff806`3d21539a 81f900010000    cmp     ecx,100h
fffff806`3d2153a0 0f86cd48e2ff    jbe     nt!KiRetireDpcList+0x4c3 (fffff806`3d039c73)  Branch

nt!KiRetireDpcList+0x1dbbf6:
fffff806`3d2153a6 4981c300000004  add     r11,4000000h
fffff806`3d2153ad c744246800010000 mov     dword ptr [rsp+68h],100h
fffff806`3d2153b5 4c895c2458      mov     qword ptr [rsp+58h],r11
fffff806`3d2153ba 418bc5          mov     eax,r13d
fffff806`3d2153bd e9ce48e2ff      jmp     nt!KiRetireDpcList+0x4e0 (fffff806`3d039c90)  Branch

nt!KiRetireDpcList+0x1dbc12:
fffff806`3d2153c2 4d395f18        cmp     qword ptr [r15+18h],r11
fffff806`3d2153c6 0f872f49e2ff    ja      nt!KiRetireDpcList+0x54b (fffff806`3d039cfb)  Branch

nt!KiRetireDpcList+0x1dbc1c:
fffff806`3d2153cc e91b49e2ff      jmp     nt!KiRetireDpcList+0x53c (fffff806`3d039cec)  Branch

nt!KiRetireDpcList+0x1dbc21:
fffff806`3d2153d1 80782001        cmp     byte ptr [rax+20h],1
fffff806`3d2153d5 0f87ba4be2ff    ja      nt!KiRetireDpcList+0x7e5 (fffff806`3d039f95)  Branch

nt!KiRetireDpcList+0x1dbc2b:
fffff806`3d2153db 8b4118          mov     eax,dword ptr [rcx+18h]
fffff806`3d2153de 488b7c2460      mov     rdi,qword ptr [rsp+60h]
fffff806`3d2153e3 83c001          add     eax,1
fffff806`3d2153e6 894118          mov     dword ptr [rcx+18h],eax
fffff806`3d2153e9 0f85a94be2ff    jne     nt!KiRetireDpcList+0x7e8 (fffff806`3d039f98)  Branch

nt!KiRetireDpcList+0x1dbc3f:
fffff806`3d2153ef 488bcf          mov     rcx,rdi
fffff806`3d2153f2 e87d121100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d2153f7 90              nop
fffff806`3d2153f8 e99b4be2ff      jmp     nt!KiRetireDpcList+0x7e8 (fffff806`3d039f98)  Branch

nt!KiRetireDpcList+0x1dbc4d:
fffff806`3d2153fd 807f2001        cmp     byte ptr [rdi+20h],1
fffff806`3d215401 0f87774fe2ff    ja      nt!KiRetireDpcList+0xbce (fffff806`3d03a37e)  Branch

nt!KiRetireDpcList+0x1dbc57:
fffff806`3d215407 8b4118          mov     eax,dword ptr [rcx+18h]
fffff806`3d21540a 83e801          sub     eax,1
fffff806`3d21540d 894118          mov     dword ptr [rcx+18h],eax
fffff806`3d215410 0f85684fe2ff    jne     nt!KiRetireDpcList+0xbce (fffff806`3d03a37e)  Branch

nt!KiRetireDpcList+0x1dbc66:
fffff806`3d215416 488bcf          mov     rcx,rdi
fffff806`3d215419 e856121100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d21541e 90              nop
fffff806`3d21541f e95a4fe2ff      jmp     nt!KiRetireDpcList+0xbce (fffff806`3d03a37e)  Branch

nt!KiRetireDpcList+0x1dbc74:
fffff806`3d215424 807f2001        cmp     byte ptr [rdi+20h],1
fffff806`3d215428 0f876a4be2ff    ja      nt!KiRetireDpcList+0x7e8 (fffff806`3d039f98)  Branch

nt!KiRetireDpcList+0x1dbc7e:
fffff806`3d21542e 8b4118          mov     eax,dword ptr [rcx+18h]
fffff806`3d215431 83c001          add     eax,1
fffff806`3d215434 894118          mov     dword ptr [rcx+18h],eax
fffff806`3d215437 0f855b4be2ff    jne     nt!KiRetireDpcList+0x7e8 (fffff806`3d039f98)  Branch

nt!KiRetireDpcList+0x1dbc8d:
fffff806`3d21543d 488bcf          mov     rcx,rdi
fffff806`3d215440 e82f121100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d215445 90              nop
fffff806`3d215446 e94d4be2ff      jmp     nt!KiRetireDpcList+0x7e8 (fffff806`3d039f98)  Branch

nt!KiRetireDpcList+0x1dbc9b:
fffff806`3d21544b 488b4580        mov     rax,qword ptr [rbp-80h]
fffff806`3d21544f f048832000      lock and qword ptr [rax],0
fffff806`3d215454 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff806`3d21545d 488b91b8840000  mov     rdx,qword ptr [rcx+84B8h]
fffff806`3d215464 4885d2          test    rdx,rdx
fffff806`3d215467 7416            je      nt!KiRetireDpcList+0x1dbccf (fffff806`3d21547f)  Branch

nt!KiRetireDpcList+0x1dbcb9:
fffff806`3d215469 80792001        cmp     byte ptr [rcx+20h],1
fffff806`3d21546d 7710            ja      nt!KiRetireDpcList+0x1dbccf (fffff806`3d21547f)  Branch

nt!KiRetireDpcList+0x1dbcbf:
fffff806`3d21546f 8b4218          mov     eax,dword ptr [rdx+18h]
fffff806`3d215472 83e801          sub     eax,1
fffff806`3d215475 894218          mov     dword ptr [rdx+18h],eax
fffff806`3d215478 7505            jne     nt!KiRetireDpcList+0x1dbccf (fffff806`3d21547f)  Branch

nt!KiRetireDpcList+0x1dbcca:
fffff806`3d21547a e8f5111100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)

nt!KiRetireDpcList+0x1dbccf:
fffff806`3d21547f 4c8b442440      mov     r8,qword ptr [rsp+40h]
fffff806`3d215484 488d5540        lea     rdx,[rbp+40h]
fffff806`3d215488 488b4c2470      mov     rcx,qword ptr [rsp+70h]
fffff806`3d21548d 41b940000000    mov     r9d,40h
fffff806`3d215493 e8e812e2ff      call    nt!KiProcessExpiredTimerList (fffff806`3d036780)
fffff806`3d215498 4533c9          xor     r9d,r9d
fffff806`3d21549b 44894c2434      mov     dword ptr [rsp+34h],r9d
fffff806`3d2154a0 483b3f          cmp     rdi,qword ptr [rdi]
fffff806`3d2154a3 0f85c74ae2ff    jne     nt!KiRetireDpcList+0x7c0 (fffff806`3d039f70)  Branch

nt!KiRetireDpcList+0x1dbcf9:
fffff806`3d2154a9 eb23            jmp     nt!KiRetireDpcList+0x1dbd1e (fffff806`3d2154ce)  Branch

nt!KiRetireDpcList+0x1dbcfb:
fffff806`3d2154ab 80792001        cmp     byte ptr [rcx+20h],1
fffff806`3d2154af 0f87444be2ff    ja      nt!KiRetireDpcList+0x849 (fffff806`3d039ff9)  Branch

nt!KiRetireDpcList+0x1dbd05:
fffff806`3d2154b5 8b4218          mov     eax,dword ptr [rdx+18h]
fffff806`3d2154b8 83e801          sub     eax,1
fffff806`3d2154bb 894218          mov     dword ptr [rdx+18h],eax
fffff806`3d2154be 0f85354be2ff    jne     nt!KiRetireDpcList+0x849 (fffff806`3d039ff9)  Branch

nt!KiRetireDpcList+0x1dbd14:
fffff806`3d2154c4 e8ab111100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d2154c9 448b4c2434      mov     r9d,dword ptr [rsp+34h]

nt!KiRetireDpcList+0x1dbd1e:
fffff806`3d2154ce 4c8b5c2458      mov     r11,qword ptr [rsp+58h]
fffff806`3d2154d3 e9214be2ff      jmp     nt!KiRetireDpcList+0x849 (fffff806`3d039ff9)  Branch

nt!KiRetireDpcList+0x1dbd28:
fffff806`3d2154d8 488b442458      mov     rax,qword ptr [rsp+58h]
fffff806`3d2154dd 48394618        cmp     qword ptr [rsi+18h],rax
fffff806`3d2154e1 0f878648e2ff    ja      nt!KiRetireDpcList+0x5bd (fffff806`3d039d6d)  Branch

nt!KiRetireDpcList+0x1dbd37:
fffff806`3d2154e7 e97248e2ff      jmp     nt!KiRetireDpcList+0x5ae (fffff806`3d039d5e)  Branch

nt!KiRetireDpcList+0x1dbd3c:
fffff806`3d2154ec 41807c242001    cmp     byte ptr [r12+20h],1
fffff806`3d2154f2 0f873949e2ff    ja      nt!KiRetireDpcList+0x681 (fffff806`3d039e31)  Branch

nt!KiRetireDpcList+0x1dbd48:
fffff806`3d2154f8 8b4118          mov     eax,dword ptr [rcx+18h]
fffff806`3d2154fb 83c001          add     eax,1
fffff806`3d2154fe 894118          mov     dword ptr [rcx+18h],eax
fffff806`3d215501 0f852a49e2ff    jne     nt!KiRetireDpcList+0x681 (fffff806`3d039e31)  Branch

nt!KiRetireDpcList+0x1dbd57:
fffff806`3d215507 498bcc          mov     rcx,r12
fffff806`3d21550a e865111100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d21550f 90              nop
fffff806`3d215510 e91c49e2ff      jmp     nt!KiRetireDpcList+0x681 (fffff806`3d039e31)  Branch

nt!KiRetireDpcList+0x1dbd65:
fffff806`3d215515 41807c242001    cmp     byte ptr [r12+20h],1
fffff806`3d21551b 0f87264ee2ff    ja      nt!KiRetireDpcList+0xb97 (fffff806`3d03a347)  Branch

nt!KiRetireDpcList+0x1dbd71:
fffff806`3d215521 8b4118          mov     eax,dword ptr [rcx+18h]
fffff806`3d215524 83e801          sub     eax,1
fffff806`3d215527 894118          mov     dword ptr [rcx+18h],eax
fffff806`3d21552a 0f85174ee2ff    jne     nt!KiRetireDpcList+0xb97 (fffff806`3d03a347)  Branch

nt!KiRetireDpcList+0x1dbd80:
fffff806`3d215530 498bcc          mov     rcx,r12
fffff806`3d215533 e83c111100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d215538 90              nop
fffff806`3d215539 e9094ee2ff      jmp     nt!KiRetireDpcList+0xb97 (fffff806`3d03a347)  Branch

nt!KiRetireDpcList+0x1dbd8e:
fffff806`3d21553e 41807c242001    cmp     byte ptr [r12+20h],1
fffff806`3d215544 0f87e748e2ff    ja      nt!KiRetireDpcList+0x681 (fffff806`3d039e31)  Branch

nt!KiRetireDpcList+0x1dbd9a:
fffff806`3d21554a 8b4118          mov     eax,dword ptr [rcx+18h]
fffff806`3d21554d 83c001          add     eax,1
fffff806`3d215550 894118          mov     dword ptr [rcx+18h],eax
fffff806`3d215553 0f85d848e2ff    jne     nt!KiRetireDpcList+0x681 (fffff806`3d039e31)  Branch

nt!KiRetireDpcList+0x1dbda9:
fffff806`3d215559 ebac            jmp     nt!KiRetireDpcList+0x1dbd57 (fffff806`3d215507)  Branch

nt!KiRetireDpcList+0x1dbdab:
fffff806`3d21555b 488b4588        mov     rax,qword ptr [rbp-78h]
fffff806`3d21555f f048832000      lock and qword ptr [rax],0
fffff806`3d215564 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff806`3d21556d 488b91b8840000  mov     rdx,qword ptr [rcx+84B8h]
fffff806`3d215574 4885d2          test    rdx,rdx
fffff806`3d215577 7416            je      nt!KiRetireDpcList+0x1dbddf (fffff806`3d21558f)  Branch

nt!KiRetireDpcList+0x1dbdc9:
fffff806`3d215579 80792001        cmp     byte ptr [rcx+20h],1
fffff806`3d21557d 7710            ja      nt!KiRetireDpcList+0x1dbddf (fffff806`3d21558f)  Branch

nt!KiRetireDpcList+0x1dbdcf:
fffff806`3d21557f 8b4218          mov     eax,dword ptr [rdx+18h]
fffff806`3d215582 83e801          sub     eax,1
fffff806`3d215585 894218          mov     dword ptr [rdx+18h],eax
fffff806`3d215588 7505            jne     nt!KiRetireDpcList+0x1dbddf (fffff806`3d21558f)  Branch

nt!KiRetireDpcList+0x1dbdda:
fffff806`3d21558a e8e5101100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)

nt!KiRetireDpcList+0x1dbddf:
fffff806`3d21558f 4c8b442440      mov     r8,qword ptr [rsp+40h]
fffff806`3d215594 488d5540        lea     rdx,[rbp+40h]
fffff806`3d215598 488b4c2470      mov     rcx,qword ptr [rsp+70h]
fffff806`3d21559d 41b940000000    mov     r9d,40h
fffff806`3d2155a3 e8d811e2ff      call    nt!KiProcessExpiredTimerList (fffff806`3d036780)
fffff806`3d2155a8 33d2            xor     edx,edx
fffff806`3d2155aa 89542434        mov     dword ptr [rsp+34h],edx
fffff806`3d2155ae 483b1b          cmp     rbx,qword ptr [rbx]
fffff806`3d2155b1 0f855948e2ff    jne     nt!KiRetireDpcList+0x660 (fffff806`3d039e10)  Branch

nt!KiRetireDpcList+0x1dbe07:
fffff806`3d2155b7 e9ca48e2ff      jmp     nt!KiRetireDpcList+0x6d6 (fffff806`3d039e86)  Branch

nt!KiRetireDpcList+0x1dbe0c:
fffff806`3d2155bc 80792001        cmp     byte ptr [rcx+20h],1
fffff806`3d2155c0 0f87bc48e2ff    ja      nt!KiRetireDpcList+0x6d2 (fffff806`3d039e82)  Branch

nt!KiRetireDpcList+0x1dbe16:
fffff806`3d2155c6 8b4218          mov     eax,dword ptr [rdx+18h]
fffff806`3d2155c9 83e801          sub     eax,1
fffff806`3d2155cc 894218          mov     dword ptr [rdx+18h],eax
fffff806`3d2155cf 0f85ad48e2ff    jne     nt!KiRetireDpcList+0x6d2 (fffff806`3d039e82)  Branch

nt!KiRetireDpcList+0x1dbe25:
fffff806`3d2155d5 e89a101100      call    nt!KiRemoveSystemWorkPriorityKick (fffff806`3d326674)
fffff806`3d2155da 90              nop
fffff806`3d2155db e9a248e2ff      jmp     nt!KiRetireDpcList+0x6d2 (fffff806`3d039e82)  Branch

nt!KiRetireDpcList+0x1dbe30:
fffff806`3d2155e0 2bc1            sub     eax,ecx
fffff806`3d2155e2 8987a87e0000    mov     dword ptr [rdi+7EA8h],eax
fffff806`3d2155e8 e90448e2ff      jmp     nt!KiRetireDpcList+0x641 (fffff806`3d039df1)  Branch

nt!KiRetireDpcList+0x1dbe3d:
fffff806`3d2155ed fb              sti
fffff806`3d2155ee 498b01          mov     rax,qword ptr [r9]
fffff806`3d2155f1 48894548        mov     qword ptr [rbp+48h],rax
fffff806`3d2155f5 e90148e2ff      jmp     nt!KiRetireDpcList+0x64b (fffff806`3d039dfb)  Branch

nt!KiRetireDpcList+0x1dbe4a:
fffff806`3d2155fa 8b4874          mov     ecx,dword ptr [rax+74h]
fffff806`3d2155fd e90a44e2ff      jmp     nt!KiRetireDpcList+0x25c (fffff806`3d039a0c)  Branch

nt!KiRetireDpcList+0x1dbe52:
fffff806`3d215602 b81f85eb51      mov     eax,51EB851Fh
fffff806`3d215607 f7e1            mul     eax,ecx
fffff806`3d215609 c1ea03          shr     edx,3
fffff806`3d21560c e90944e2ff      jmp     nt!KiRetireDpcList+0x26a (fffff806`3d039a1a)  Branch

nt!KiRetireDpcList+0x1dbe61:
fffff806`3d215611 488b86c8030000  mov     rax,qword ptr [rsi+3C8h]
fffff806`3d215618 4885c0          test    rax,rax
fffff806`3d21561b 0f842844e2ff    je      nt!KiRetireDpcList+0x299 (fffff806`3d039a49)  Branch

nt!KiRetireDpcList+0x1dbe71:
fffff806`3d215621 c6404001        mov     byte ptr [rax+40h],1
fffff806`3d215625 e91f44e2ff      jmp     nt!KiRetireDpcList+0x299 (fffff806`3d039a49)  Branch

nt!KiRetireDpcList+0x1dbe7a:
fffff806`3d21562a 33d2            xor     edx,edx
fffff806`3d21562c 488bce          mov     rcx,rsi
fffff806`3d21562f e86cd01000      call    nt!KiBeginCounterAccumulation (fffff806`3d3226a0)
fffff806`3d215634 90              nop
fffff806`3d215635 e92a44e2ff      jmp     nt!KiRetireDpcList+0x2b4 (fffff806`3d039a64)  Branch

nt!KiRetireDpcList+0x1dbe8a:
fffff806`3d21563a 4c8b4db0        mov     r9,qword ptr [rbp-50h]
fffff806`3d21563e ba08000000      mov     edx,8
fffff806`3d215643 b9c7000000      mov     ecx,0C7h
fffff806`3d215648 4889442420      mov     qword ptr [rsp+20h],rax
fffff806`3d21564d 448d42f9        lea     r8d,[rdx-7]
fffff806`3d215651 e8ea88fcff      call    nt!KeBugCheckEx (fffff806`3d1ddf40)
fffff806`3d215656 cc              int     3

nt!KiRetireDpcList+0x1dbea7:
fffff806`3d215657 ba08000000      mov     edx,8
fffff806`3d21565c 4889442420      mov     qword ptr [rsp+20h],rax
fffff806`3d215661 4d8bcc          mov     r9,r12
fffff806`3d215664 b9c7000000      mov     ecx,0C7h
fffff806`3d215669 448d42f9        lea     r8d,[rdx-7]
fffff806`3d21566d e8ce88fcff      call    nt!KeBugCheckEx (fffff806`3d1ddf40)
fffff806`3d215672 cc              int     3
fffff806`3d215673 cc              int     3

nt!KiExecuteAllDpcs+0xc4:
fffff806`3d03a474 f6050b10ac0021  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff806`3dafb486)],21h
fffff806`3d03a47b 4c8d6310        lea     r12,[rbx+10h]
fffff806`3d03a47f 41b8edffffff    mov     r8d,0FFFFFFEDh
fffff806`3d03a485 0f85e9b11d00    jne     nt!KiExecuteAllDpcs+0x1db2c4 (fffff806`3d215674)  Branch

nt!KiExecuteAllDpcs+0xdb:
fffff806`3d03a48b 65488b342520000000 mov   rsi,qword ptr gs:[20h]
fffff806`3d03a494 488b8eb8840000  mov     rcx,qword ptr [rsi+84B8h]
fffff806`3d03a49b 4885c9          test    rcx,rcx
fffff806`3d03a49e 0f85ebb11d00    jne     nt!KiExecuteAllDpcs+0x1db2df (fffff806`3d21568f)  Branch

nt!KiExecuteAllDpcs+0xf4:
fffff806`3d03a4a4 f0490fba2c2400  lock bts qword ptr [r12],0
fffff806`3d03a4ab 0f82a3030000    jb      nt!KiExecuteAllDpcs+0x4a4 (fffff806`3d03a854)  Branch

nt!KiExecuteAllDpcs+0x101:
fffff806`3d03a4b1 33f6            xor     esi,esi

nt!KiExecuteAllDpcs+0x103:
fffff806`3d03a4b3 8b4318          mov     eax,dword ptr [rbx+18h]
fffff806`3d03a4b6 83f801          cmp     eax,1
fffff806`3d03a4b9 7f15            jg      nt!KiExecuteAllDpcs+0x120 (fffff806`3d03a4d0)  Branch

nt!KiExecuteAllDpcs+0x10b:
fffff806`3d03a4bb 66f0442184572c310000 lock and word ptr [rdi+rdx*2+312Ch],r8w
fffff806`3d03a4c5 8b4318          mov     eax,dword ptr [rbx+18h]
fffff806`3d03a4c8 85c0            test    eax,eax
fffff806`3d03a4ca 0f84f7b41d00    je      nt!KiExecuteAllDpcs+0x1db617 (fffff806`3d2159c7)  Branch

nt!KiExecuteAllDpcs+0x120:
fffff806`3d03a4d0 4c8b33          mov     r14,qword ptr [rbx]
fffff806`3d03a4d3 498b06          mov     rax,qword ptr [r14]
fffff806`3d03a4d6 488903          mov     qword ptr [rbx],rax
fffff806`3d03a4d9 4885c0          test    rax,rax
fffff806`3d03a4dc 7504            jne     nt!KiExecuteAllDpcs+0x132 (fffff806`3d03a4e2)  Branch

nt!KiExecuteAllDpcs+0x12e:
fffff806`3d03a4de 48895b08        mov     qword ptr [rbx+8],rbx

nt!KiExecuteAllDpcs+0x132:
fffff806`3d03a4e2 498b4610        mov     rax,qword ptr [r14+10h]
fffff806`3d03a4e6 4983c6f8        add     r14,0FFFFFFFFFFFFFFF8h
fffff806`3d03a4ea 4889442448      mov     qword ptr [rsp+48h],rax
fffff806`3d03a4ef 4d8b7e38        mov     r15,qword ptr [r14+38h]
fffff806`3d03a4f3 4d8b5620        mov     r10,qword ptr [r14+20h]
fffff806`3d03a4f7 4d8b4628        mov     r8,qword ptr [r14+28h]
fffff806`3d03a4fb 4d8b4e30        mov     r9,qword ptr [r14+30h]
fffff806`3d03a4ff 49897638        mov     qword ptr [r14+38h],rsi
fffff806`3d03a503 8b4318          mov     eax,dword ptr [rbx+18h]
fffff806`3d03a506 ffc8            dec     eax
fffff806`3d03a508 4c89542438      mov     qword ptr [rsp+38h],r10
fffff806`3d03a50d 894318          mov     dword ptr [rbx+18h],eax
fffff806`3d03a510 4c897320        mov     qword ptr [rbx+20h],r14
fffff806`3d03a514 488b8fb8840000  mov     rcx,qword ptr [rdi+84B8h]
fffff806`3d03a51b 4c89442450      mov     qword ptr [rsp+50h],r8
fffff806`3d03a520 4c894c2440      mov     qword ptr [rsp+40h],r9
fffff806`3d03a525 4885c9          test    rcx,rcx
fffff806`3d03a528 0f85bcb11d00    jne     nt!KiExecuteAllDpcs+0x1db33a (fffff806`3d2156ea)  Branch

nt!KiExecuteAllDpcs+0x17e:
fffff806`3d03a52e f605510fac0001  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff806`3dafb486)],1
fffff806`3d03a535 0f85c5b11d00    jne     nt!KiExecuteAllDpcs+0x1db350 (fffff806`3d215700)  Branch

nt!KiExecuteAllDpcs+0x18b:
fffff806`3d03a53b f04983242400    lock and qword ptr [r12],0

nt!KiExecuteAllDpcs+0x191:
fffff806`3d03a541 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff806`3d03a54a 488b91b8840000  mov     rdx,qword ptr [rcx+84B8h]
fffff806`3d03a551 4885d2          test    rdx,rdx
fffff806`3d03a554 0f85cbb11d00    jne     nt!KiExecuteAllDpcs+0x1db375 (fffff806`3d215725)  Branch

nt!KiExecuteAllDpcs+0x1aa:
fffff806`3d03a55a fb              sti
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
fffff806`3d03a68e 4c89bf902d0000  mov     qword ptr [rdi+2D90h],r15
fffff806`3d03a695 4c8be0          mov     r12,rax
fffff806`3d03a698 4983ff01        cmp     r15,1
fffff806`3d03a69c 7404            je      nt!KiExecuteAllDpcs+0x2f2 (fffff806`3d03a6a2)  Branch

nt!KiExecuteAllDpcs+0x2ee:
fffff806`3d03a69e 49894720        mov     qword ptr [r15+20h],rax

nt!KiExecuteAllDpcs+0x2f2:
fffff806`3d03a6a2 4585ed          test    r13d,r13d
fffff806`3d03a6a5 7507            jne     nt!KiExecuteAllDpcs+0x2fe (fffff806`3d03a6ae)  Branch

nt!KiExecuteAllDpcs+0x2f7:
fffff806`3d03a6a7 c6872a31000001  mov     byte ptr [rdi+312Ah],1

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
fffff806`3d03a6d2 4488af2a310000  mov     byte ptr [rdi+312Ah],r13b
fffff806`3d03a6d9 4c8b9790300000  mov     r10,qword ptr [rdi+3090h]
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
fffff806`3d03a722 0f85adb21d00    jne     nt!KiExecuteAllDpcs+0x1db625 (fffff806`3d2159d5)  Branch

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
fffff806`3d03a7fd 488987902d0000  mov     qword ptr [rdi+2D90h],rax
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

nt!KiExecuteAllDpcs+0x49a:
fffff806`3d03a84a be1e000000      mov     esi,1Eh
fffff806`3d03a84f e98bfdffff      jmp     nt!KiExecuteAllDpcs+0x22f (fffff806`3d03a5df)  Branch

nt!KiExecuteAllDpcs+0x4a4:
fffff806`3d03a854 488b8eb8840000  mov     rcx,qword ptr [rsi+84B8h]
fffff806`3d03a85b 4885c9          test    rcx,rcx
fffff806`3d03a85e 0f855fae1d00    jne     nt!KiExecuteAllDpcs+0x1db313 (fffff806`3d2156c3)  Branch

nt!KiExecuteAllDpcs+0x4b4:
fffff806`3d03a864 498bcc          mov     rcx,r12
fffff806`3d03a867 e814cb0900      call    nt!KxWaitForSpinLockAndAcquire (fffff806`3d0d7380)
fffff806`3d03a86c 4c8b5c2430      mov     r11,qword ptr [rsp+30h]
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
fffff806`3d215859 8b87f47b0000    mov     eax,dword ptr [rdi+7BF4h]
fffff806`3d21585f 3987ec7b0000    cmp     dword ptr [rdi+7BECh],eax
fffff806`3d215865 0f8d1a4ee2ff    jge     nt!KiExecuteAllDpcs+0x2d5 (fffff806`3d03a685)  Branch

nt!KiExecuteAllDpcs+0x1db4bb:
fffff806`3d21586b 448b0536b28300  mov     r8d,dword ptr [nt!KiDpcWatchdogProfileArrayLength (fffff806`3da50aa8)]
fffff806`3d215872 33d2            xor     edx,edx
fffff806`3d215874 49c1e003        shl     r8,3
fffff806`3d215878 48898fb0840000  mov     qword ptr [rdi+84B0h],rcx
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
fffff806`3d2159bc e8073c1100      call    nt!KiInsertNewDpcRuntime (fffff806`3d3295c8)
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
