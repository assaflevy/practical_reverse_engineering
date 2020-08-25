# Exercise
Repeat the previous exercise for RemoveHeadList in the following routines:

■ AlpcpFlushResourcesPort<br>
■ CcDeleteMbcb<br>
■ CcGetVacbMiss<br>
■ CmpLazyCommitWorker<br>
■ ExAllocatePoolWithTag<br>
■ FsRtlNotifyCompleteIrpList<br>
■ IopInitializeBootDrivers<br>
■ KiProcessDisconnectList<br>
■ PnpDeviceCompletionQueueGetCompletedRequest<br>
■ RtlDestroyAtomTable<br>
■ RtlEmptyAtomTable<br>
■ RtlpFreeAllAtom

# Solution

### AlpcpFlushResourcesPort

```
	nt!AlpcpFlushResourcesPort+0x30:
	fffff805`52a45c48 488b06          mov     rax,qword ptr [rsi] ; rax = rsi.Flink
	fffff805`52a45c4b 483bc6          cmp     rax,rsi ; rsi.Flink = rsi ?
	fffff805`52a45c4e 752e            jne     nt!AlpcpFlushResourcesPort+0x66 (fffff805`52a45c7e)  Branch

	nt!AlpcpFlushResourcesPort+0x38:
	fffff805`52a45c50 f0480fc11f      lock xadd qword ptr [rdi],rbx
	fffff805`52a45c55 80e306          and     bl,6
	fffff805`52a45c58 80fb02          cmp     bl,2
	fffff805`52a45c5b 0f849e000000    je      nt!AlpcpFlushResourcesPort+0xe7 (fffff805`52a45cff)  Branch

	nt!AlpcpFlushResourcesPort+0x49:
	fffff805`52a45c61 488bcf          mov     rcx,rdi
	fffff805`52a45c64 e8c7c8a5ff      call    nt!KeAbPostRelease (fffff805`524a2530)
	fffff805`52a45c69 488b5c2430      mov     rbx,qword ptr [rsp+30h]
	fffff805`52a45c6e 488b6c2438      mov     rbp,qword ptr [rsp+38h]
	fffff805`52a45c73 488b742440      mov     rsi,qword ptr [rsp+40h]
	fffff805`52a45c78 4883c420        add     rsp,20h
	fffff805`52a45c7c 5f              pop     rdi
	fffff805`52a45c7d c3              ret

	nt!AlpcpFlushResourcesPort+0x66:
	fffff805`52a45c7e 48397008        cmp     qword ptr [rax+8],rsi ; rsi.Flink.Blink != rsi ?
	fffff805`52a45c82 0f85a8151800    jne     nt!AlpcpFlushResourcesPort+0x181618 (fffff805`52bc7230)  Branch ; __fastfail

	nt!AlpcpFlushResourcesPort+0x70:
	fffff805`52a45c88 488b08          mov     rcx,qword ptr [rax] ; rcx = rsi.Flink.Flink
	fffff805`52a45c8b 48394108        cmp     qword ptr [rcx+8],rax ; rsi.Flink.Flink.Blink != rsi.Flink ?
	fffff805`52a45c8f 0f859b151800    jne     nt!AlpcpFlushResourcesPort+0x181618 (fffff805`52bc7230)  Branch ; __fastfail

	nt!AlpcpFlushResourcesPort+0x7d:
	; InsertHeadList(rsi, rcx)
	fffff805`52a45c95 48890e          mov     qword ptr [rsi],rcx
	fffff805`52a45c98 488d6830        lea     rbp,[rax+30h]
	fffff805`52a45c9c 48897108        mov     qword ptr [rcx+8],rsi
	fffff805`52a45ca0 488bcd          mov     rcx,rbp
	fffff805`52a45ca3 48894008        mov     qword ptr [rax+8],rax
	fffff805`52a45ca7 488900          mov     qword ptr [rax],rax
