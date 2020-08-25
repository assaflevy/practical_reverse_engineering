# Exercise
On Windows 8 x64, the following kernel functions have InitalizeListHead inlined at least once:

■ CcAllocateInitializeMbcb<br>
■ CmpInitCallbacks<br>
■ ExCreateCallback<br>
■ ExpInitSystemPhase0<br>
■ ExpInitSystemPhase1<br>
■ ExpTimerInitialization<br>
■ InitBootProcessor<br>
■ IoCreateDevice<br>
■ IoInitializeIrp<br>
■ KeInitThread<br>
■ KeInitializeMutex<br>
■ KeInitializeProcess<br>
■ KeInitializeTimerEx<br>
■ KeInitializeTimerTable<br>
■ KiInitializeProcessor<br>
■ KiInitializeThread<br>
■ MiInitializeLoadedModuleList<br>
■ MiInitializePrefetchHead<br>
■ PspAllocateProcess<br>
■ PspAllocateThread<br>

Identify where InitializeListHead is inlined in these routine

# Solution

### Kernel version
1: kd> version<br>
Windows 10 Kernel Version 18362 MP (2 procs) Free x64<br>
Product: WinNt, suite: TerminalServer SingleUserTS<br>
Edition build lab: 18362.1.amd64fre.19h1_release.190318-1202

### Notes
* Exercizes 1-6 cotain a list of 112 functions to analyze. Having went through that list I can now recognize list operations in my sleep.

* Unlike the exercises, every function is analyzed once for all list operations (insert head/tail / remove).

* Indicator of InsertHeadList
```
	fffff805`52997447 488b0b          mov     rcx,qword ptr [rbx] ; Starting with the .Flink field means that it's likely to be an InsertHeadList()
	fffff805`5299744a 48395908        cmp     qword ptr [rcx+8],rbx ; Sanity
	fffff805`5299744e 0f85fafc0000    jne     nt!KeInitThread+0xfe6e (fffff805`529a714e)  Branch ; __fastfail
```
* Indicator of InsertTailList
```
	fffff805`524c6888 488b4208        mov     rax,qword ptr [rdx+8] ; Starting with the .Blink field means that it's likely to be an InsertTailList()
	fffff805`524c688c 483910          cmp     qword ptr [rax],rdx ; Sanity
	fffff805`524c688f 0f85d1811100    jne     nt!KiInsertQueueApc+0x11822a (fffff805`525dea66)  Branch ; __fastfail
```
* Indicator of RemoveEntryList
```
	; Assignment of rax's Flink/Blink into registers will almost always be followed by a (sanity check and) removal of rax:
	rdx,qword ptr [rax] ; rdx = rax.Flink
	rcx,qword ptr [rax+8] ; rcx = rax.Blink
```

* When didn't find list related code, I tried to find it in one of the called functions if the name sounds promising.

-------------------

### CcAllocateInitializeMbcb
```
	nt!CcAllocateInitializeMbcb+0x23:
	fffff805`525182ab 33d2            xor     edx,edx
	fffff805`525182ad 41b8c0000000    mov     r8d,0C0h
	fffff805`525182b3 488bc8          mov     rcx,rax
	fffff805`525182b6 e8c5d10b00      call    nt!memset (fffff805`525d5480)
	fffff805`525182bb 488d4b10        lea     rcx,[rbx+10h]
	fffff805`525182bf b8fb020000      mov     eax,2FBh
	fffff805`525182c4 668903          mov     word ptr [rbx],ax
	fffff805`525182c7 488d4330        lea     rax,[rbx+30h]
	; This looks like InitializeListHead()+InsertHeadList() in one optimized go.
	fffff805`525182cb 488908          mov     qword ptr [rax],rcx ; rax.Flink = rcx
	fffff805`525182ce 48894808        mov     qword ptr [rax+8],rcx ; rax.Blink = rcx
	fffff805`525182d2 488901          mov     qword ptr [rcx],rax ; rcx.Flink = rax
	fffff805`525182d5 48894108        mov     qword ptr [rcx+8],rax ; rcx.Blink = rax
```

### CmpInitCallbacks
```
	nt!CmpInitCallbacks:
	fffff805`52b88ea4 4883ec28        sub     rsp,28h
	fffff805`52b88ea8 33c9            xor     ecx,ecx
	fffff805`52b88eaa 488d056fcdcdff  lea     rax,[nt!CallbackListHead (fffff805`52865c20)] ; rax = Head
	fffff805`52b88eb1 890dbd12ceff    mov     dword ptr [nt!CmpCallBackCount (fffff805`5286a174)],ecx
	fffff805`52b88eb7 488d150227bfff  lea     rdx,[nt!`string' (fffff805`5277b5c0)]
	fffff805`52b88ebe 48890d4bcdcdff  mov     qword ptr [nt!CmpCallbackListLock (fffff805`52865c10)],rcx
	fffff805`52b88ec5 48890d4ccdcdff  mov     qword ptr [nt!CmpContextListLock (fffff805`52865c18)],rcx
	fffff805`52b88ecc 48890d5dcdcdff  mov     qword ptr [nt!CallbackListDeleteEvent (fffff805`52865c30)],rcx
	fffff805`52b88ed3 488d0d8625d8ff  lea     rcx,[nt!CmLegacyAltitude (fffff805`5290b460)]
	fffff805`52b88eda 48890547cdcdff  mov     qword ptr [nt!CallbackListHead+0x8 (fffff805`52865c28)],rax ; Head.Blink = Head
	fffff805`52b88ee1 48890538cdcdff  mov     qword ptr [nt!CallbackListHead (fffff805`52865c20)],rax ; Head.Flink = Head
	fffff805`52b88ee8 e893d691ff      call    nt!RtlInitUnicodeString (fffff805`524a6580)
	fffff805`52b88eed 48b81400000080f7ffff mov rax,0FFFFF78000000014h
	fffff805`52b88ef7 488b00          mov     rax,qword ptr [rax]
	fffff805`52b88efa 48890537cdcdff  mov     qword ptr [nt!CmpCallbackCookie (fffff805`52865c38)],rax
	fffff805`52b88f01 488d0508c1d6ff  lea     rax,[nt!CmpCallbackContextSList (fffff805`528f5010)] ; rax = Head of Context list (singly linked list)
	fffff805`52b88f08 a80f            test    al,0Fh
	fffff805`52b88f0a 0f8520bc0900    jne     nt!CmpInitCallbacks+0x9bc8c (fffff805`52c24b30)  Branch

	nt!CmpInitCallbacks+0x6c:
	fffff805`52b88f10 33c0            xor     eax,eax
	fffff805`52b88f12 488905f7c0d6ff  mov     qword ptr [nt!CmpCallbackContextSList (fffff805`528f5010)],rax ; zero the fields
	fffff805`52b88f19 488905f8c0d6ff  mov     qword ptr [nt!CmpCallbackContextSList+0x8 (fffff805`528f5018)],rax ; zero the fields
	fffff805`52b88f20 4883c428        add     rsp,28h
	fffff805`52b88f24 c3              ret
