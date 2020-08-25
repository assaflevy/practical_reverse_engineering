# Exercise
Repeat the previous exercise for InsertTailList in the following routines:

■ AlpcpCreateClientPort<br>
■ AlpcpCreateSection<br>
■ AlpcpCreateView<br>
■ AuthzBasepAddSecurityAttributeToLists<br>
■ CcFlushCachePriv<br>
■ CcInitializeCacheManager<br>
■ CcInsertVacbArray<br>
■ CcSetFileSizesEx<br>
■ CmRenameKey<br>
■ ExAllocatePoolWithTag<br>
■ ExFreePoolWithTag<br>
■ ExQueueWorkItem<br>
■ ExRegisterCallback<br>
■ ExpSetTimer<br>
■ IoSetIoCompletionEx2<br>
■ KeInsertQueueDpc<br>
■ KeStartThread<br>
■ KiAddThreadToScbQueue<br>
■ KiInsertQueueApc<br>
■ KiQueueReadyThread<br>
■ MiInsertNewProcess<br>
■ PnpRequestDeviceAction<br>
■ PspInsertProcess<br>
■ PspInsertThread

# Solution

### AlpcpCreateClientPort

```
	nt!AlpcpCreateClientPort+0x1c7:
	fffff805`52a47c5f 48894710        mov     qword ptr [rdi+10h],rax
	fffff805`52a47c63 4c8d6840        lea     r13,[rax+40h]
	fffff805`52a47c67 49894d00        mov     qword ptr [r13],rcx
	fffff805`52a47c6b 33d2            xor     edx,edx
	fffff805`52a47c6d 48894808        mov     qword ptr [rax+8],rcx
	fffff805`52a47c71 4c8930          mov     qword ptr [rax],r14
	fffff805`52a47c74 48897810        mov     qword ptr [rax+10h],rdi
	fffff805`52a47c78 498b4e10        mov     rcx,qword ptr [r14+10h]
	fffff805`52a47c7c 4883e910        sub     rcx,10h
	fffff805`52a47c80 e80b9ea5ff      call    nt!ExAcquirePushLockExclusiveEx (fffff805`524a1a90)
	fffff805`52a47c85 498dbe60010000  lea     rdi,[r14+160h]
	fffff805`52a47c8c 33d2            xor     edx,edx
	fffff805`52a47c8e 488bcf          mov     rcx,rdi
	fffff805`52a47c91 e8fa9da5ff      call    nt!ExAcquirePushLockExclusiveEx (fffff805`524a1a90)
	fffff805`52a47c96 498b4610        mov     rax,qword ptr [r14+10h]
	fffff805`52a47c9a 488b4df0        mov     rcx,qword ptr [rbp-10h]
	fffff805`52a47c9e 4883c018        add     rax,18h
	fffff805`52a47ca2 4883c118        add     rcx,18h
	fffff805`52a47ca6 488b5008        mov     rdx,qword ptr [rax+8] ; rdx = rax.Blink
	fffff805`52a47caa 483902          cmp     qword ptr [rdx],rax ; rax.Blink.Flink != rax ?
	fffff805`52a47cad 0f85d7f91700    jne     nt!AlpcpCreateClientPort+0x17fbf2 (fffff805`52bc768a)  Branch ; __fastfail

	nt!AlpcpCreateClientPort+0x21b:
	; InsertTailList(rax, rcx)
	fffff805`52a47cb3 488901          mov     qword ptr [rcx],rax
	fffff805`52a47cb6 48895108        mov     qword ptr [rcx+8],rdx
	fffff805`52a47cba 48890a          mov     qword ptr [rdx],rcx
	fffff805`52a47cbd 48894808        mov     qword ptr [rax+8],rcx
	fffff805`52a47cc1 488bc3          mov     rax,rbx
	fffff805`52a47cc4 f0480fc107      lock xadd qword ptr [rdi],rax
	fffff805`52a47cc9 2406            and     al,6
	fffff805`52a47ccb 3c02            cmp     al,2
	fffff805`52a47ccd 0f84bf010000    je      nt!AlpcpCreateClientPort+0x3fa (fffff805`52a47e92)  Branch
```

### AlpcpCreateSection

```
	nt!AlpcpCreateSection+0x7f:
	fffff805`529cc50b 33d2            xor     edx,edx
	fffff805`529cc50d 488bcb          mov     rcx,rbx
	fffff805`529cc510 448d4248        lea     r8d,[rdx+48h]
	fffff805`529cc514 e8678fc0ff      call    nt!memset (fffff805`525d5480)
	fffff805`529cc519 65488b042588010000 mov   rax,qword ptr gs:[188h]
	fffff805`529cc522 488b88b8000000  mov     rcx,qword ptr [rax+0B8h]
	fffff805`529cc529 48894b20        mov     qword ptr [rbx+20h],rcx
	fffff805`529cc52d 8b0d1d80faff    mov     ecx,dword ptr [nt!AlpcpRegionGranularity (fffff805`52974550)]
	fffff805`529cc533 8d51ff          lea     edx,[rcx-1]
	fffff805`529cc536 48039424a0000000 add     rdx,qword ptr [rsp+0A0h]
	fffff805`529cc53e 488d41ff        lea     rax,[rcx-1]
	fffff805`529cc542 48f7d0          not     rax
	fffff805`529cc545 4823d0          and     rdx,rax
	fffff805`529cc548 488d4338        lea     rax,[rbx+38h]
	fffff805`529cc54c 48895308        mov     qword ptr [rbx+8],rdx
	; InitializeHeadList(rax)
	fffff805`529cc550 48894008        mov     qword ptr [rax+8],rax
	fffff805`529cc554 488900          mov     qword ptr [rax],rax
	fffff805`529cc557 4885ff          test    rdi,rdi
	fffff805`529cc55a 743f            je      nt!AlpcpCreateSection+0x10f (fffff805`529cc59b)  Branch
```

### AlpcpCreateView

```
	nt!AlpcpCreateView+0x109:
	fffff805`529d0081 488b4540        mov     rax,qword ptr [rbp+40h]
	fffff805`529d0085 ba416c7063      mov     edx,63706C41h
	fffff805`529d008a 48894628        mov     qword ptr [rsi+28h],rax
	fffff805`529d008e 488b4548        mov     rax,qword ptr [rbp+48h]
	fffff805`529d0092 48894630        mov     qword ptr [rsi+30h],rax
	fffff805`529d0096 8b4648          mov     eax,dword ptr [rsi+48h]
	fffff805`529d0099 83e0f7          and     eax,0FFFFFFF7h
	fffff805`529d009c 0bc1            or      eax,ecx
	fffff805`529d009e 498bcd          mov     rcx,r13
	fffff805`529d00a1 83c801          or      eax,1
	fffff805`529d00a4 894648          mov     dword ptr [rsi+48h],eax
	fffff805`529d00a7 e8f4a3a4ff      call    nt!ObfReferenceObjectWithTag (fffff805`5241a4a0)
	fffff805`529d00ac 498bcf          mov     rcx,r15
	fffff805`529d00af 4c896e20        mov     qword ptr [rsi+20h],r13
	fffff805`529d00b3 e8980fadff      call    nt!ObfReferenceObject (fffff805`524a1050)
	fffff805`529d00b8 488bcf          mov     rcx,rdi
	fffff805`529d00bb 4c897e18        mov     qword ptr [rsi+18h],r15
	fffff805`529d00bf e87c190000      call    nt!AlpcpReferenceBlob (fffff805`529d1a40)
	fffff805`529d00c4 48897e10        mov     qword ptr [rsi+10h],rdi
	fffff805`529d00c8 488d4f38        lea     rcx,[rdi+38h]
	fffff805`529d00cc 488b4108        mov     rax,qword ptr [rcx+8]
	fffff805`529d00d0 488bd6          mov     rdx,rsi
	; InsertTailList(rcx, rsi)
	fffff805`529d00d3 48890e          mov     qword ptr [rsi],rcx ; rsi.Flink = rcx
	fffff805`529d00d6 48894608        mov     qword ptr [rsi+8],rax ; rsi.Blink = rcx.Blink
	fffff805`529d00da 488b4108        mov     rax,qword ptr [rcx+8]
	fffff805`529d00de 488930          mov     qword ptr [rax],rsi ; rcx.Blink.Flink = rsi
	fffff805`529d00e1 48897108        mov     qword ptr [rcx+8],rsi ; rcx.Blink = rsi
	fffff805`529d00e5 498bcf          mov     rcx,r15
	fffff805`529d00e8 ff4734          inc     dword ptr [rdi+34h]
	fffff805`529d00eb e8dc000000      call    nt!AlpcpInsertResourcePort (fffff805`529d01cc)
	fffff805`529d00f0 498d9d80060000  lea     rbx,[r13+680h]
	fffff805`529d00f7 33d2            xor     edx,edx
	fffff805`529d00f9 488bcb          mov     rcx,rbx
	fffff805`529d00fc e88f19adff      call    nt!ExAcquirePushLockExclusiveEx (fffff805`524a1a90)
	fffff805`529d0101 498d8d88060000  lea     rcx,[r13+688h]
	fffff805`529d0108 488b4108        mov     rax,qword ptr [rcx+8]
	fffff805`529d010c 488d5650        lea     rdx,[rsi+50h]
	; InsertTailList(rcx, rdx)
	fffff805`529d0110 48894208        mov     qword ptr [rdx+8],rax
	fffff805`529d0114 48890a          mov     qword ptr [rdx],rcx
	fffff805`529d0117 488b4108        mov     rax,qword ptr [rcx+8]
	fffff805`529d011b 488910          mov     qword ptr [rax],rdx
	fffff805`529d011e 4883c8ff        or      rax,0FFFFFFFFFFFFFFFFh
	fffff805`529d0122 48895108        mov     qword ptr [rcx+8],rdx
	fffff805`529d0126 f0480fc103      lock xadd qword ptr [rbx],rax
	fffff805`529d012b 2406            and     al,6
	fffff805`529d012d 3c02            cmp     al,2
	fffff805`529d012f 0f8482000000    je      nt!AlpcpCreateView+0x23f (fffff805`529d01b7)  Branch
```

### AuthzBasepAddSecurityAttributeToLists

```
	nt!AuthzBasepAddSecurityAttributeToLists+0xf:
	fffff805`524d2a17 488d4120        lea     rax,[rcx+20h]
	fffff805`524d2a1b 4c8b4808        mov     r9,qword ptr [rax+8] ; r9 = rax.Blink
	fffff805`524d2a1f 4c8d4210        lea     r8,[rdx+10h]
	fffff805`524d2a23 493901          cmp     qword ptr [r9],rax ; rax.Blink.Flink != r9 ?
	fffff805`524d2a26 0f8551fb1500    jne     nt!AuthzBasepAddSecurityAttributeToLists+0x15fb75 (fffff805`5263257d)  Branch ; __fastfail

	nt!AuthzBasepAddSecurityAttributeToLists+0x24:
	; InsertTailList(rax, r8)
	fffff805`524d2a2c 498900          mov     qword ptr [r8],rax
	fffff805`524d2a2f 4d894808        mov     qword ptr [r8+8],r9
	fffff805`524d2a33 4d8901          mov     qword ptr [r9],r8
	fffff805`524d2a36 4c894008        mov     qword ptr [rax+8],r8
	fffff805`524d2a3a 834a3802        or      dword ptr [rdx+38h],2
	fffff805`524d2a3e ff4118          inc     dword ptr [rcx+18h]

	nt!AuthzBasepAddSecurityAttributeToLists+0x15fb53:
	fffff805`5263255b 488d4108        lea     rax,[rcx+8]
	fffff805`5263255f 4c8b4008        mov     r8,qword ptr [rax+8] ; r8 = rax.Blink
	fffff805`52632563 493900          cmp     qword ptr [r8],rax ; rax.Blink.Flink != rax ?
	fffff805`52632566 7515            jne     nt!AuthzBasepAddSecurityAttributeToLists+0x15fb75 (fffff805`5263257d)  Branch ; __fastfail

	nt!AuthzBasepAddSecurityAttributeToLists+0x15fb60:
	; InsertTailList(rax, rdx)
	fffff805`52632568 488902          mov     qword ptr [rdx],rax
	fffff805`5263256b 4c894208        mov     qword ptr [rdx+8],r8
	fffff805`5263256f 498910          mov     qword ptr [r8],rdx
	fffff805`52632572 48895008        mov     qword ptr [rax+8],rdx
	fffff805`52632576 834a3801        or      dword ptr [rdx+38h],1
	fffff805`5263257a ff01            inc     dword ptr [rcx]
	fffff805`5263257c c3              ret
```

### CcFlushCachePriv

```
	Can't find list related code.
```

### CcInitializeCacheManager

```
	Symbol found but garbage.
```

### CcInsertVacbArray

```
	nt!CcInsertVacbArray+0x4f:
	fffff805`5258fd47 33d2            xor     edx,edx
	fffff805`5258fd49 4c8d1dc05f2d00  lea     r11,[nt!CcVacbFreeList (fffff805`52865d10)] ; r11 = Head

	nt!CcInsertVacbArray+0x70:
	fffff805`5258fd68 488b0da95f2d00  mov     rcx,qword ptr [nt!CcVacbFreeList+0x8 (fffff805`52865d18)] ; rcx = Head.Blink
	fffff805`5258fd6f 4c3919          cmp     qword ptr [rcx],r11 ; Head.Blink.Flink != Head?
	fffff805`5258fd72 0f8517680e00    jne     nt!CcInsertVacbArray+0xe6897 (fffff805`5267658f)  Branch ; __fastfail

	nt!CcInsertVacbArray+0x80:
	; InsertTailList(r11, rax)
	fffff805`5258fd78 4c8918          mov     qword ptr [rax],r11
	fffff805`5258fd7b 48894808        mov     qword ptr [rax+8],rcx
	fffff805`5258fd7f 488901          mov     qword ptr [rcx],rax
	fffff805`5258fd82 ff05705f2d00    inc     dword ptr [nt!CcNumberOfFreeVacbs (fffff805`52865cf8)]
	fffff805`5258fd88 488905895f2d00  mov     qword ptr [nt!CcVacbFreeList+0x8 (fffff805`52865d18)],rax

	nt!CcInsertVacbArray+0xe686d:
	fffff805`52676565 498d8a48030000  lea     rcx,[r10+348h]
	fffff805`5267656c 4c8b4108        mov     r8,qword ptr [rcx+8] ; r8 = rcx.Blink
	fffff805`52676570 493908          cmp     qword ptr [r8],rcx ; rcx.Blink.Flink != rcx ?
	fffff805`52676573 751a            jne     nt!CcInsertVacbArray+0xe6897 (fffff805`5267658f)  Branch ; __fastfail

	nt!CcInsertVacbArray+0xe687d:
	; InsertTailList(rcx, rax)
	fffff805`52676575 488908          mov     qword ptr [rax],rcx
	fffff805`52676578 4c894008        mov     qword ptr [rax+8],r8
	fffff805`5267657c 498900          mov     qword ptr [r8],rax
	fffff805`5267657f 48894108        mov     qword ptr [rcx+8],rax
	fffff805`52676583 41ff8258030000  inc     dword ptr [r10+358h]
	fffff805`5267658a e90098f1ff      jmp     nt!CcInsertVacbArray+0x97 (fffff805`5258fd8f)  Branch

### CcSetFileSizesEx

```
	Can't find list related code.
```
	
### CmRenameKey

```
	Can't find list related code.
```

### ExAllocatePoolWithTag (calls ExAllocateHeapPool (RtlpHpLfhSlotAllocate))

```
	nt!RtlpHpLfhSlotAllocate+0x3e3:
	fffff805`5249bb83 488b16          mov     rdx,qword ptr [rsi] ; rdx = rsi.Flink
	fffff805`5249bb86 488b4608        mov     rax,qword ptr [rsi+8] ; rax = rsi.Blink
	fffff805`5249bb8a 48397208        cmp     qword ptr [rdx+8],rsi ; rsi.Flink.Blink != rsi ?
	fffff805`5249bb8e 0f8594391800    jne     nt!RtlpHpLfhSlotAllocate+0x183d88 (fffff805`5261f528)  Branch ; __fastfail

	nt!RtlpHpLfhSlotAllocate+0x3f4:
	fffff805`5249bb94 483930          cmp     qword ptr [rax],rsi ; rsi.Blink.Flink != rsi ?
	fffff805`5249bb97 0f858b391800    jne     nt!RtlpHpLfhSlotAllocate+0x183d88 (fffff805`5261f528)  Branch ; __fastfail

	nt!RtlpHpLfhSlotAllocate+0x3fd:
	; RemoveEntryList(rsi)
	fffff805`5249bb9d 488910          mov     qword ptr [rax],rdx ; rsi.Blink.Flink = rsi.Flink
	fffff805`5249bba0 48894208        mov     qword ptr [rdx+8],rax ; rsi.Flink.Blink = rsi.Blink
	fffff805`5249bba4 4d85c0          test    r8,r8
	fffff805`5249bba7 7403            je      nt!RtlpHpLfhSlotAllocate+0x40c (fffff805`5249bbac)  Branch
```

### ExFreePoolWithTag (see exercize 2)

### ExQueueWorkItem (jumps to KeInsertPriQueue)

```
	nt!KeInsertPriQueue+0x261:
	fffff805`524855d1 41ff4704        inc     dword ptr [r15+4]
	fffff805`524855d5 498d4f18        lea     rcx,[r15+18h]
	fffff805`524855d9 498bc4          mov     rax,r12
	fffff805`524855dc 48c1e004        shl     rax,4
	fffff805`524855e0 4803c8          add     rcx,rax
	fffff805`524855e3 488b4108        mov     rax,qword ptr [rcx+8] ; rax = rcx.Blink
	fffff805`524855e7 483908          cmp     qword ptr [rax],rcx ; rcx.Blink.Flink != rcx ?
	fffff805`524855ea 0f855f141900    jne     nt!KeInsertPriQueue+0x1916df (fffff805`52616a4f)  Branch ; __fastfail

	nt!KeInsertPriQueue+0x280:
	fffff805`524855f0 488b942498000000 mov     rdx,qword ptr [rsp+98h]
	; InsertTailList(rcx, rdx)
	fffff805`524855f8 48890a          mov     qword ptr [rdx],rcx
	fffff805`524855fb 48894208        mov     qword ptr [rdx+8],rax
	fffff805`524855ff 488910          mov     qword ptr [rax],rdx
	fffff805`52485602 48895108        mov     qword ptr [rcx+8],rdx
	fffff805`52485606 e960ffffff      jmp     nt!KeInsertPriQueue+0x1fb (fffff805`5248556b)  Branch

	nt!KeInsertPriQueue+0x191668:
	; PushEntryList(r8, rdx)
	fffff805`526169d8 498b00          mov     rax,qword ptr [r8] ; rax = r8.Next
	fffff805`526169db 488902          mov     qword ptr [rdx],rax ; rdx.Next = r8.Next
	fffff805`526169de 498910          mov     qword ptr [r8],rdx ; r8.Next = rdx
	fffff805`526169e1 66f0ff878c050000 lock inc word ptr [rdi+58Ch]
	fffff805`526169e9 e86260eeff      call    nt!KiAbQueueAutoBoostDpc (fffff805`524fca50)
	fffff805`526169ee 90              nop
	fffff805`526169ef e916ebe6ff      jmp     nt!KeInsertPriQueue+0x19a (fffff805`5248550a)  Branch
```

### ExRegisterCallback

```
	nt!ExRegisterCallback+0x76:
	fffff805`5257daa6 488d4f10        lea     rcx,[rdi+10h]
	fffff805`5257daaa 40b501          mov     bpl,1
	fffff805`5257daad 488b5108        mov     rdx,qword ptr [rcx+8] ; rdx = rcx.Blink
	fffff805`5257dab1 48390a          cmp     qword ptr [rdx],rcx ; rcx.Blink.Flink != rcx ?
	fffff805`5257dab4 0f8560220f00    jne     nt!ExRegisterCallback+0xf22ea (fffff805`5266fd1a)  Branch ; __fastfail

	nt!ExRegisterCallback+0x8a:
	; InsertTailList(rcx, rbx)
	fffff805`5257daba 48890b          mov     qword ptr [rbx],rcx
	fffff805`5257dabd 48895308        mov     qword ptr [rbx+8],rdx
	fffff805`5257dac1 48891a          mov     qword ptr [rdx],rbx
	fffff805`5257dac4 48895908        mov     qword ptr [rcx+8],rbx
```

### ExpSetTimer (calls ExpSetTimerObject)

```
	nt!ExpSetTimerObject+0x5a9:
	fffff805`52431289 4d8d4710        lea     r8,[r15+10h]
	fffff805`5243128d 49c1e005        shl     r8,5
	fffff805`52431291 488d5720        lea     rdx,[rdi+20h]
	fffff805`52431295 488b0a          mov     rcx,qword ptr [rdx] ; rcx = rdx.Flink
	fffff805`52431298 488b4208        mov     rax,qword ptr [rdx+8] ; rax = rdx.Blink
	fffff805`5243129c 48395108        cmp     qword ptr [rcx+8],rdx ; rdx.Flink.Blink != rdx ?
	fffff805`524312a0 0f85d1fd1b00    jne     nt!ExpSetTimerObject+0x1c0397 (fffff805`525f1077)  Branch ; __fastfail

	nt!ExpSetTimerObject+0x5c6:
	fffff805`524312a6 483910          cmp     qword ptr [rax],rdx ; rdx.Blink.Flink != rdx ?
	fffff805`524312a9 0f85c8fd1b00    jne     nt!ExpSetTimerObject+0x1c0397 (fffff805`525f1077)  Branch ; __fastfail

	nt!ExpSetTimerObject+0x5cf:
	; RemoveEntryList(rdx)
	fffff805`524312af 488908          mov     qword ptr [rax],rcx
	fffff805`524312b2 48894108        mov     qword ptr [rcx+8],rax
	fffff805`524312b6 483bc1          cmp     rax,rcx
	fffff805`524312b9 754a            jne     nt!ExpSetTimerObject+0x625 (fffff805`52431305)  Branch

	nt!ExpSetTimerObject+0x7ca:
	fffff805`524314aa 65488b1c2588010000 mov   rbx,qword ptr gs:[188h]
	fffff805`524314b3 488b8424c0010000 mov     rax,qword ptr [rsp+1C0h]
	fffff805`524314bb 4889442438      mov     qword ptr [rsp+38h],rax
	fffff805`524314c0 0fb6442442      movzx   eax,byte ptr [rsp+42h]
	fffff805`524314c5 88442430        mov     byte ptr [rsp+30h],al
	fffff805`524314c9 4c896c2428      mov     qword ptr [rsp+28h],r13
	fffff805`524314ce 4c89442420      mov     qword ptr [rsp+20h],r8
	fffff805`524314d3 4c8d0db602fdff  lea     r9,[nt!ExpTimerApcRoutine (fffff805`52401790)]
	fffff805`524314da 41b802000000    mov     r8d,2
	fffff805`524314e0 488bd3          mov     rdx,rbx
	fffff805`524314e3 498bcc          mov     rcx,r12
	fffff805`524314e6 e885650900      call    nt!KeInitializeApc (fffff805`524c7a70)
	fffff805`524314eb 4c8dbb30060000  lea     r15,[rbx+630h]
	fffff805`524314f2 498bcf          mov     rcx,r15
	fffff805`524314f5 e876d4ffff      call    nt!KeAcquireSpinLockAtDpcLevel (fffff805`5242e970)
	fffff805`524314fa 488d87e0000000  lea     rax,[rdi+0E0h]
	fffff805`52431501 4881c338060000  add     rbx,638h
	fffff805`52431508 488b4b08        mov     rcx,qword ptr [rbx+8] ; rcx = rbx.Blink
	fffff805`5243150c 483919          cmp     qword ptr [rcx],rbx ; rbx.Blink.Flink != rbx ?
	fffff805`5243150f 0f8506fc1b00    jne     nt!ExpSetTimerObject+0x1c043b (fffff805`525f111b)  Branch ; __fastfail

	nt!ExpSetTimerObject+0x835:
	; InsertTailList(rbx, rax)
	fffff805`52431515 488918          mov     qword ptr [rax],rbx
	fffff805`52431518 48894808        mov     qword ptr [rax+8],rcx
	fffff805`5243151c 488901          mov     qword ptr [rcx],rax
	fffff805`5243151f 48894308        mov     qword ptr [rbx+8],rax

	nt!ExpSetTimerObject+0x9f7:
	fffff805`524316d7 488d8708010000  lea     rax,[rdi+108h]
	fffff805`524316de 488b0d13ff3f00  mov     rcx,qword ptr [nt!ExpWakeTimerList+0x8 (fffff805`528315f8)] ; rcx = Head.Blink
	fffff805`524316e5 488d1504ff3f00  lea     rdx,[nt!ExpWakeTimerList (fffff805`528315f0)] ; rdx = Head
	fffff805`524316ec 483911          cmp     qword ptr [rcx],rdx ; Head.Blink.Flink != Head ?
	fffff805`524316ef 0f85bdfe1b00    jne     nt!ExpSetTimerObject+0x1c08d2 (fffff805`525f15b2)  Branch ; __fastfail

	nt!ExpSetTimerObject+0xa15:
	; InsertTailList(rdx, rax)
	fffff805`524316f5 488910          mov     qword ptr [rax],rdx
	fffff805`524316f8 48894808        mov     qword ptr [rax+8],rcx
	fffff805`524316fc 488901          mov     qword ptr [rcx],rax
	fffff805`524316ff 488905f2fe3f00  mov     qword ptr [nt!ExpWakeTimerList+0x8 (fffff805`528315f8)],rax

	nt!ExpSetTimerObject+0x1c0203:
	fffff805`525f0ee3 488b5f50        mov     rbx,qword ptr [rdi+50h]
	fffff805`525f0ee7 488d8b30060000  lea     rcx,[rbx+630h]
	fffff805`525f0eee e87ddae3ff      call    nt!KeAcquireSpinLockAtDpcLevel (fffff805`5242e970)
	fffff805`525f0ef3 488d87e0000000  lea     rax,[rdi+0E0h]
	fffff805`525f0efa 4c8b00          mov     r8,qword ptr [rax] ; r8 = rax.Flink
	fffff805`525f0efd 488b5008        mov     rdx,qword ptr [rax+8] ; rdx = rax.Blink
	fffff805`525f0f01 49394008        cmp     qword ptr [r8+8],rax ; rax.Flink.Blink != rax ?
	fffff805`525f0f05 757a            jne     nt!ExpSetTimerObject+0x1c02a1 (fffff805`525f0f81)  Branch ; __fastfail

	nt!ExpSetTimerObject+0x1c0227:
	fffff805`525f0f07 483902          cmp     qword ptr [rdx],rax ; rax.Blink.Flink != rax ?
	fffff805`525f0f0a 7575            jne     nt!ExpSetTimerObject+0x1c02a1 (fffff805`525f0f81)  Branch ; __fastfail

	nt!ExpSetTimerObject+0x1c022c:
	; RemoveEntryList(rax)
	fffff805`525f0f0c 4c8902          mov     qword ptr [rdx],r8
	fffff805`525f0f0f 49895008        mov     qword ptr [r8+8],rdx
	fffff805`525f0f13 488d8b30060000  lea     rcx,[rbx+630h]
	fffff805`525f0f1a e8c1dae3ff      call    nt!KeReleaseSpinLockFromDpcLevel (fffff805`5242e9e0)
	fffff805`525f0f1f 80a730010000fe  and     byte ptr [rdi+130h],0FEh
	fffff805`525f0f26 f6873001000002  test    byte ptr [rdi+130h],2
	fffff805`525f0f2d 7409            je      nt!ExpSetTimerObject+0x1c0258 (fffff805`525f0f38)  Branch

	nt!ExpSetTimerObject+0x1c08d9:
	fffff805`525f15b9 488d8708010000  lea     rax,[rdi+108h]
	fffff805`525f15c0 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff805`525f15c3 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = rax.Blink
	fffff805`525f15c7 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff805`525f15cb 7518            jne     nt!ExpSetTimerObject+0x1c0905 (fffff805`525f15e5)  Branch ; __fastfail

	nt!ExpSetTimerObject+0x1c08ed:
	fffff805`525f15cd 483901          cmp     qword ptr [rcx],rax ; rax.Blink.Flink != rax ?
	fffff805`525f15d0 7513            jne     nt!ExpSetTimerObject+0x1c0905 (fffff805`525f15e5)  Branch ; __fastfail

	nt!ExpSetTimerObject+0x1c08f2:
	; RemoveEntryList(rax)
	fffff805`525f15d2 488911          mov     qword ptr [rcx],rdx
	fffff805`525f15d5 48894a08        mov     qword ptr [rdx+8],rcx
	fffff805`525f15d9 48c70000000000  mov     qword ptr [rax],0
	fffff805`525f15e0 e92101e4ff      jmp     nt!ExpSetTimerObject+0xa26 (fffff805`52431706)  Branch
```

### IoSetIoCompletionEx2 (calls KeInsertQueueEx)

```
	nt!KeInsertQueueEx+0x16c:
	fffff805`5241a03c 8b5304          mov     edx,dword ptr [rbx+4]
	fffff805`5241a03f 8d4201          lea     eax,[rdx+1]
	fffff805`5241a042 894304          mov     dword ptr [rbx+4],eax
	fffff805`5241a045 488d4318        lea     rax,[rbx+18h]
	fffff805`5241a049 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = rax.Blink
	fffff805`5241a04d 483901          cmp     qword ptr [rcx],rax ; rax.Blink.Flink != rax ?
	fffff805`5241a050 753f            jne     nt!KeInsertQueueEx+0x1c1 (fffff805`5241a091)  Branch ; __fastfail

	nt!KeInsertQueueEx+0x182:
	; InsertTailList(rax, rsi)
	fffff805`5241a052 488906          mov     qword ptr [rsi],rax
	fffff805`5241a055 48894e08        mov     qword ptr [rsi+8],rcx
	fffff805`5241a059 488931          mov     qword ptr [rcx],rsi
	fffff805`5241a05c 48897008        mov     qword ptr [rax+8],rsi
	fffff805`5241a060 85d2            test    edx,edx
	fffff805`5241a062 0f8550ffffff    jne     nt!KeInsertQueueEx+0xe8 (fffff805`52419fb8)  Branch
```

### KiWakeQueueWaiter (this one isn't in the book)

```
	nt!KiWakeQueueWaiter+0x29:
	fffff805`5241a0c9 488bfb          mov     rdi,rbx ; rdi = rbx
	fffff805`5241a0cc 488b1b          mov     rbx,qword ptr [rbx] ; rbx = rdi.Flink
	fffff805`5241a0cf 807f1003        cmp     byte ptr [rdi+10h],3
	fffff805`5241a0d3 0f8505010000    jne     nt!KiWakeQueueWaiter+0x13e (fffff805`5241a1de)  Branch

	nt!KiWakeQueueWaiter+0x39:
	fffff805`5241a0d9 488b4708        mov     rax,qword ptr [rdi+8] ; rax = rdi.Blink
	fffff805`5241a0dd 48397b08        cmp     qword ptr [rbx+8],rdi ; rdi.Flink.Blink != rdi ?
	fffff805`5241a0e1 0f856c341c00    jne     nt!KiWakeQueueWaiter+0x1c34b3 (fffff805`525dd553)  Branch ; __fastfail

	nt!KiWakeQueueWaiter+0x47:
	fffff805`5241a0e7 483938          cmp     qword ptr [rax],rdi ; rdi.Blink.Flink != rdi ?
	fffff805`5241a0ea 0f8563341c00    jne     nt!KiWakeQueueWaiter+0x1c34b3 (fffff805`525dd553)  Branch ; __fastfail

	nt!KiWakeQueueWaiter+0x50:
	; RemoveEntryList(rdi)
	fffff805`5241a0f0 488918          mov     qword ptr [rax],rbx
	fffff805`5241a0f3 4532e4          xor     r12b,r12b
	fffff805`5241a0f6 48894308        mov     qword ptr [rbx+8],rax
```

### KeInsertQueueDpc (calls KiInsertQueueDpc)

```
	Uses a singly list.
```

### KeStartThread

```
	nt!KeStartThread+0x1ff:
	fffff805`5248f17f 488bcf          mov     rcx,rdi
	fffff805`5248f182 48894320        mov     qword ptr [rbx+20h],rax
	fffff805`5248f186 e865bbf9ff      call    nt!KiAcquireKobjectLockSafe (fffff805`5242acf0)
	fffff805`5248f18b 488b4e08        mov     rcx,qword ptr [rsi+8] ; rcx = rsi.Blink
	fffff805`5248f18f 488d83f8020000  lea     rax,[rbx+2F8h]
	fffff805`5248f196 483931          cmp     qword ptr [rcx],rsi ; rsi.Blink.Flink != rsi ?
	fffff805`5248f199 0f85b0b31800    jne     nt!KeStartThread+0x18b5cf (fffff805`5261a54f)  Branch ; __fastfail

	nt!KeStartThread+0x21f:
	; InsertTailList(rsi, rax)
	fffff805`5248f19f 488930          mov     qword ptr [rax],rsi
	fffff805`5248f1a2 48894808        mov     qword ptr [rax+8],rcx
	fffff805`5248f1a6 488901          mov     qword ptr [rcx],rax
	fffff805`5248f1a9 48894608        mov     qword ptr [rsi+8],rax
	fffff805`5248f1ad f081277fffffff  lock and dword ptr [rdi],0FFFFFF7Fh
	fffff805`5248f1b4 8b87b8010000    mov     eax,dword ptr [rdi+1B8h]
	fffff805`5248f1ba be08000000      mov     esi,8
	fffff805`5248f1bf 4084c6          test    sil,al
	fffff805`5248f1c2 0f85f0010000    jne     nt!KeStartThread+0x438 (fffff805`5248f3b8)  Branch

	nt!KeStartThread+0x391:
	fffff805`5248f311 488d1528e34f00  lea     rdx,[nt!KiProcessListLock (fffff805`5298d640)]
	fffff805`5248f318 4c8965d0        mov     qword ptr [rbp-30h],r12
	fffff805`5248f31c 488d4dd0        lea     rcx,[rbp-30h]
	fffff805`5248f320 488955d8        mov     qword ptr [rbp-28h],rdx
	fffff805`5248f324 e837abf8ff      call    nt!KxAcquireQueuedSpinLock (fffff805`52419e60)
	fffff805`5248f329 488b0d78063c00  mov     rcx,qword ptr [nt!KiProcessListHead+0x8 (fffff805`5284f9a8)] ; rcx = Head.Blink
	fffff805`5248f330 488d1569063c00  lea     rdx,[nt!KiProcessListHead (fffff805`5284f9a0)] ; rdx = Head
	fffff805`5248f337 488d8748020000  lea     rax,[rdi+248h] ; rax = Entry
	fffff805`5248f33e 483911          cmp     qword ptr [rcx],rdx ; Head.Blink.Flink != Head ?
	fffff805`5248f341 0f8508b21800    jne     nt!KeStartThread+0x18b5cf (fffff805`5261a54f)  Branch ; __fastfail

	nt!KeStartThread+0x3c7:
	; InsertTailList(rcx, rax)
	fffff805`5248f347 48894808        mov     qword ptr [rax+8],rcx
	fffff805`5248f34b 488910          mov     qword ptr [rax],rdx
	fffff805`5248f34e 488901          mov     qword ptr [rcx],rax
	fffff805`5248f351 488d4dd0        lea     rcx,[rbp-30h]
	fffff805`5248f355 4889054c063c00  mov     qword ptr [nt!KiProcessListHead+0x8 (fffff805`5284f9a8)],rax
	fffff805`5248f35c e8bf180100      call    nt!KxReleaseQueuedSpinLock (fffff805`524a0c20)
	fffff805`5248f361 e9e5fdffff      jmp     nt!KeStartThread+0x1cb (fffff805`5248f14b)  Branch
```

### KiAddThreadToScbQueue

```
	nt!KiAddThreadToScbQueue+0x3b:
	fffff805`525011ef 488b02          mov     rax,qword ptr [rdx] ; rax = rdx.Flink
	fffff805`525011f2 48395008        cmp     qword ptr [rax+8],rdx ; rdx.Flink.Blink != rdx ?
	fffff805`525011f6 7556            jne     nt!KiAddThreadToScbQueue+0x9a (fffff805`5250124e)  Branch ; __fastfail

	nt!KiAddThreadToScbQueue+0x44:
	; InsertHeadList(rdx, rcx)
	fffff805`525011f8 488901          mov     qword ptr [rcx],rax
	fffff805`525011fb 48895108        mov     qword ptr [rcx+8],rdx
	fffff805`525011ff 48894808        mov     qword ptr [rax+8],rcx
	fffff805`52501203 48890a          mov     qword ptr [rdx],rcx

	nt!KiAddThreadToScbQueue+0x81:
	fffff805`52501235 488b4208        mov     rax,qword ptr [rdx+8] ; rax = rdx.Blink
	fffff805`52501239 483910          cmp     qword ptr [rax],rdx ; rdx.Blink.Flink != rdx ?
	fffff805`5250123c 7510            jne     nt!KiAddThreadToScbQueue+0x9a (fffff805`5250124e)  Branch ; __fastfail

	nt!KiAddThreadToScbQueue+0x8a:
	; InsertTailList(rdx, rcx)
	fffff805`5250123e 488911          mov     qword ptr [rcx],rdx
	fffff805`52501241 48894108        mov     qword ptr [rcx+8],rax
	fffff805`52501245 488908          mov     qword ptr [rax],rcx
	fffff805`52501248 48894a08        mov     qword ptr [rdx+8],rcx
	fffff805`5250124c ebb8            jmp     nt!KiAddThreadToScbQueue+0x52 (fffff805`52501206)  Branch
```

### KiInsertQueueApc (see exercize 2)

### KiQueueReadyThread (see exercize 2)

### MiInsertNewProcess

```
	nt!MiInsertNewProcess:
	fffff805`524d38d0 4c8bdc          mov     r11,rsp
	fffff805`524d38d3 49895b08        mov     qword ptr [r11+8],rbx
	fffff805`524d38d7 57              push    rdi
	fffff805`524d38d8 4883ec40        sub     rsp,40h
	fffff805`524d38dc 33c0            xor     eax,eax
	fffff805`524d38de 488bda          mov     rbx,rdx
	fffff805`524d38e1 488bf9          mov     rdi,rcx
	fffff805`524d38e4 498943d8        mov     qword ptr [r11-28h],rax
	fffff805`524d38e8 498d53d8        lea     rdx,[r11-28h]
	fffff805`524d38ec 498943e0        mov     qword ptr [r11-20h],rax
	fffff805`524d38f0 488d0dc94f3900  lea     rcx,[nt!MiState+0x2440 (fffff805`528688c0)]
	fffff805`524d38f7 498943e8        mov     qword ptr [r11-18h],rax
	fffff805`524d38fb e83034fdff      call    nt!KeAcquireInStackQueuedSpinLock (fffff805`524a6d30)
	fffff805`524d3900 4c8b05c1403900  mov     r8,qword ptr [nt!MiState+0x1548 (fffff805`528679c8)] ; r8 = Head.Blink (assuming )
	fffff805`524d3907 488d0db2403900  lea     rcx,[nt!MiState+0x1540 (fffff805`528679c0)] ; rcx = Head (assuming)
	fffff805`524d390e 488d8740060000  lea     rax,[rdi+640h]
	fffff805`524d3915 493908          cmp     qword ptr [r8],rcx ; Head.Blink.Flink != Head ?
	fffff805`524d3918 7566            jne     nt!MiInsertNewProcess+0xb0 (fffff805`524d3980)  Branch ; __fastfail

	nt!MiInsertNewProcess+0x4a:
	; InsertTailList(rcx, rax)
	fffff805`524d391a 488908          mov     qword ptr [rax],rcx
	fffff805`524d391d 4c894008        mov     qword ptr [rax+8],r8
	fffff805`524d3921 498900          mov     qword ptr [r8],rax
	fffff805`524d3924 4889059d403900  mov     qword ptr [nt!MiState+0x1548 (fffff805`528679c8)],rax
	fffff805`524d392b 4885db          test    rbx,rbx
	fffff805`524d392e 7422            je      nt!MiInsertNewProcess+0x82 (fffff805`524d3952)  Branch

	nt!MiInsertNewProcess+0x60:
	fffff805`524d3930 488d4b10        lea     rcx,[rbx+10h]
	fffff805`524d3934 488b5108        mov     rdx,qword ptr [rcx+8] ; rdx = rcx.Blink
	fffff805`524d3938 488d8748030000  lea     rax,[rdi+348h]
	fffff805`524d393f 48390a          cmp     qword ptr [rdx],rcx ; rcx.Blink.Flink != rcx ?
	fffff805`524d3942 753c            jne     nt!MiInsertNewProcess+0xb0 (fffff805`524d3980)  Branch ; __fastfail

	nt!MiInsertNewProcess+0x74:
	; InsertTailList(rcx, rax)
	fffff805`524d3944 488908          mov     qword ptr [rax],rcx
	fffff805`524d3947 48895008        mov     qword ptr [rax+8],rdx
	fffff805`524d394b 488902          mov     qword ptr [rdx],rax
	fffff805`524d394e 48894108        mov     qword ptr [rcx+8],rax
```

### PnpRequestDeviceAction

```
	nt!PnpRequestDeviceAction+0x1cc:
	fffff805`5255c350 410fb6c4        movzx   eax,r12b
	fffff805`5255c354 440f22c0        mov     cr8,rax
	fffff805`5255c358 488d0d614f3000  lea     rcx,[nt!PnpSpinLock (fffff805`528612c0)]
	fffff805`5255c35f e80c42edff      call    nt!KeAcquireSpinLockRaiseToDpc (fffff805`52430570)
	fffff805`5255c364 448ae0          mov     r12b,al
	fffff805`5255c367 488b054a4f3000  mov     rax,qword ptr [nt!PnpEnumerationRequestList+0x8 (fffff805`528612b8)] ; rax = Head.Blink
	fffff805`5255c36e 488d0d3b4f3000  lea     rcx,[nt!PnpEnumerationRequestList (fffff805`528612b0)] ; rcx = Head
	fffff805`5255c375 483908          cmp     qword ptr [rax],rcx ; Head.Blink.Flink != Head ?
	fffff805`5255c378 0f85fbf51000    jne     nt!PnpRequestDeviceAction+0x10f7f5 (fffff805`5266b979)  Branch ; __fastfail

	nt!PnpRequestDeviceAction+0x1fa:
	; InsertTailList(rcx, rdi)
	fffff805`5255c37e 48890f          mov     qword ptr [rdi],rcx
	fffff805`5255c381 48894708        mov     qword ptr [rdi+8],rax
	fffff805`5255c385 488938          mov     qword ptr [rax],rdi
	fffff805`5255c388 48893d294f3000  mov     qword ptr [nt!PnpEnumerationRequestList+0x8 (fffff805`528612b8)],rdi
	fffff805`5255c38f 488b8424a0000000 mov     rax,qword ptr [rsp+0A0h]
	fffff805`5255c397 4885c0          test    rax,rax
	fffff805`5255c39a 0f85e0f51000    jne     nt!PnpRequestDeviceAction+0x10f7fc (fffff805`5266b980)  Branch
```

### PspInsertProcess

```
	nt!PspInsertProcess+0x7e:
	fffff805`52a305fa 498bce          mov     rcx,r14
	fffff805`52a305fd e8b69fa9ff      call    nt!PspLockProcessListExclusive (fffff805`524ca5b8)
	fffff805`52a30602 488b0d7f85e0ff  mov     rcx,qword ptr [nt!PsActiveProcessHead+0x8 (fffff805`52838b88)] ; rcx = Head.Blink
	fffff805`52a30609 488d157085e0ff  lea     rdx,[nt!PsActiveProcessHead (fffff805`52838b80)] ; rdx = Head
	fffff805`52a30610 488d83f0020000  lea     rax,[rbx+2F0h]
	fffff805`52a30617 483911          cmp     qword ptr [rcx],rdx ; Head.Blink.Flink != Head ?
	fffff805`52a3061a 0f8568211900    jne     nt!PspInsertProcess+0x19220c (fffff805`52bc2788)  Branch ; __fastfail

	nt!PspInsertProcess+0xa4:
	; InsertTailList(rdx, rax)
	fffff805`52a30620 48894808        mov     qword ptr [rax+8],rcx
	fffff805`52a30624 488910          mov     qword ptr [rax],rdx
	fffff805`52a30627 488901          mov     qword ptr [rcx],rax
	fffff805`52a3062a 498bce          mov     rcx,r14
	fffff805`52a3062d 4889055485e0ff  mov     qword ptr [nt!PsActiveProcessHead+0x8 (fffff805`52838b88)],rax
	fffff805`52a30634 488b05a585e0ff  mov     rax,qword ptr [nt!PspProcessSequenceNumber (fffff805`52838be0)]
	fffff805`52a3063b 48ffc0          inc     rax
	fffff805`52a3063e 4889059b85e0ff  mov     qword ptr [nt!PspProcessSequenceNumber (fffff805`52838be0)],rax
	fffff805`52a30645 48898378070000  mov     qword ptr [rbx+778h],rax
	fffff805`52a3064c e88b9fa9ff      call    nt!PspUnlockProcessListExclusive (fffff805`524ca5dc)
	fffff805`52a30651 418b850c030000  mov     eax,dword ptr [r13+30Ch]
	fffff805`52a30658 a808            test    al,8
	fffff805`52a3065a 0f852f211900    jne     nt!PspInsertProcess+0x192213 (fffff805`52bc278f)  Branch
```

### PspInsertThread

```
	nt!PspInsertThread+0x1f7:
	fffff805`529eb7bb 4d8dbee0060000  lea     r15,[r14+6E0h]
	fffff805`529eb7c2 33d2            xor     edx,edx
	fffff805`529eb7c4 498bcf          mov     rcx,r15
	fffff805`529eb7c7 e8c462abff      call    nt!ExAcquirePushLockExclusiveEx (fffff805`524a1a90)
	fffff805`529eb7cc 488d8eb8060000  lea     rcx,[rsi+6B8h]
	fffff805`529eb7d3 498d8688040000  lea     rax,[r14+488h]
	fffff805`529eb7da 488b5008        mov     rdx,qword ptr [rax+8] ; rdx = rax.Blink
	fffff805`529eb7de 483902          cmp     qword ptr [rdx],rax ; rax.Blink.Flink != rax ?
	fffff805`529eb7e1 0f85b0291c00    jne     nt!PspInsertThread+0x1c2bd3 (fffff805`52bae197)  Branch ; __fastfail

	nt!PspInsertThread+0x223:
	; InsertTailList(rax, rcx)
	fffff805`529eb7e7 488901          mov     qword ptr [rcx],rax
	fffff805`529eb7ea 48895108        mov     qword ptr [rcx+8],rdx
	fffff805`529eb7ee 48890a          mov     qword ptr [rdx],rcx
	fffff805`529eb7f1 48894808        mov     qword ptr [rax+8],rcx
```