```

### CcDeleteMbcb

```
	nt!CcDeleteMbcb+0xab:
	fffff805`5253140f 488b0b          mov     rcx,qword ptr [rbx] ; rcx = rbx.Flink
	fffff805`52531412 488b4308        mov     rax,qword ptr [rbx+8] ; rax = rbx.Blink
	fffff805`52531416 48395908        cmp     qword ptr [rcx+8],rbx ; rbx.Flink.Blink != rbx ?
	fffff805`5253141a 0f85d0000000    jne     nt!CcDeleteMbcb+0x18c (fffff805`525314f0)  Branch ; __fastfail

	nt!CcDeleteMbcb+0xbc:
	fffff805`52531420 483918          cmp     qword ptr [rax],rbx ; rbx.Blink.Flink != rbx ?
	fffff805`52531423 0f85c7000000    jne     nt!CcDeleteMbcb+0x18c (fffff805`525314f0)  Branch ; __fastfail

	nt!CcDeleteMbcb+0xc5:
	; RemoveEntryList(rbx)
	fffff805`52531429 488908          mov     qword ptr [rax],rcx
	fffff805`5253142c 48894108        mov     qword ptr [rcx+8],rax
	fffff805`52531430 488b5328        mov     rdx,qword ptr [rbx+28h]
	fffff805`52531434 4885d2          test    rdx,rdx
	fffff805`52531437 7409            je      nt!CcDeleteMbcb+0xde (fffff805`52531442)  Branch

	nt!CcDeleteMbcb+0xef:
	; Assuming rbp-30h holds a _LIST_ENTRY structure on the stack.
	fffff805`52531453 488b45d8        mov     rax,qword ptr [rbp-28h] ; rax = Head.Blink
	fffff805`52531457 488d4dd0        lea     rcx,[rbp-30h] ; rcx = Head
	fffff805`5253145b 483908          cmp     qword ptr [rax],rcx ; Head.Blink.Flink != Head ?
	fffff805`5253145e 0f858c000000    jne     nt!CcDeleteMbcb+0x18c (fffff805`525314f0)  Branch ; __fastfail

	nt!CcDeleteMbcb+0x100:
	; InsertHeadList(rcx, rbx)
	fffff805`52531464 48894308        mov     qword ptr [rbx+8],rax ; rbx.Blink = Head.Blink
	fffff805`52531468 488d4dd0        lea     rcx,[rbp-30h] ; rcx = Head
	fffff805`5253146c 48890b          mov     qword ptr [rbx],rcx ; rbx.Flink = rcx
	fffff805`5253146f 488918          mov     qword ptr [rax],rbx ; 
	fffff805`52531472 48895dd8        mov     qword ptr [rbp-28h],rbx
	fffff805`52531476 eb8f            jmp     nt!CcDeleteMbcb+0xa3 (fffff805`52531407)  Branch

	nt!CcDeleteMbcb+0xef:
	; Assuming rbp-30h holds a _LIST_ENTRY structure on the stack.
	fffff805`52531453 488b45d8        mov     rax,qword ptr [rbp-28h] ; rax = Entry.Blink
	fffff805`52531457 488d4dd0        lea     rcx,[rbp-30h]           ; rcx = Entry
	fffff805`5253145b 483908          cmp     qword ptr [rax],rcx     ; Entry.Blink.Flink != Head ?
	fffff805`5253145e 0f858c000000    jne     nt!CcDeleteMbcb+0x18c (fffff805`525314f0)  Branch ; __fastfail

	nt!CcDeleteMbcb+0x100:
	; InsertHeadList(Entry, rbx)
	fffff805`52531464 48894308        mov     qword ptr [rbx+8],rax ; rbx.Blink = Entry.Blink
	fffff805`52531468 488d4dd0        lea     rcx,[rbp-30h] ; rcx = Entry
	fffff805`5253146c 48890b          mov     qword ptr [rbx],rcx ; rbx.Flink = Entry
	fffff805`5253146f 488918          mov     qword ptr [rax],rbx ; Entry.Flink = rbx
	fffff805`52531472 48895dd8        mov     qword ptr [rbp-28h],rbx ; Entry.Blink 
	fffff805`52531476 eb8f            jmp     nt!CcDeleteMbcb+0xa3 (fffff805`52531407)  Branch

	nt!CcDeleteMbcb+0x124:
	fffff805`52531488 488b4dd0        mov     rcx,qword ptr [rbp-30h] ; rcx = Entry.Flink
	fffff805`5253148c 488d45d0        lea     rax,[rbp-30h] ; rax = Entry
	fffff805`52531490 483bc8          cmp     rcx,rax ; Entry.Flink != Entry ?
	fffff805`52531493 7533            jne     nt!CcDeleteMbcb+0x164 (fffff805`525314c8)  Branch ; list is not empty

	nt!CcDeleteMbcb+0x164:
	fffff805`525314c8 488b01          mov     rax,qword ptr [rcx] ; rax = Entry.Flink.Flink
	fffff805`525314cb 488d55d0        lea     rdx,[rbp-30h] ; rdx = Entry
	fffff805`525314cf 48395108        cmp     qword ptr [rcx+8],rdx ; Entry.Flink.Blink != Entry ?
	fffff805`525314d3 751b            jne     nt!CcDeleteMbcb+0x18c (fffff805`525314f0)  Branch ; __fastfail

	nt!CcDeleteMbcb+0x171:
	fffff805`525314d5 48394808        cmp     qword ptr [rax+8],rcx ; Entry.Flink.Flink.Blink != Entry.Flink ?
	fffff805`525314d9 7515            jne     nt!CcDeleteMbcb+0x18c (fffff805`525314f0)  Branch ; __fastfail

	nt!CcDeleteMbcb+0x177:
	fffff805`525314db 488d55d0        lea     rdx,[rbp-30h] ; rdx = Entry
	; RemoveEntryList(Entry.Flink)
	fffff805`525314df 488945d0        mov     qword ptr [rbp-30h],rax ; Entry.Flink = Entry.Flink.Flink
	fffff805`525314e3 48895008        mov     qword ptr [rax+8],rdx ; Entry.Flink.Flink.Blink = Entry
	fffff805`525314e7 33d2            xor     edx,edx
	fffff805`525314e9 e8b2db2300      call    nt!ExFreePool (fffff805`5276f0a0)
	fffff805`525314ee eb98            jmp     nt!CcDeleteMbcb+0x124 (fffff805`52531488)  Branch
```

### CcGetVacbMiss (calls CcSetVacbInFreeList)

```
	nt!CcSetVacbInFreeList+0x16:
	fffff805`52422372 488b0d97394400  mov     rcx,qword ptr [nt!CcVacbFreeList (fffff805`52865d10)] ; rcx = Head.Flink
	fffff805`52422379 4c8d0590394400  lea     r8,[nt!CcVacbFreeList (fffff805`52865d10)] ; r8 = Head
	fffff805`52422380 4c394108        cmp     qword ptr [rcx+8],r8 ; Head.Flink.Flink != Head ?
	fffff805`52422384 755f            jne     nt!CcSetVacbInFreeList+0x89 (fffff805`524223e5)  Branch ; __fastfail

	nt!CcSetVacbInFreeList+0x2a:
	; InsertHeadList(r8, rax)
	fffff805`52422386 488908          mov     qword ptr [rax],rcx
	fffff805`52422389 4c894008        mov     qword ptr [rax+8],r8
	fffff805`5242238d 48894108        mov     qword ptr [rcx+8],rax
	fffff805`52422391 48890578394400  mov     qword ptr [nt!CcVacbFreeList (fffff805`52865d10)],rax
	fffff805`52422398 488b4a20        mov     rcx,qword ptr [rdx+20h]
	fffff805`5242239c 4c895208        mov     qword ptr [rdx+8],r10
	fffff805`524223a0 8b4104          mov     eax,dword ptr [rcx+4]
	fffff805`524223a3 85c0            test    eax,eax
	fffff805`524223a5 0f8423801c00    je      nt!CcSetVacbInFreeList+0x1c8072 (fffff805`525ea3ce)  Branch
```

### CmpLazyCommitWorker

```
	nt!CmpLazyCommitWorker+0x4a:
	fffff805`52c3124a e8e5f3e9ff      call    nt!LOCK_TRANSACTION_LIST (fffff805`52ad0634)
	fffff805`52c3124f 488b1d8a46c3ff  mov     rbx,qword ptr [nt!CmpLazyCommitListHead (fffff805`528658e0)] ; rbx = Head.Flink
	fffff805`52c31256 4c397308        cmp     qword ptr [rbx+8],r14 ; Head.Flink.Blink != Head ?
	fffff805`52c3125a 0f8534010000    jne     nt!CmpLazyCommitWorker+0x194 (fffff805`52c31394)  Branch ; __fastfail

	nt!CmpLazyCommitWorker+0x60:
	fffff805`52c31260 488b03          mov     rax,qword ptr [rbx] ; rax = Head.Flink.Flink
	fffff805`52c31263 48395808        cmp     qword ptr [rax+8],rbx ; Head.Flink.Flink.Blink != Head.Flink ?
	fffff805`52c31267 0f8527010000    jne     nt!CmpLazyCommitWorker+0x194 (fffff805`52c31394)  Branch ; __fastfail

	nt!CmpLazyCommitWorker+0x6d:
	; RemoveEntryList(rbx)
	fffff805`52c3126d 4889056c46c3ff  mov     qword ptr [nt!CmpLazyCommitListHead (fffff805`528658e0)],rax
	fffff805`52c31274 4c897008        mov     qword ptr [rax+8],r14
	fffff805`52c31278 493bde          cmp     rbx,r14
	fffff805`52c3127b 745b            je      nt!CmpLazyCommitWorker+0xd8 (fffff805`52c312d8)  Branch

	nt!CmpLazyCommitWorker+0xad:
	fffff805`52c312ad 488b45f8        mov     rax,qword ptr [rbp-8] ; rax = Entry.Blink
	fffff805`52c312b1 488d4df0        lea     rcx,[rbp-10h] ; rcx = Entry
	fffff805`52c312b5 483908          cmp     qword ptr [rax],rcx ; Entry.Blink.Flink != Entry ?
	fffff805`52c312b8 0f85d6000000    jne     nt!CmpLazyCommitWorker+0x194 (fffff805`52c31394)  Branch ; __fastfail

	nt!CmpLazyCommitWorker+0xbe:
	; InsertTailList(rcx, rbx)
	fffff805`52c312be 48894308        mov     qword ptr [rbx+8],rax
	fffff805`52c312c2 488d4df0        lea     rcx,[rbp-10h]
	fffff805`52c312c6 48890b          mov     qword ptr [rbx],rcx
	fffff805`52c312c9 4032ff          xor     dil,dil
	fffff805`52c312cc 488918          mov     qword ptr [rax],rbx
	fffff805`52c312cf 48895df8        mov     qword ptr [rbp-8],rbx
	fffff805`52c312d3 e972ffffff      jmp     nt!CmpLazyCommitWorker+0x4a (fffff805`52c3124a)  Branch

	nt!CmpLazyCommitWorker+0x114:
	; ?
	fffff805`52c31314 48894df0        mov     qword ptr [rbp-10h],rcx
	fffff805`52c31318 488d55f0        lea     rdx,[rbp-10h]
	fffff805`52c3131c 48895108        mov     qword ptr [rcx+8],rdx
	fffff805`52c31320 488d4df0        lea     rcx,[rbp-10h]
	fffff805`52c31324 483bc1          cmp     rax,rcx
	fffff805`52c31327 741f            je      nt!CmpLazyCommitWorker+0x148 (fffff805`52c31348)  Branch

	nt!CmpLazyCommitWorker+0x129:
	fffff805`52c31329 488b0db845c3ff  mov     rcx,qword ptr [nt!CmpLazyCommitListHead+0x8 (fffff805`528658e8)] ; rcx = Head.Blink
	fffff805`52c31330 4c3931          cmp     qword ptr [rcx],r14 ; Head.Blink.Flink != Head ? (assuming r14 = Head)
	fffff805`52c31333 755f            jne     nt!CmpLazyCommitWorker+0x194 (fffff805`52c31394)  Branch ; __fastfail

	nt!CmpLazyCommitWorker+0x135:
	; InsertTailList(r14, rax)
	fffff805`52c31335 4c8930          mov     qword ptr [rax],r14
	fffff805`52c31338 48894808        mov     qword ptr [rax+8],rcx
	fffff805`52c3133c 488901          mov     qword ptr [rcx],rax
	fffff805`52c3133f 488905a245c3ff  mov     qword ptr [nt!CmpLazyCommitListHead+0x8 (fffff805`528658e8)],rax
	fffff805`52c31346 ebad            jmp     nt!CmpLazyCommitWorker+0xf5 (fffff805`52c312f5)  Branch

	nt!CmpLazyCommitWorker+0x194:
	fffff805`52c31394 b903000000      mov     ecx,3
	fffff805`52c31399 cd29            int     29h
	fffff805`52c3139b cc              int     3
	fffff805`52c3139c cc              int     3
	fffff805`52c3139d cc              int     3
	fffff805`52c3139e cc              int     3
	fffff805`52c3139f cc              int     3
	fffff805`52c313a0 cc              int     3
	fffff805`52c313a1 cc              int     3
	fffff805`52c313a2 cc              int     3
	fffff805`52c313a3 cc              int     3
	fffff805`52c313a4 48895c2408      mov     qword ptr [rsp+8],rbx
	fffff805`52c313a9 57              push    rdi
	fffff805`52c313aa 4883ec30        sub     rsp,30h
	fffff805`52c313ae 65488b042588010000 mov   rax,qword ptr gs:[188h]
	fffff805`52c313b7 4032ff          xor     dil,dil
	fffff805`52c313ba 488bd9          mov     rbx,rcx
	fffff805`52c313bd 66ff88e4010000  dec     word ptr [rax+1E4h]
	fffff805`52c313c4 488d0d9544c3ff  lea     rcx,[nt!CmpTransactionListLock (fffff805`52865860)]
	fffff805`52c313cb e8308c7fff      call    nt!ExAcquireFastMutexUnsafe (fffff805`5242a000)
	fffff805`52c313d0 836330bf        and     dword ptr [rbx+30h],0FFFFFFBFh
	fffff805`52c313d4 488d0d0545c3ff  lea     rcx,[nt!CmpLazyCommitListHead (fffff805`528658e0)] ; rcx = Head
	fffff805`52c313db 488b050645c3ff  mov     rax,qword ptr [nt!CmpLazyCommitListHead+0x8 (fffff805`528658e8)] ; rax = Head.Blink
	fffff805`52c313e2 4883c320        add     rbx,20h
	fffff805`52c313e6 483908          cmp     qword ptr [rax],rcx ; Head.Blink.Flink == Head ?
	fffff805`52c313e9 7407            je      nt!CmpQueueLazyCommitWorker+0x4e (fffff805`52c313f2)  Branch ; continue

	nt!CmpQueueLazyCommitWorker+0x47:
	fffff805`52c313eb b903000000      mov     ecx,3
	fffff805`52c313f0 cd29            int     29h

	nt!CmpQueueLazyCommitWorker+0x4e:
	; InsertTailList(rcx, rbx)
	fffff805`52c313f2 803d5baccdff00  cmp     byte ptr [nt!CmpLazyCommitWorkItemActive (fffff805`5290c054)],0
	fffff805`52c313f9 48890b          mov     qword ptr [rbx],rcx
	fffff805`52c313fc 48894308        mov     qword ptr [rbx+8],rax
	fffff805`52c31400 488918          mov     qword ptr [rax],rbx
	fffff805`52c31403 48891dde44c3ff  mov     qword ptr [nt!CmpLazyCommitListHead+0x8 (fffff805`528658e8)],rbx
	fffff805`52c3140a 750a            jne     nt!CmpQueueLazyCommitWorker+0x72 (fffff805`52c31416)  Branch
```

### ExAllocatePoolWithTag (see exercize 3)

### FsRtlNotifyCompleteIrpList

```
	nt!FsRtlNotifyCompleteIrpList:
	fffff805`52a93cc8 48895c2408      mov     qword ptr [rsp+8],rbx
	fffff805`52a93ccd 48896c2410      mov     qword ptr [rsp+10h],rbp
	fffff805`52a93cd2 4889742418      mov     qword ptr [rsp+18h],rsi
	fffff805`52a93cd7 57              push    rdi
	fffff805`52a93cd8 4883ec30        sub     rsp,30h
	fffff805`52a93cdc 8b6968          mov     ebp,dword ptr [rcx+68h]
	fffff805`52a93cdf 488d5930        lea     rbx,[rcx+30h]
	fffff805`52a93ce3 83616800        and     dword ptr [rcx+68h],0
	fffff805`52a93ce7 b8fdff0000      mov     eax,0FFFDh
	fffff805`52a93cec 66214148        and     word ptr [rcx+48h],ax
	fffff805`52a93cf0 8bf2            mov     esi,edx
	fffff805`52a93cf2 83616c00        and     dword ptr [rcx+6Ch],0
	fffff805`52a93cf6 488bf9          mov     rdi,rcx
	fffff805`52a93cf9 488b03          mov     rax,qword ptr [rbx] ; rax = rbx.Flink

	nt!FsRtlNotifyCompleteIrpList+0x34:
	fffff805`52a93cfc 48395808        cmp     qword ptr [rax+8],rbx ; rbx.Flink.Blink != rbx ?
	fffff805`52a93d00 7554            jne     nt!FsRtlNotifyCompleteIrpList+0x8e (fffff805`52a93d56)  Branch ; __fastfail

	nt!FsRtlNotifyCompleteIrpList+0x3a:
	fffff805`52a93d02 488b08          mov     rcx,qword ptr [rax] ; rcx = rbx.Flink.Flink
	fffff805`52a93d05 48394108        cmp     qword ptr [rcx+8],rax ; rbx.Flink.Flink.Blink != rbx.Flink ?
	fffff805`52a93d09 754b            jne     nt!FsRtlNotifyCompleteIrpList+0x8e (fffff805`52a93d56)  Branch ; __fastfail

	nt!FsRtlNotifyCompleteIrpList+0x43:
	; RemoveEntryList(rax)
	fffff805`52a93d0b 48890b          mov     qword ptr [rbx],rcx
	fffff805`52a93d0e 448bce          mov     r9d,esi
	fffff805`52a93d11 48895908        mov     qword ptr [rcx+8],rbx
	fffff805`52a93d15 448bc5          mov     r8d,ebp
	fffff805`52a93d18 48832000        and     qword ptr [rax],0
	fffff805`52a93d1c 488d8858ffffff  lea     rcx,[rax-0A8h]
	fffff805`52a93d23 488bd7          mov     rdx,rdi
	fffff805`52a93d26 c744242001000000 mov     dword ptr [rsp+20h],1
	fffff805`52a93d2e e831000000      call    nt!FsRtlNotifyCompleteIrp (fffff805`52a93d64)
	fffff805`52a93d33 85f6            test    esi,esi
	fffff805`52a93d35 7515            jne     nt!FsRtlNotifyCompleteIrpList+0x84 (fffff805`52a93d4c)  Branch

	nt!FsRtlNotifyCompleteIrpList+0x84:
	fffff805`52a93d4c 488b03          mov     rax,qword ptr [rbx] ; rax = rbx.Flink
	fffff805`52a93d4f 483bc3          cmp     rax,rbx ; rbx.Flink == rbx ?
	fffff805`52a93d52 74e3            je      nt!FsRtlNotifyCompleteIrpList+0x6f (fffff805`52a93d37)  Branch ; End of list, exit
```

### IopInitializeBootDrivers

```
	Symbol found but garbage memory.
```

### KiProcessDisconnectList

```
	nt!KiProcessDisconnectList+0x9:
	fffff805`526b1eb1 488b03          mov     rax,qword ptr [rbx] ; rax = rbx.Flink
	fffff805`526b1eb4 483bc3          cmp     rax,rbx ; rbx.Flink == rbx ?
	fffff805`526b1eb7 7438            je      nt!KiProcessDisconnectList+0x49 (fffff805`526b1ef1)  Branch ; End of list, exit

	nt!KiProcessDisconnectList+0x11:
	fffff805`526b1eb9 48395808        cmp     qword ptr [rax+8],rbx ; rbx.Flink.Blink != rbx ?
	fffff805`526b1ebd 752b            jne     nt!KiProcessDisconnectList+0x42 (fffff805`526b1eea)  Branch ; __fastfail

	nt!KiProcessDisconnectList+0x17:
	fffff805`526b1ebf 488b08          mov     rcx,qword ptr [rax] ; rcx = rbx.Flink.Flink
	fffff805`526b1ec2 48394108        cmp     qword ptr [rcx+8],rax ; rbx.Flink.Flink.Blink != rbx.Flink
	fffff805`526b1ec6 7522            jne     nt!KiProcessDisconnectList+0x42 (fffff805`526b1eea)  Branch ; __fastfail

	nt!KiProcessDisconnectList+0x20:
	; RemoveEntryList(rax)
	fffff805`526b1ec8 48890b          mov     qword ptr [rbx],rcx
	fffff805`526b1ecb 48895908        mov     qword ptr [rcx+8],rbx
	fffff805`526b1ecf 488b8088000000  mov     rax,qword ptr [rax+88h]
	fffff805`526b1ed6 488b08          mov     rcx,qword ptr [rax]
	fffff805`526b1ed9 4885c9          test    rcx,rcx
	fffff805`526b1edc 74d3            je      nt!KiProcessDisconnectList+0x9 (fffff805`526b1eb1)  Branch
```

### PnpDeviceCompletionQueueGetCompletedRequest

```
	nt!PnpDeviceCompletionQueueGetCompletedRequest:
	fffff805`52596c0c 48895c2408      mov     qword ptr [rsp+8],rbx
	fffff805`52596c11 57              push    rdi
	fffff805`52596c12 4883ec30        sub     rsp,30h
	fffff805`52596c16 488364242000    and     qword ptr [rsp+20h],0
	fffff805`52596c1c 488d0d45bc2c00  lea     rcx,[nt!PnpDeviceCompletionQueue+0x28 (fffff805`52862868)]
	fffff805`52596c23 4533c9          xor     r9d,r9d
	fffff805`52596c26 4533c0          xor     r8d,r8d
	fffff805`52596c29 33d2            xor     edx,edx
	fffff805`52596c2b e850bef0ff      call    nt!KeWaitForSingleObject (fffff805`524a2a80)
	fffff805`52596c30 488d0d51bc2c00  lea     rcx,[nt!PnpDeviceCompletionQueue+0x48 (fffff805`52862888)]
	fffff805`52596c37 e83499e9ff      call    nt!KeAcquireSpinLockRaiseToDpc (fffff805`52430570)
	fffff805`52596c3c 488b1d15bc2c00  mov     rbx,qword ptr [nt!PnpDeviceCompletionQueue+0x18 (fffff805`52862858)] ; rbx = _KQUEUE.EntryListHead.Flink (head)
	fffff805`52596c43 408af8          mov     dil,al
	fffff805`52596c46 488d050bbc2c00  lea     rax,[nt!PnpDeviceCompletionQueue+0x18 (fffff805`52862858)] ; rax = Head
	fffff805`52596c4d 488b13          mov     rdx,qword ptr [rbx] ; rdx = Head.Flink.Flink
	fffff805`52596c50 48394308        cmp     qword ptr [rbx+8],rax ; Head.Flink.Blink != Head ?
	fffff805`52596c54 7541            jne     nt!PnpDeviceCompletionQueueGetCompletedRequest+0x8b (fffff805`52596c97)  Branch ; __fastfail

	nt!PnpDeviceCompletionQueueGetCompletedRequest+0x4a:
	fffff805`52596c56 48395a08        cmp     qword ptr [rdx+8],rbx ; Head.Flink.Flink.Blink != Head.Flink ?
	fffff805`52596c5a 753b            jne     nt!PnpDeviceCompletionQueueGetCompletedRequest+0x8b (fffff805`52596c97)  Branch ; __fastfail

	nt!PnpDeviceCompletionQueueGetCompletedRequest+0x50:
	; RemoveEntryList(rbx)
	fffff805`52596c5c 488915f5bb2c00  mov     qword ptr [nt!PnpDeviceCompletionQueue+0x18 (fffff805`52862858)],rdx
	fffff805`52596c63 488d0d1ebc2c00  lea     rcx,[nt!PnpDeviceCompletionQueue+0x48 (fffff805`52862888)]
	fffff805`52596c6a 48894208        mov     qword ptr [rdx+8],rax
	fffff805`52596c6e e86d7de9ff      call    nt!KeReleaseSpinLockFromDpcLevel (fffff805`5242e9e0)
	fffff805`52596c73 8b0533d93d00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff805`529745ac)]
	fffff805`52596c79 85c0            test    eax,eax
	fffff805`52596c7b 0f857f250e00    jne     nt!PnpDeviceCompletionQueueGetCompletedRequest+0xe25f4 (fffff805`52679200)  Branch
```

### RtlDestroyAtomTable

```
	nt!RtlDestroyAtomTable+0xe0:
	fffff805`52a7d410 498b0c24        mov     rcx,qword ptr [r12] ; rcx = r12.Flink
	fffff805`52a7d414 493bcc          cmp     rcx,r12 ; r12.Flink != r12 ?
	fffff805`52a7d417 750d            jne     nt!RtlDestroyAtomTable+0xf6 (fffff805`52a7d426)  Branch ; continue

	nt!RtlDestroyAtomTable+0xe9:
	fffff805`52a7d419 498bcf          mov     rcx,r15
	fffff805`52a7d41c e82b010000      call    nt!RtlpFreeAtom (fffff805`52a7d54c)
	fffff805`52a7d421 e960ffffff      jmp     nt!RtlDestroyAtomTable+0x56 (fffff805`52a7d386)  Branch

	nt!RtlDestroyAtomTable+0xf6:
	fffff805`52a7d426 4c396108        cmp     qword ptr [rcx+8],r12 ; r12.Flink.Blink != r12
	fffff805`52a7d42a 7525            jne     nt!RtlDestroyAtomTable+0x121 (fffff805`52a7d451)  Branch ; __fastfail

	nt!RtlDestroyAtomTable+0xfc:
	fffff805`52a7d42c 488b01          mov     rax,qword ptr [rcx] ; rax = r12.Flink.Flink
	fffff805`52a7d42f 48394808        cmp     qword ptr [rax+8],rcx ; r12.Flink.Flink.Blink != r12.Flink ?
	fffff805`52a7d433 751c            jne     nt!RtlDestroyAtomTable+0x121 (fffff805`52a7d451)  Branch ; __fastfail

	nt!RtlDestroyAtomTable+0x105:
	; RemoveEntryList(rcx)
	fffff805`52a7d435 49890424        mov     qword ptr [r12],rax
	fffff805`52a7d439 4c896008        mov     qword ptr [rax+8],r12
	fffff805`52a7d43d e80a010000      call    nt!RtlpFreeAtom (fffff805`52a7d54c)
	fffff805`52a7d442 ebcc            jmp     nt!RtlDestroyAtomTable+0xe0 (fffff805`52a7d410)  Branch
```

### RtlEmptyAtomTable

```
	nt!RtlEmptyAtomTable+0x5a:
	; Singly list?
	fffff805`52cd384a 488b03          mov     rax,qword ptr [rbx] ; rax = rbx.Flink
	fffff805`52cd384d 488bd3          mov     rdx,rbx ; rdx = rbx
	fffff805`52cd3850 488906          mov     qword ptr [rsi],rax ; rsi.Flink = rbx.Flink
	fffff805`52cd3853 488bcf          mov     rcx,rdi
	fffff805`52cd3856 48832300        and     qword ptr [rbx],0 ; rbx.Flink = 0
	fffff805`52cd385a e81d9ddaff      call    nt!RtlpFreeHandleForAtom (fffff805`52a7d57c)
	fffff805`52cd385f 4c8d7310        lea     r14,[rbx+10h] ; 

	nt!RtlEmptyAtomTable+0x73:
	fffff805`52cd3863 498b0e          mov     rcx,qword ptr [r14] ; rcx = r14.Flink
	fffff805`52cd3866 493bce          cmp     rcx,r14 ; r14.Flink == r14 ?
	fffff805`52cd3869 741d            je      nt!RtlEmptyAtomTable+0x98 (fffff805`52cd3888)  Branch

	nt!RtlEmptyAtomTable+0x7b:
	fffff805`52cd386b 4c397108        cmp     qword ptr [rcx+8],r14 ; r14.Flink.Blink != r14 ?
	fffff805`52cd386f 7577            jne     nt!RtlEmptyAtomTable+0xf8 (fffff805`52cd38e8)  Branch ; __fastfail

	nt!RtlEmptyAtomTable+0x81:
	fffff805`52cd3871 488b01          mov     rax,qword ptr [rcx] ; rax = r14.Flink.Flink
	fffff805`52cd3874 48394808        cmp     qword ptr [rax+8],rcx ; r14.Flink.Flink.Blink != r14.Flink ?
	fffff805`52cd3878 756e            jne     nt!RtlEmptyAtomTable+0xf8 (fffff805`52cd38e8)  Branch ; __fastfail

	nt!RtlEmptyAtomTable+0x8a:
	; RemoveEntryList(rcx)
	fffff805`52cd387a 498906          mov     qword ptr [r14],rax
	fffff805`52cd387d 4c897008        mov     qword ptr [rax+8],r14
	fffff805`52cd3881 e8c69cdaff      call    nt!RtlpFreeAtom (fffff805`52a7d54c)
	fffff805`52cd3886 ebdb            jmp     nt!RtlEmptyAtomTable+0x73 (fffff805`52cd3863)  Branch
```

### RtlpFreeAllAtom

```
	nt!RtlpFreeAllAtom+0x84:
	fffff805`524e42a4 488b01          mov     rax,qword ptr [rcx] ; rax = rcx.Flink
	fffff805`524e42a7 48394808        cmp     qword ptr [rax+8],rcx ; rcx.Flink.Blink != rcx ?
	fffff805`524e42ab 750e            jne     nt!RtlpFreeAllAtom+0x9b (fffff805`524e42bb)  Branch ; __fastfail

	nt!RtlpFreeAllAtom+0x8d:
	; RemoveEntryList(rcx)
	fffff805`524e42ad 488907          mov     qword ptr [rdi],rax
	fffff805`524e42b0 48897808        mov     qword ptr [rax+8],rdi
	fffff805`524e42b4 e893925900      call    nt!RtlpFreeAtom (fffff805`52a7d54c)
	fffff805`524e42b9 ebc0            jmp     nt!RtlpFreeAllAtom+0x5b (fffff805`524e427b)  Branch
```