```

### ExCreateCallback

```
	nt!ExCreateCallback+0x138:
	fffff805`52abc348 488b5df7        mov     rbx,qword ptr [rbp-9]
	fffff805`52abc34c c70343616c6c    mov     dword ptr [rbx],6C6C6143h
	fffff805`52abc352 488d4310        lea     rax,[rbx+10h]
	fffff805`52abc356 44886320        mov     byte ptr [rbx+20h],r12b
	; InitializeListHead(rax)
	fffff805`52abc35a 48894008        mov     qword ptr [rax+8],rax ; rax.Blink = rax
	fffff805`52abc35e 488900          mov     qword ptr [rax],rax ; rax.Flink = rax
	fffff805`52abc361 4883630800      and     qword ptr [rbx+8],0
	fffff805`52abc366 66ff8ee6010000  dec     word ptr [rsi+1E6h]
	fffff805`52abc36d 33d2            xor     edx,edx
	fffff805`52abc36f 488d0dea7bd7ff  lea     rcx,[nt!ExpCallbackListLock (fffff805`52833f60)]
	fffff805`52abc376 e815579eff      call    nt!ExAcquirePushLockExclusiveEx (fffff805`524a1a90)
	fffff805`52abc37b 488b0da67bd7ff  mov     rcx,qword ptr [nt!ExpCallbackListHead+0x8 (fffff805`52833f28)] ; rcx = Head.Blink
	fffff805`52abc382 488d15977bd7ff  lea     rdx,[nt!ExpCallbackListHead (fffff805`52833f20)] ; rdx = Head
	fffff805`52abc389 488d4328        lea     rax,[rbx+28h]
	fffff805`52abc38d 483911          cmp     qword ptr [rcx],rdx ; Head.Blink.Flink != Head ?
	fffff805`52abc390 0f8520781200    jne     nt!ExCreateCallback+0x1279a6 (fffff805`52be3bb6)  Branch ; __fastfail

	nt!ExCreateCallback+0x186:
	; InsertTailList(rcx, rax)
	fffff805`52abc396 48894808        mov     qword ptr [rax+8],rcx ; rax.Blink = Head.Blink
	fffff805`52abc39a 488910          mov     qword ptr [rax],rdx ; rax.Flink = Head
	fffff805`52abc39d 488901          mov     qword ptr [rcx],rax ; Head.Blink.Flink = rax
	fffff805`52abc3a0 488bce          mov     rcx,rsi ; Why couldn't this instruction wait?
	fffff805`52abc3a3 4889057e7bd7ff  mov     qword ptr [nt!ExpCallbackListHead+0x8 (fffff805`52833f28)],rax ; Head.Blink = rax
```

### ExpInitSystemPhase0

```
	Symbol found, but only zeroes at address.
```

### ExpInitSystemPhase1

```
	Symbol found, but only zeroes at address.
```

### ExpTimerInitialization

```
	Symbol found, but only zeroes at address.
```

### InitBootProcessor

```
	Symbol found, but garbage at address.
```

### IoCreateDevice

```
	nt!IoCreateDevice+0x253:
	fffff805`52a74e43 488d4350        lea     rax,[rbx+50h]
	; InitializeListHead(rax)
	fffff805`52a74e47 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a74e4b 488900          mov     qword ptr [rax],rax
```

### IoInitializeIrp

```
	nt!IoInitializeIrp+0x27:
	fffff805`52502537 440fb7c6        movzx   r8d,si
	fffff805`5250253b 33d2            xor     edx,edx
	fffff805`5250253d 488bcb          mov     rcx,rbx
	fffff805`52502540 e83b2f0d00      call    nt!memset (fffff805`525d5480)
	fffff805`52502545 66897302        mov     word ptr [rbx+2],si
	fffff805`52502549 b806000000      mov     eax,6
	fffff805`5250254e 488b742438      mov     rsi,qword ptr [rsp+38h]
	fffff805`52502553 668903          mov     word ptr [rbx],ax
	fffff805`52502556 8d4701          lea     eax,[rdi+1]
	fffff805`52502559 884343          mov     byte ptr [rbx+43h],al
	fffff805`5250255c 40887b42        mov     byte ptr [rbx+42h],dil
	fffff805`52502560 65488b042588010000 mov   rax,qword ptr gs:[188h]
	fffff805`52502569 0fb6884a020000  movzx   ecx,byte ptr [rax+24Ah]
	fffff805`52502570 488d4320        lea     rax,[rbx+20h]
	fffff805`52502574 884b46          mov     byte ptr [rbx+46h],cl
	; InitializeListHead(rax)
	fffff805`52502577 48894008        mov     qword ptr [rax+8],rax
	fffff805`5250257b 488900          mov     qword ptr [rax],rax
	fffff805`5250257e 480fbec7        movsx   rax,dil
	fffff805`52502582 488d04c0        lea     rax,[rax+rax*8]
	fffff805`52502586 488d401a        lea     rax,[rax+1Ah]
	fffff805`5250258a 488d04c3        lea     rax,[rbx+rax*8]
	fffff805`5250258e 488983b8000000  mov     qword ptr [rbx+0B8h],rax
	fffff805`52502595 488b5c2430      mov     rbx,qword ptr [rsp+30h]
	fffff805`5250259a 4883c420        add     rsp,20h
	fffff805`5250259e 5f              pop     rdi
	fffff805`5250259f c3              ret
```

### KeInitThread

```
	nt!KeInitThread:
	fffff805`529972e0 48895c2410      mov     qword ptr [rsp+10h],rbx
	fffff805`529972e5 4889742418      mov     qword ptr [rsp+18h],rsi
	fffff805`529972ea 48894c2408      mov     qword ptr [rsp+8],rcx
	fffff805`529972ef 57              push    rdi
	fffff805`529972f0 4154            push    r12
	fffff805`529972f2 4155            push    r13
	fffff805`529972f4 4156            push    r14
	fffff805`529972f6 4157            push    r15
	fffff805`529972f8 4883ec40        sub     rsp,40h
	fffff805`529972fc 4d8be1          mov     r12,r9
	fffff805`529972ff 4d8be8          mov     r13,r8
	fffff805`52997302 488bf2          mov     rsi,rdx
	fffff805`52997305 488bf9          mov     rdi,rcx
	fffff805`52997308 488d4108        lea     rax,[rcx+8] ; rax = _ETHREAD._KTHREAD._DISPATCHER_HEADER.WaitListHead
	; InitializeListHead(rax)
	fffff805`5299730c 48894008        mov     qword ptr [rax+8],rax
	fffff805`52997310 488900          mov     qword ptr [rax],rax
	fffff805`52997313 488d8108030000  lea     rax,[rcx+308h] ; rax = _ETHREAD._KTHREAD.MutantListHead
	; InitializeListHead(rax)
	fffff805`5299731a 48894008        mov     qword ptr [rax+8],rax
	fffff805`5299731e 488900          mov     qword ptr [rax],rax
	fffff805`52997321 488d8158010000  lea     rax,[rcx+158h]
	fffff805`52997328 b904000000      mov     ecx,4
	fffff805`5299732d 8d59fd          lea     ebx,[rcx-3]

	nt!KeInitThread+0x5c:
	fffff805`5299733c 4c8bb424a8000000 mov     r14,qword ptr [rsp+0A8h]
	fffff805`52997344 418b8eb8010000  mov     ecx,dword ptr [r14+1B8h]
	fffff805`5299734b 23cb            and     ecx,ebx
	fffff805`5299734d 81c910800000    or      ecx,8010h
	fffff805`52997353 c1e102          shl     ecx,2
	fffff805`52997356 8b4778          mov     eax,dword ptr [rdi+78h]
	fffff805`52997359 83e0fb          and     eax,0FFFFFFFBh
	fffff805`5299735c 0bc8            or      ecx,eax
	fffff805`5299735e 894f78          mov     dword ptr [rdi+78h],ecx
	fffff805`52997361 8b05a5d2fdff    mov     eax,dword ptr [nt!KiShortExecutionCycles (fffff805`5297460c)]
	fffff805`52997367 c1e004          shl     eax,4
	fffff805`5299736a 894754          mov     dword ptr [rdi+54h],eax
	fffff805`5299736d 488d8798000000  lea     rax,[rdi+98h] ; rax = _ETHREAD._KTHREAD.ApcListHead[0]
	; InitializeListHead(rax)
	fffff805`52997374 48894008        mov     qword ptr [rax+8],rax
	fffff805`52997378 488900          mov     qword ptr [rax],rax
	fffff805`5299737b 488d87a8000000  lea     rax,[rdi+0A8h] ; rax = _ETHREAD._KTHREAD.ApcListHead[1]
	; InitializeListHead(rax)
	fffff805`52997382 48894008        mov     qword ptr [rax+8],rax
	fffff805`52997386 488900          mov     qword ptr [rax],rax

	nt!KeInitThread+0xd2:
	fffff805`529973b2 488d8f88020000  lea     rcx,[rdi+288h]
	fffff805`529973b9 48897c2438      mov     qword ptr [rsp+38h],rdi
	fffff805`529973be c644243000      mov     byte ptr [rsp+30h],0
	fffff805`529973c3 488d056601b3ff  lea     rax,[nt!KiSchedulerApc (fffff805`524c7530)]
	fffff805`529973ca 4889442428      mov     qword ptr [rsp+28h],rax
	fffff805`529973cf 488d057aecbdff  lea     rax,[nt!EmpCheckErrataList (fffff805`52576050)]
	fffff805`529973d6 4889442420      mov     qword ptr [rsp+20h],rax
	fffff805`529973db 4c8d0d6eecbdff  lea     r9,[nt!EmpCheckErrataList (fffff805`52576050)]
	fffff805`529973e2 4533c0          xor     r8d,r8d
	fffff805`529973e5 488bd7          mov     rdx,rdi
	fffff805`529973e8 e88306b3ff      call    nt!KeInitializeApc (fffff805`524c7a70)
	fffff805`529973ed 488d8fe0020000  lea     rcx,[rdi+2E0h]
	fffff805`529973f4 448ac3          mov     r8b,bl
	fffff805`529973f7 33d2            xor     edx,edx
	fffff805`529973f9 e8321bb0ff      call    nt!KeInitializeEvent (fffff805`52498f30)
	fffff805`529973fe 488d9f00010000  lea     rbx,[rdi+100h]
	fffff805`52997405 33d2            xor     edx,edx
	fffff805`52997407 488bcb          mov     rcx,rbx
	fffff805`5299740a e8d106b3ff      call    nt!KeInitializeTimerEx (fffff805`524c7ae0)
	fffff805`5299740f 488b15e2d4fdff  mov     rdx,qword ptr [nt!KiWaitAlways (fffff805`529748f8)]
	fffff805`52997416 480fca          bswap   rdx
	fffff805`52997419 4833d3          xor     rdx,rbx
	fffff805`5299741c 488b05d5d2fdff  mov     rax,qword ptr [nt!KiWaitNever (fffff805`529746f8)]
	fffff805`52997423 8bc8            mov     ecx,eax
	fffff805`52997425 48d3ca          ror     rdx,cl
	fffff805`52997428 4833d0          xor     rdx,rax
	fffff805`5299742b 48895330        mov     qword ptr [rbx+30h],rdx
	fffff805`5299742f 488d87d0010000  lea     rax,[rdi+1D0h]
	fffff805`52997436 c7401001040201  mov     dword ptr [rax+10h],1020401h
	fffff805`5299743d 41ba01000000    mov     r10d,1
	fffff805`52997443 4883c308        add     rbx,8
	fffff805`52997447 488b0b          mov     rcx,qword ptr [rbx] ; rcx = rbx.Flink
	fffff805`5299744a 48395908        cmp     qword ptr [rcx+8],rbx ; rbx.Flink.Blink != rbx ?
	fffff805`5299744e 0f85fafc0000    jne     nt!KeInitThread+0xfe6e (fffff805`529a714e)  Branch ; __fastfail

	nt!KeInitThread+0x174:
	; InsertHeadList(rbx, rax)
	fffff805`52997454 488908          mov     qword ptr [rax],rcx
	fffff805`52997457 48895808        mov     qword ptr [rax+8],rbx
	fffff805`5299745b 48894108        mov     qword ptr [rcx+8],rax
	fffff805`5299745f 488903          mov     qword ptr [rbx],rax
```

### KeInitializeMutex (calls KiInitializeMutant)

```
	nt!KiInitializeMutant:
	fffff805`52406488 48895c2408      mov     qword ptr [rsp+8],rbx
	fffff805`5240648d 48896c2418      mov     qword ptr [rsp+18h],rbp
	fffff805`52406492 56              push    rsi
	fffff805`52406493 57              push    rdi
	fffff805`52406494 4154            push    r12
	fffff805`52406496 4156            push    r14
	fffff805`52406498 4157            push    r15
	fffff805`5240649a 4883ec20        sub     rsp,20h
	fffff805`5240649e 8ada            mov     bl,dl
	fffff805`524064a0 458af8          mov     r15b,r8b
	fffff805`524064a3 33d2            xor     edx,edx
	fffff805`524064a5 488bf9          mov     rdi,rcx ; Assuming rcx = _KMUTANT
	fffff805`524064a8 448d4238        lea     r8d,[rdx+38h]
	fffff805`524064ac e8cfef1c00      call    nt!memset (fffff805`525d5480)
	fffff805`524064b1 41bc02000000    mov     r12d,2
	fffff805`524064b7 84db            test    bl,bl
	fffff805`524064b9 448827          mov     byte ptr [rdi],r12b
	fffff805`524064bc 418d5c24ff      lea     ebx,[r12-1]
	fffff805`524064c1 752d            jne     nt!KiInitializeMutant+0x68 (fffff805`524064f0)  Branch

	nt!KiInitializeMutant+0xb6:
	fffff805`5240653e 488d8508030000  lea     rax,[rbp+308h] ; rax = _KTHREAD.MutantListHead (assuming rbp+308h points to _KTHREAD)
	fffff805`52406545 488b5008        mov     rdx,qword ptr [rax+8] ; rdx = _KTHREAD.MutantListHead.Blink
	fffff805`52406549 488d4f18        lea     rcx,[rdi+18h] ; rcx = _KMUTANT.MutantListEntry
	fffff805`5240654d 483902          cmp     qword ptr [rdx],rax ; MutantListHead.Blink.Flink != _KTHREAD.MutantListHead
	fffff805`52406550 0f855d9b1d00    jne     nt!KiInitializeMutant+0x1d9c2b (fffff805`525e00b3)  Branch ; __fastfail

	nt!KiInitializeMutant+0xce:
	; InsertTailList(_KTHREAD.MutantListHead, _KMUTANT.MutantListEntry)
	fffff805`52406556 488901          mov     qword ptr [rcx],rax ; _KMUTANT.MutantListEntry.Flink = _KTHREAD.MutantListHead
	fffff805`52406559 48895108        mov     qword ptr [rcx+8],rdx ; _KMUTANT.MutantListEntry.Blink = _KTHREAD.MutantListHead.Blink
	fffff805`5240655d 48890a          mov     qword ptr [rdx],rcx ; _KTHREAD.MutantListHead.Blink.Flink = _KMUTANT.MutantListEntry
	fffff805`52406560 48894808        mov     qword ptr [rax+8],rcx ; _KTHREAD.MutantListHead.Blink = _KMUTANT.MutantListEntry
```

KeInitializeProcess

```
	nt!KeInitializeProcess:
	fffff805`52a58038 48895c2408      mov     qword ptr [rsp+8],rbx
	fffff805`52a5803d 48896c2410      mov     qword ptr [rsp+10h],rbp
	fffff805`52a58042 4889742418      mov     qword ptr [rsp+18h],rsi
	fffff805`52a58047 57              push    rdi
	fffff805`52a58048 4154            push    r12
	fffff805`52a5804a 4156            push    r14
	fffff805`52a5804c 4883ec20        sub     rsp,20h
	fffff805`52a58050 c60103          mov     byte ptr [rcx],3
	fffff805`52a58053 488d4108        lea     rax,[rcx+8] ; rax = _KPROCESS._DISPATCHER_HEADER.WaitListHead. Assuming rcx = _KPROCESS
	fffff805`52a58057 c64102b8        mov     byte ptr [rcx+2],0B8h
	fffff805`52a5805b 498bf8          mov     rdi,r8
	; InitializeListHead(rax)
	fffff805`52a5805e 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a58062 488bd9          mov     rbx,rcx
	fffff805`52a58065 488900          mov     qword ptr [rax],rax
	fffff805`52a58068 33f6            xor     esi,esi
	fffff805`52a5806a 8891c0010000    mov     byte ptr [rcx+1C0h],dl
	fffff805`52a58070 41b8a0000000    mov     r8d,0A0h
	fffff805`52a58076 21b114010000    and     dword ptr [rcx+114h],esi
	fffff805`52a5807c 33d2            xor     edx,edx
	fffff805`52a5807e c7811001000014001400 mov dword ptr [rcx+110h],140014h
	fffff805`52a58088 498be9          mov     rbp,r9
	fffff805`52a5808b 4881c118010000  add     rcx,118h
	fffff805`52a58092 e8e9d3b7ff      call    nt!memset (fffff805`525d5480)
	fffff805`52a58097 448d7601        lea     r14d,[rsi+1]
	fffff805`52a5809b 4484742468      test    byte ptr [rsp+68h],r14b
	fffff805`52a580a0 0f85c7000000    jne     nt!KeInitializeProcess+0x135 (fffff805`52a5816d)  Branch

	nt!KeInitializeProcess+0x9a:
	fffff805`52a580d2 0fb7c1          movzx   eax,cx
	fffff805`52a580d5 480954c358      or      qword ptr [rbx+rax*8+58h],rdx
	fffff805`52a580da 418bd6          mov     edx,r14d
	fffff805`52a580dd 8a4f08          mov     cl,byte ptr [rdi+8]
	fffff805`52a580e0 d3e2            shl     edx,cl
	fffff805`52a580e2 488bcb          mov     rcx,rbx
	fffff805`52a580e5 e8bad8a7ff      call    nt!KeSetGroupMaskProcess (fffff805`524d59a4)
	fffff805`52a580ea 488d4318        lea     rax,[rbx+18h] ; rax = _KPROCESS.ProfileListHead
	fffff805`52a580ee 488bd5          mov     rdx,rbp
	; InitializeListHead(rax)
	fffff805`52a580f1 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a580f5 488900          mov     qword ptr [rax],rax
	fffff805`52a580f8 488d83f8000000  lea     rax,[rbx+0F8h] ; rax = _KPROCESS.ReadyListHead
	; InitializeListHead(rax)
	fffff805`52a580ff 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a58103 488900          mov     qword ptr [rax],rax
	fffff805`52a58106 488d4330        lea     rax,[rbx+30h] ; rax = _KPROCESS.ThreadListHead
	; InitializeListHead(rax)
	fffff805`52a5810a 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a5810e 488900          mov     qword ptr [rax],rax
```

### KeInitializeTimerEx

```
	nt!KeInitializeTimerEx:
	fffff805`524c7ae0 4533c0          xor     r8d,r8d
	fffff805`524c7ae3 488d4108        lea     rax,[rcx+8] ; rax = _KTIMER._DISPATCHER_HEADER.WaitListHead
	fffff805`524c7ae7 4c8901          mov     qword ptr [rcx],r8
	fffff805`524c7aea 80c208          add     dl,8
	fffff805`524c7aed 8811            mov     byte ptr [rcx],dl
	; InitializeListHead(rax)
	fffff805`524c7aef 48894008        mov     qword ptr [rax+8],rax
	fffff805`524c7af3 488900          mov     qword ptr [rax],rax
	fffff805`524c7af6 4c894118        mov     qword ptr [rcx+18h],r8
	fffff805`524c7afa 4c894138        mov     qword ptr [rcx+38h],r8
	fffff805`524c7afe c3              ret
```

### KeInitializeTimerTable

```
	nt!KeInitializeTimerTable+0x97:
	fffff805`52b4baf7 488360f800      and     qword ptr [rax-8],0
	; InitializeListHead(rax)
	fffff805`52b4bafc 48894008        mov     qword ptr [rax+8],rax
	fffff805`52b4bb00 488900          mov     qword ptr [rax],rax
```

### KiInitializeProcessor

```
	Can't find any list related code in function.
```

### KiInitializeThread

```
	Symbol not found.
```

### MiInitializeLoadedModuleList

```
	Symbol found but memory zeroed.
```

### MiInitializePrefetchHead

```
	Symbol not found.
```

### PspAllocateProcess

```
	nt!PspAllocateProcess+0x32b:
	fffff805`52a54857 ba50734372      mov     edx,72437350h
	fffff805`52a5485c 488b4c2470      mov     rcx,qword ptr [rsp+70h]
	fffff805`52a54861 e83a5c9cff      call    nt!ObfReferenceObjectWithTag (fffff805`5241a4a0)
	fffff805`52a54866 ba44666c74      mov     edx,746C6644h
	fffff805`52a5486b 488b4c2470      mov     rcx,qword ptr [rsp+70h]
	fffff805`52a54870 e85bdfa4ff      call    nt!ObfDereferenceObjectWithTag (fffff805`524a27d0)
	fffff805`52a54875 458bc7          mov     r8d,r15d
	fffff805`52a54878 33d2            xor     edx,edx
	fffff805`52a5487a 488b4c2470      mov     rcx,qword ptr [rsp+70h]
	fffff805`52a5487f e8fc0bb8ff      call    nt!memset (fffff805`525d5480)
	fffff805`52a54884 488b4c2470      mov     rcx,qword ptr [rsp+70h]
	fffff805`52a54889 e81e390000      call    nt!LpcInitializeProcess (fffff805`52a581ac)
	fffff805`52a5488e 488b4c2470      mov     rcx,qword ptr [rsp+70h]
	fffff805`52a54893 4881c100030000  add     rcx,300h
	fffff805`52a5489a e841c3a6ff      call    nt!ExInitializePushLock (fffff805`524c0be0)
	fffff805`52a5489f 488b4c2470      mov     rcx,qword ptr [rsp+70h]
	fffff805`52a548a4 e8672ccbff      call    nt!PspInitializeProcessLock (fffff805`52707510)
	fffff805`52a548a9 488b442470      mov     rax,qword ptr [rsp+70h]
	fffff805`52a548ae 480588040000    add     rax,488h ; rax = _EPROCESS.ThreadListHead
	; InitializeListHead(rax)
	fffff805`52a548b4 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a548b8 488900          mov     qword ptr [rax],rax
	fffff805`52a548bb 488b442470      mov     rax,qword ptr [rsp+70h]
	fffff805`52a548c0 480520070000    add     rax,720h ; rax = _EPROCESS.SvmProcessDeviceListHead
	; InitializeListHead(rax)
	fffff805`52a548c6 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a548ca 488900          mov     qword ptr [rax],rax
	fffff805`52a548cd 488b442470      mov     rax,qword ptr [rsp+70h]
	fffff805`52a548d2 480510080000    add     rax,810h ; rax = _EPROCESS.VirtualTimerListHead
	; InitializeListHead(rax)
	fffff805`52a548d8 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a548dc 488900          mov     qword ptr [rax],rax
```

### PspAllocateThread

```
	nt!PspAllocateThread+0x31c:
	fffff805`52a26f10 488d9ed0060000  lea     rbx,[rsi+6D0h]
	fffff805`52a26f17 48899c24c8000000 mov     qword ptr [rsp+0C8h],rbx
	fffff805`52a26f1f 48893b          mov     qword ptr [rbx],rdi
	fffff805`52a26f22 c786d806000007000000 mov dword ptr [rsi+6D8h],7
	fffff805`52a26f2c 488d8e58060000  lea     rcx,[rsi+658h]
	fffff805`52a26f33 33d2            xor     edx,edx
	fffff805`52a26f35 448d4201        lea     r8d,[rdx+1]
	fffff805`52a26f39 e8c2e9a6ff      call    nt!KeInitializeSemaphore (fffff805`52495900)
	fffff805`52a26f3e 488d8608060000  lea     rax,[rsi+608h] ; rax = _ETHREAD.KeyedWaitChain
	; InitializeListHead(rax)
	fffff805`52a26f45 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a26f49 488900          mov     qword ptr [rax],rax
	fffff805`52a26f4c 488d8628070000  lea     rax,[rsi+728h] ; rax = _ETHREAD.BoostList
	; InitializeListHead(rax)
	fffff805`52a26f53 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a26f57 488900          mov     qword ptr [rax],rax
	fffff805`52a26f5a 488d8638070000  lea     rax,[rsi+738h] ; rax = _ETHREAD.DeboostList
	; InitializeListHead(rax)
	fffff805`52a26f61 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a26f65 488900          mov     qword ptr [rax],rax
	fffff805`52a26f68 4889be48070000  mov     qword ptr [rsi+748h],rdi
	fffff805`52a26f6f 488d8690070000  lea     rax,[rsi+790h] ; rax = _ETHREAD.PropertySet.ListHeader
	; InitializeListHead(rax)
	fffff805`52a26f76 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a26f7a 488900          mov     qword ptr [rax],rax
	fffff805`52a26f7d 48897810        mov     qword ptr [rax+10h],rdi
	fffff805`52a26f81 488d8680060000  lea     rax,[rsi+680h] ; rax = _ETHREAD.IrpList
	; InitializeListHead(rax)
	fffff805`52a26f88 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a26f8c 488900          mov     qword ptr [rax],rax
	fffff805`52a26f8f 4889be50070000  mov     qword ptr [rsi+750h],rdi
	fffff805`52a26f96 4889be30060000  mov     qword ptr [rsi+630h],rdi
	fffff805`52a26f9d 488d8638060000  lea     rax,[rsi+638h] ; rax = _ETHREAD.ActiveTimerListHead
	; InitializeListHead(rax)
	fffff805`52a26fa4 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a26fa8 488900          mov     qword ptr [rax],rax
	fffff805`52a26fab 48c786d8070000fdffffff mov qword ptr [rsi+7D8h],0FFFFFFFFFFFFFFFDh
	fffff805`52a26fb6 e8890eaaff      call    nt!KeQuerySystemTimeUnsafe (fffff805`524c7e44)
	fffff805`52a26fbb 4885c0          test    rax,rax
	fffff805`52a26fbe 0f84d2040000    je      nt!PspAllocateThread+0x8a2 (fffff805`52a27496)  Branch

	nt!PspAllocateThread+0x3dc:
	fffff805`52a26fd0 488d86f8070000  lea     rax,[rsi+7F8h] ; rax = _ETHREAD.OwnerEntryListHead
	; InitializeListHead(rax)
	fffff805`52a26fd7 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a26fdb 488900          mov     qword ptr [rax],rax
	fffff805`52a26fde 4889be08080000  mov     qword ptr [rsi+808h],rdi
	fffff805`52a26fe5 488d8610080000  lea     rax,[rsi+810h] ; rax = _ETHREAD.DisownedOwnerEntryListHead
	; InitializeListHead(rax)
	fffff805`52a26fec 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a26ff0 488900          mov     qword ptr [rax],rax
```
