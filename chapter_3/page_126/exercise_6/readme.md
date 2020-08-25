# Exercise
Repeat the previous exercise for RemoveEntryList in the following routines:

■ AlpcSectionDeleteProcedure<br>
■ AlpcpDeletePort<br>
■ AlpcpUnregisterCompletionListDatabase<br>
■ AuthzBasepRemoveSecurityAttributeFromLists<br>
■ CcDeleteBcbs<br>
■ CcFindNextWorkQueueEntry<br>
■ CcLazyWriteScan<br>
■ CcSetFileSizesEx<br>
■ CmShutdownSystem<br>
■ CmUnRegisterCallback<br>
■ CmpCallCallBacks<br>
■ CmpPostApc<br>
■ ExFreePoolWithTag<br>
■ ExQueueWorkItem<br>
■ ExTimerRundown<br>
■ ExpDeleteTimer<br>
■ ExpSetTimer<br>
■ IoDeleteDevice<br>
■ IoUnregisterFsRegistrationChange<br>
■ IopfCompleteRequest<br>
■ KeDeregisterBugCheckCallback<br>
■ KeDeregisterObjectNotification<br>
■ KeRegisterObjectNotification<br>
■ KeRemoveQueueApc<br>
■ KeRemoveQueueDpc<br>
■ KiCancelTimer<br>
■ KeTerminateThread<br>
■ KiDeliverApc<br>
■ KiExecuteAllDpcs<br>
■ KiExpireTimerTable<br>
■ KiFindReadyThread<br>
■ KiFlushQueueApc<br>
■ KiInsertTimerTable<br>
■ KiProcessExpiredTimerList<br>
■ MiDeleteVirtualAddresses<br>
■ NtNotifyChangeMultipleKeys<br>
■ ObRegisterCallbacks<br>
■ ObUnRegisterCallbacks

# Solution

### AlpcSectionDeleteProcedure (calls AlpcpRemoveResourcePort)

```
	nt!AlpcpRemoveResourcePort:
	fffff805`529ce2e0 48895c2408      mov     qword ptr [rsp+8],rbx
	fffff805`529ce2e5 57              push    rdi
	fffff805`529ce2e6 4883ec20        sub     rsp,20h
	fffff805`529ce2ea 488db948010000  lea     rdi,[rcx+148h]
	fffff805`529ce2f1 488d5ad0        lea     rbx,[rdx-30h]
	fffff805`529ce2f5 488bcf          mov     rcx,rdi
	fffff805`529ce2f8 33d2            xor     edx,edx
	fffff805`529ce2fa e89137adff      call    nt!ExAcquirePushLockExclusiveEx (fffff805`524a1a90)
	fffff805`529ce2ff 488b03          mov     rax,qword ptr [rbx] ; rax = rbx.Flink
	fffff805`529ce302 483bc3          cmp     rax,rbx ; rbx.Flink == rbx ?
	fffff805`529ce305 741d            je      nt!AlpcpRemoveResourcePort+0x44 (fffff805`529ce324)  Branch

	nt!AlpcpRemoveResourcePort+0x27:
	fffff805`529ce307 48395808        cmp     qword ptr [rax+8],rbx ; rbx.Flink.Blink != rbx ?
	fffff805`529ce30b 7543            jne     nt!AlpcpRemoveResourcePort+0x70 (fffff805`529ce350)  Branch ; __fastfail

	nt!AlpcpRemoveResourcePort+0x2d:
	fffff805`529ce30d 488b4b08        mov     rcx,qword ptr [rbx+8] ; rcx = rbx.Blink
	fffff805`529ce311 483919          cmp     qword ptr [rcx],rbx ; rbx.Blink.Flink != rbx ?
	fffff805`529ce314 753a            jne     nt!AlpcpRemoveResourcePort+0x70 (fffff805`529ce350)  Branch ; __fastfail

	nt!AlpcpRemoveResourcePort+0x36:
	; RemoveEntryList(rbx)
	fffff805`529ce316 488901          mov     qword ptr [rcx],rax ; rbx.Blink.Flink = rbx.Flink
	fffff805`529ce319 48894808        mov     qword ptr [rax+8],rcx ; rbx.Flink.Blink = 
	; InitializeListHead(rbx)
	fffff805`529ce31d 48895b08        mov     qword ptr [rbx+8],rbx
	fffff805`529ce321 48891b          mov     qword ptr [rbx],rbx
```

### AlpcpDeletePort

```
	Didn't find list-related code.
```

### AlpcpUnregisterCompletionListDatabase

```
	nt!AlpcpUnregisterCompletionListDatabase:
	fffff805`52af6e04 4053            push    rbx
	fffff805`52af6e06 4883ec20        sub     rsp,20h
	fffff805`52af6e0a 488bd9          mov     rbx,rcx
	fffff805`52af6e0d 33d2            xor     edx,edx
	fffff805`52af6e0f 488d0daa18d5ff  lea     rcx,[nt!AlpcpCompletionListDatabase (fffff805`528486c0)]
	fffff805`52af6e16 e875ac9aff      call    nt!ExAcquirePushLockExclusiveEx (fffff805`524a1a90)
	fffff805`52af6e1b 488b13          mov     rdx,qword ptr [rbx] ; rdx = rbx.Flink
	fffff805`52af6e1e 48395a08        cmp     qword ptr [rdx+8],rbx ; rbx.Flink.Blink != rbx ?
	fffff805`52af6e22 7549            jne     nt!AlpcpUnregisterCompletionListDatabase+0x69 (fffff805`52af6e6d)  Branch ; __fastfail

	nt!AlpcpUnregisterCompletionListDatabase+0x20:
	fffff805`52af6e24 488b4308        mov     rax,qword ptr [rbx+8] ; rax = rbx.Blink
	fffff805`52af6e28 483918          cmp     qword ptr [rax],rbx ; rbx.Blink.Flink != rbx ?
	fffff805`52af6e2b 7540            jne     nt!AlpcpUnregisterCompletionListDatabase+0x69 (fffff805`52af6e6d)  Branch ; __fastfail

	nt!AlpcpUnregisterCompletionListDatabase+0x29:
	; RemoveEntryList(rbx)
	fffff805`52af6e2d 488910          mov     qword ptr [rax],rdx
	fffff805`52af6e30 48894208        mov     qword ptr [rdx+8],rax
	fffff805`52af6e34 ff0d8e18d5ff    dec     dword ptr [nt!AlpcpCompletionListDatabase+0x8 (fffff805`528486c8)]
	fffff805`52af6e3a 4883c8ff        or      rax,0FFFFFFFFFFFFFFFFh
	fffff805`52af6e3e f0480fc1057918d5ff lock xadd qword ptr [nt!AlpcpCompletionListDatabase (fffff805`528486c0)],rax
	fffff805`52af6e47 2406            and     al,6
	fffff805`52af6e49 3c02            cmp     al,2
	fffff805`52af6e4b 7412            je      nt!AlpcpUnregisterCompletionListDatabase+0x5b (fffff805`52af6e5f)  Branch
```

### AuthzBasepRemoveSecurityAttributeFromLists

```
	nt!AuthzBasepRemoveSecurityAttributeFromLists+0x1c:
	fffff805`525249cc 488b02          mov     rax,qword ptr [rdx] ; rax = rdx.Flink
	fffff805`525249cf 48395008        cmp     qword ptr [rax+8],rdx ; rdx.Flink.Blink != rdx ?
	fffff805`525249d3 751d            jne     nt!AuthzBasepRemoveSecurityAttributeFromLists+0x42 (fffff805`525249f2)  Branch ; __fastfail

	nt!AuthzBasepRemoveSecurityAttributeFromLists+0x25:
	fffff805`525249d5 4c8b4208        mov     r8,qword ptr [rdx+8] ; r8 = rdx.Blink
	fffff805`525249d9 493910          cmp     qword ptr [r8],rdx ; rdx.Blink.Flink != rdx ?
	fffff805`525249dc 7514            jne     nt!AuthzBasepRemoveSecurityAttributeFromLists+0x42 (fffff805`525249f2)  Branch ; __fastfail

	nt!AuthzBasepRemoveSecurityAttributeFromLists+0x2e:
	; RemoveEntryList(rdx)
	fffff805`525249de 498900          mov     qword ptr [r8],rax
	fffff805`525249e1 4c894008        mov     qword ptr [rax+8],r8
	fffff805`525249e5 836238fe        and     dword ptr [rdx+38h],0FFFFFFFEh
	fffff805`525249e9 4885c9          test    rcx,rcx
	fffff805`525249ec 7403            je      nt!AuthzBasepRemoveSecurityAttributeFromLists+0x41 (fffff805`525249f1)  Branch

	nt!AuthzBasepRemoveSecurityAttributeFromLists+0x12ce05:
	fffff805`526517b5 488d4210        lea     rax,[rdx+10h]
	fffff805`526517b9 4c8b00          mov     r8,qword ptr [rax] ; r8 = rax.Flink
	fffff805`526517bc 49394008        cmp     qword ptr [r8+8],rax ; rax.Flink.Blink != rax ?
	fffff805`526517c0 0f852c32edff    jne     nt!AuthzBasepRemoveSecurityAttributeFromLists+0x42 (fffff805`525249f2)  Branch ; __fastfail

	nt!AuthzBasepRemoveSecurityAttributeFromLists+0x12ce16:
	fffff805`526517c6 4c8b4808        mov     r9,qword ptr [rax+8] ; r9 = rax.Blink
	fffff805`526517ca 493901          cmp     qword ptr [r9],rax ; rax.Blink.Flink != rax ?
	fffff805`526517cd 0f851f32edff    jne     nt!AuthzBasepRemoveSecurityAttributeFromLists+0x42 (fffff805`525249f2)  Branch ; __fastfail

	nt!AuthzBasepRemoveSecurityAttributeFromLists+0x12ce23:
	; RemoveEntryList(rax)
	fffff805`526517d3 4d8901          mov     qword ptr [r9],r8
	fffff805`526517d6 4d894808        mov     qword ptr [r8+8],r9
	fffff805`526517da 836238fd        and     dword ptr [rdx+38h],0FFFFFFFDh
	fffff805`526517de 4885c9          test    rcx,rcx
	fffff805`526517e1 0f84d931edff    je      nt!AuthzBasepRemoveSecurityAttributeFromLists+0x10 (fffff805`525249c0)  Branch
```

### CcDeleteBcbs

```
	nt!CcDeleteBcbs+0x45:
	fffff805`5256926d 488d5ef0        lea     rbx,[rsi-10h]
	fffff805`52569271 b8fd020000      mov     eax,2FDh
	fffff805`52569276 488d4b10        lea     rcx,[rbx+10h]
	fffff805`5256927a 488b31          mov     rsi,qword ptr [rcx] ; rsi = rcx.Flink
	fffff805`5256927d 663903          cmp     word ptr [rbx],ax
	fffff805`52569280 0f8406ef0f00    je      nt!CcDeleteBcbs+0xfef64 (fffff805`5266818c)  Branch

	nt!CcDeleteBcbs+0xfef6e:
	fffff805`52668196 488b4108        mov     rax,qword ptr [rcx+8] ; rax = rcx.Blink
	fffff805`5266819a 48394e08        cmp     qword ptr [rsi+8],rcx ; rcx.Flink.Blink != rcx ?
	fffff805`5266819e 0f85f5000000    jne     nt!CcDeleteBcbs+0xff071 (fffff805`52668299)  Branch ; __fastfail

	nt!CcDeleteBcbs+0xfef7c:
	fffff805`526681a4 483908          cmp     qword ptr [rax],rcx ; rcx.Blink.Flink != rcx ?
	fffff805`526681a7 0f85ec000000    jne     nt!CcDeleteBcbs+0xff071 (fffff805`52668299)  Branch ; __fastfail

	nt!CcDeleteBcbs+0xfef85:
	; RemoveEntryList(rcx)
	fffff805`526681ad 488930          mov     qword ptr [rax],rsi
	fffff805`526681b0 48894608        mov     qword ptr [rsi+8],rax
	fffff805`526681b4 48817f2000000002 cmp     qword ptr [rdi+20h],2000000h
	fffff805`526681bc 7e1c            jle     nt!CcDeleteBcbs+0xfefb2 (fffff805`526681da)  Branch
```

### CcFindNextWorkQueueEntry

```
	nt!CcFindNextWorkQueueEntry+0x28:
	fffff805`5252fba4 498b00          mov     rax,qword ptr [r8] ; rax = r8.Flink
	fffff805`5252fba7 4c394008        cmp     qword ptr [rax+8],r8 ; r8.Flink.Blink != r8 ?
	fffff805`5252fbab 0f8571e81000    jne     nt!RtlpHpVsSubsegmentCleanup+0x147b82 (fffff805`5263e422)  Branch ; __fastfail

	nt!CcFindNextWorkQueueEntry+0x35:
	fffff805`5252fbb1 498b4808        mov     rcx,qword ptr [r8+8] ; rcx = r8.Blink
	fffff805`5252fbb5 4c3901          cmp     qword ptr [rcx],r8 ; r8.Blink.Flink != r8 ?
	fffff805`5252fbb8 0f8564e81000    jne     nt!RtlpHpVsSubsegmentCleanup+0x147b82 (fffff805`5263e422)  Branch ; __fastfail

	nt!CcFindNextWorkQueueEntry+0x42:
	; RemoveEntryList(r8)
	fffff805`5252fbbe 488901          mov     qword ptr [rcx],rax
	fffff805`5252fbc1 48894808        mov     qword ptr [rax+8],rcx
	; r8.Flink = r8.Blink = 0
	fffff805`5252fbc5 4d895008        mov     qword ptr [r8+8],r10
	fffff805`5252fbc9 4d8910          mov     qword ptr [r8],r10

	nt!CcFindNextWorkQueueEntry:
	fffff805`5252fb7c 4c8b02          mov     r8,qword ptr [rdx]
	fffff805`5252fb7f 4533d2          xor     r10d,r10d ; r10d = 0 (zeroes all of r10)
	fffff805`5252fb82 458bca          mov     r9d,r10d
	fffff805`5252fb85 4c3bc2          cmp     r8,rdx
	fffff805`5252fb88 7442            je      nt!CcFindNextWorkQueueEntry+0x50 (fffff805`5252fbcc)  Branch
```

### CcLazyWriteScan

```
	nt!CcLazyWriteScan+0x541:
	fffff805`5252e331 498b0e          mov     rcx,qword ptr [r14] ; rcx = r14.Flink
	fffff805`5252e334 498b4608        mov     rax,qword ptr [r14+8] ; rax = r14.Blink
	fffff805`5252e338 4c397108        cmp     qword ptr [rcx+8],r14 ; r14.Flink.Blink != r14 ?
	fffff805`5252e33c 0f850f020000    jne     nt!CcLazyWriteScan+0x761 (fffff805`5252e551)  Branch ; __fastfail

	nt!CcLazyWriteScan+0x552:
	fffff805`5252e342 4c3930          cmp     qword ptr [rax],r14 ; r14.Blink.Flink != r14 ?
	fffff805`5252e345 0f8506020000    jne     nt!CcLazyWriteScan+0x761 (fffff805`5252e551)  Branch ; __fastfail

	nt!CcLazyWriteScan+0x55b:
	; RemoveEntryList(r14)
	fffff805`5252e34b 488908          mov     qword ptr [rax],rcx
	fffff805`5252e34e 48894108        mov     qword ptr [rcx+8],rax
	fffff805`5252e352 498b4508        mov     rax,qword ptr [r13+8] ; rax = r13.Blink
	fffff805`5252e356 4c3928          cmp     qword ptr [rax],r13 ; r13.Blink.Flink != r13 ?
	fffff805`5252e359 0f85f2010000    jne     nt!CcLazyWriteScan+0x761 (fffff805`5252e551)  Branch ; __fastfail

	nt!CcLazyWriteScan+0x56f:
	; InsertTailList(r13, r14)
	fffff805`5252e35f 4d892e          mov     qword ptr [r14],r13
	fffff805`5252e362 49894608        mov     qword ptr [r14+8],rax
	fffff805`5252e366 4c8930          mov     qword ptr [rax],r14
	fffff805`5252e369 4d897508        mov     qword ptr [r13+8],r14

	; So seems like the _LIST_ENTRY object pointed to by r14 is being transferred from one list to another.

	nt!CcLazyWriteScan+0x5ee:
	fffff805`5252e3de 498b0e          mov     rcx,qword ptr [r14] ; rcx = r14.Flink
	fffff805`5252e3e1 498b4608        mov     rax,qword ptr [r14+8] ; rax = r14.Blink
	fffff805`5252e3e5 4c397108        cmp     qword ptr [rcx+8],r14 ; r14.Flink.Blink != r14 ?
	fffff805`5252e3e9 0f8562010000    jne     nt!CcLazyWriteScan+0x761 (fffff805`5252e551)  Branch ; __fastfail

	nt!CcLazyWriteScan+0x5ff:
	fffff805`5252e3ef 4c3930          cmp     qword ptr [rax],r14 ; r14.Blink.Flink != r14 ?
	fffff805`5252e3f2 0f8559010000    jne     nt!CcLazyWriteScan+0x761 (fffff805`5252e551)  Branch ; __fastfail

	nt!CcLazyWriteScan+0x608:
	; RemoveEntryList(r14)
	fffff805`5252e3f8 488908          mov     qword ptr [rax],rcx
	fffff805`5252e3fb 48894108        mov     qword ptr [rcx+8],rax
	fffff805`5252e3ff 498b4500        mov     rax,qword ptr [r13] ; rax = r13.Flink
	fffff805`5252e403 4c396808        cmp     qword ptr [rax+8],r13 ; r13.Flink.Blink != r13 ?
	fffff805`5252e407 0f8544010000    jne     nt!CcLazyWriteScan+0x761 (fffff805`5252e551)  Branch ; __fastfail

	nt!CcLazyWriteScan+0x61d:
	; InsertHeadList(r13, r14)
	fffff805`5252e40d 498906          mov     qword ptr [r14],rax
	fffff805`5252e410 4d896e08        mov     qword ptr [r14+8],r13
	fffff805`5252e414 4c897008        mov     qword ptr [rax+8],r14
	fffff805`5252e418 4d897500        mov     qword ptr [r13],r14
	fffff805`5252e41c c6456700        mov     byte ptr [rbp+67h],0
	fffff805`5252e420 e923fcffff      jmp     nt!CcLazyWriteScan+0x258 (fffff805`5252e048)  Branch

	; Again - move from one list to the other
```

### CcSetFileSizesEx (see exercize 3)

### CmShutdownSystem

```
	Didn't find list related operations.
```

### CmUnRegisterCallback

```
	nt!CmUnRegisterCallback+0x102:
	fffff805`52c27e22 65488b042588010000 mov   rax,qword ptr gs:[188h]
	fffff805`52c27e2b 664401a0e4010000 add     word ptr [rax+1E4h],r12w
	fffff805`52c27e33 33d2            xor     edx,edx
	fffff805`52c27e35 498bce          mov     rcx,r14
	fffff805`52c27e38 e8539c87ff      call    nt!ExAcquirePushLockExclusiveEx (fffff805`524a1a90)
	fffff805`52c27e3d 488b0f          mov     rcx,qword ptr [rdi] ; rcx = rdi.Flink
	fffff805`52c27e40 488b4708        mov     rax,qword ptr [rdi+8] ; rax = rdi.Blink
	fffff805`52c27e44 48397908        cmp     qword ptr [rcx+8],rdi ; rdi.Flink.Blink != rdi ?
	fffff805`52c27e48 754e            jne     nt!CmUnRegisterCallback+0x178 (fffff805`52c27e98)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x12a:
	fffff805`52c27e4a 483938          cmp     qword ptr [rax],rdi ; rdi.Blink.Flink != rdi ?
	fffff805`52c27e4d 7549            jne     nt!CmUnRegisterCallback+0x178 (fffff805`52c27e98)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x12f:
	; RemoveEntryList(rdi)
	fffff805`52c27e4f 488908          mov     qword ptr [rax],rcx
	fffff805`52c27e52 48894108        mov     qword ptr [rcx+8],rax

	nt!CmUnRegisterCallback+0x17f:
	fffff805`52c27e9f 488b17          mov     rdx,qword ptr [rdi] ; rdx = rdi.Flink
	fffff805`52c27ea2 488b4708        mov     rax,qword ptr [rdi+8] ; rax = rdi.Blink
	fffff805`52c27ea6 48397a08        cmp     qword ptr [rdx+8],rdi ; rdi.Flink.Blink != rdi ?
	fffff805`52c27eaa 0f85fc000000    jne     nt!CmUnRegisterCallback+0x28c (fffff805`52c27fac)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x190:
	fffff805`52c27eb0 483938          cmp     qword ptr [rax],rdi ; rdi.Blink.Flink != rdi ?
	fffff805`52c27eb3 0f85f3000000    jne     nt!CmUnRegisterCallback+0x28c (fffff805`52c27fac)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x199:
	; RemoveEntryList(rdi)
	fffff805`52c27eb9 488910          mov     qword ptr [rax],rdx
	fffff805`52c27ebc 48894208        mov     qword ptr [rdx+8],rax
	fffff805`52c27ec0 33d2            xor     edx,edx
	fffff805`52c27ec2 498bce          mov     rcx,r14
	fffff805`52c27ec5 e896a087ff      call    nt!ExReleasePushLockEx (fffff805`524a1f60)
	fffff805`52c27eca 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
	fffff805`52c27ed3 e848aa87ff      call    nt!KeLeaveCriticalRegionThread (fffff805`524a2920)
	fffff805`52c27ed8 33f6            xor     esi,esi
	fffff805`52c27eda 89b424d8000000  mov     dword ptr [rsp+0D8h],esi

	nt!CmUnRegisterCallback+0x231:
	fffff805`52c27f51 498d4610        lea     rax,[r14+10h]
	fffff805`52c27f55 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff805`52c27f58 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = rax.Blink
	fffff805`52c27f5c 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff805`52c27f60 7579            jne     nt!CmUnRegisterCallback+0x2bb (fffff805`52c27fdb)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x242:
	fffff805`52c27f62 483901          cmp     qword ptr [rcx],rax ; rax.Blink.Flink != rax ?
	fffff805`52c27f65 7574            jne     nt!CmUnRegisterCallback+0x2bb (fffff805`52c27fdb)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x247:
	; RemoveEntryList(rax)
	fffff805`52c27f67 488911          mov     qword ptr [rcx],rdx
	fffff805`52c27f6a 48894a08        mov     qword ptr [rdx+8],rcx
	fffff805`52c27f6e 498b0e          mov     rcx,qword ptr [r14] ; rcx = r14.Flink
	fffff805`52c27f71 498b4608        mov     rax,qword ptr [r14+8] ; rax = r14.Blink
	fffff805`52c27f75 4c397108        cmp     qword ptr [rcx+8],r14 ; r14.Flink.Blink != r14 ?
	fffff805`52c27f79 7559            jne     nt!CmUnRegisterCallback+0x2b4 (fffff805`52c27fd4)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x25b:
	fffff805`52c27f7b 4c3930          cmp     qword ptr [rax],r14 ; r14.Blink.Flink != r14 ?
	fffff805`52c27f7e 7554            jne     nt!CmUnRegisterCallback+0x2b4 (fffff805`52c27fd4)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x260:
	; RemoveEntryList(r14)
	fffff805`52c27f80 488908          mov     qword ptr [rax],rcx
	fffff805`52c27f83 48894108        mov     qword ptr [rcx+8],rax
	fffff805`52c27f87 488b442460      mov     rax,qword ptr [rsp+60h] ; rax = Entry.Blink (entry on stack, +60h comes after +58h)
	fffff805`52c27f8c 488d4c2458      lea     rcx,[rsp+58h] ; rcx = Entry
	fffff805`52c27f91 483908          cmp     qword ptr [rax],rcx ; Entry.Blink.Flink != Entry ?
	fffff805`52c27f94 7537            jne     nt!CmUnRegisterCallback+0x2ad (fffff805`52c27fcd)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x276:
	fffff805`52c27f96 488d4c2458      lea     rcx,[rsp+58h] ; redundant unless jumped to from other code
	; InsertTailList(rcx, rbx)
	fffff805`52c27f9b 48890b          mov     qword ptr [rbx],rcx
	fffff805`52c27f9e 48894308        mov     qword ptr [rbx+8],rax
	fffff805`52c27fa2 488918          mov     qword ptr [rax],rbx
	fffff805`52c27fa5 48895c2460      mov     qword ptr [rsp+60h],rbx
	fffff805`52c27faa eb12            jmp     nt!CmUnRegisterCallback+0x29e (fffff805`52c27fbe)  Branch
```

### CmpCallBallBacks

```
	nt!CmUnRegisterCallback+0x231:
	fffff805`52c27f51 498d4610        lea     rax,[r14+10h]
	fffff805`52c27f55 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff805`52c27f58 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = rax.Blink
	fffff805`52c27f5c 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff805`52c27f60 7579            jne     nt!CmUnRegisterCallback+0x2bb (fffff805`52c27fdb)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x242:
	fffff805`52c27f62 483901          cmp     qword ptr [rcx],rax ; rax.Blink.Flink != rax ?
	fffff805`52c27f65 7574            jne     nt!CmUnRegisterCallback+0x2bb (fffff805`52c27fdb)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x247:
	; RemoveEntryList(rax)
	fffff805`52c27f67 488911          mov     qword ptr [rcx],rdx
	fffff805`52c27f6a 48894a08        mov     qword ptr [rdx+8],rcx
	fffff805`52c27f6e 498b0e          mov     rcx,qword ptr [r14] ; rcx = r14.Flink
	fffff805`52c27f71 498b4608        mov     rax,qword ptr [r14+8] ; rax = r14.Blink
	fffff805`52c27f75 4c397108        cmp     qword ptr [rcx+8],r14 ; r14.Flink.Blink != r14 ?
	fffff805`52c27f79 7559            jne     nt!CmUnRegisterCallback+0x2b4 (fffff805`52c27fd4)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x25b:
	fffff805`52c27f7b 4c3930          cmp     qword ptr [rax],r14 ; r14.Blink.Flink != r14 ?
	fffff805`52c27f7e 7554            jne     nt!CmUnRegisterCallback+0x2b4 (fffff805`52c27fd4)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x260:
	; RemoveEntryList(r14)
	fffff805`52c27f80 488908          mov     qword ptr [rax],rcx
	fffff805`52c27f83 48894108        mov     qword ptr [rcx+8],rax
	fffff805`52c27f87 488b442460      mov     rax,qword ptr [rsp+60h] ; rax = Entry.Blink (entry on stack, +60h comes after +58h)
	fffff805`52c27f8c 488d4c2458      lea     rcx,[rsp+58h] ; rcx = Entry
	fffff805`52c27f91 483908          cmp     qword ptr [rax],rcx ; Entry.Blink.Flink != Entry ?
	fffff805`52c27f94 7537            jne     nt!CmUnRegisterCallback+0x2ad (fffff805`52c27fcd)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x276:
	fffff805`52c27f96 488d4c2458      lea     rcx,[rsp+58h] ; redundant unless jumped to from other code
	; InsertTailList(rcx, rbx)
	fffff805`52c27f9b 48890b          mov     qword ptr [rbx],rcx
	fffff805`52c27f9e 48894308        mov     qword ptr [rbx+8],rax
	fffff805`52c27fa2 488918          mov     qword ptr [rax],rbx
	fffff805`52c27fa5 48895c2460      mov     qword ptr [rsp+60h],rbx
	fffff805`52c27faa eb12            jmp     nt!CmUnRegisterCallback+0x29e (fffff805`52c27fbe)  Branch

	nt!CmUnRegisterCallback+0x2de:
	fffff805`52c27ffe 488d4c2458      lea     rcx,[rsp+58h] ; rcx = Entry
	fffff805`52c28003 488b442458      mov     rax,qword ptr [rsp+58h] ; rax = Entry.Flink
	fffff805`52c28008 483bc1          cmp     rax,rcx ; Entry.Flink == Entry ?
	fffff805`52c2800b 0f849e000000    je      nt!CmUnRegisterCallback+0x38f (fffff805`52c280af)  Branch

	nt!CmUnRegisterCallback+0x2f1:
	fffff805`52c28011 488b08          mov     rcx,qword ptr [rax] ; rcx = Entry.Flink.Flink
	fffff805`52c28014 488d542458      lea     rdx,[rsp+58h] ; rdx = Entry
	fffff805`52c28019 48395008        cmp     qword ptr [rax+8],rdx ; Entry.Flink.Blink != Entry ?
	fffff805`52c2801d 0f8585000000    jne     nt!CmUnRegisterCallback+0x388 (fffff805`52c280a8)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x303:
	fffff805`52c28023 48394108        cmp     qword ptr [rcx+8],rax ; Entry.Flink.Flink.Blink != Entry.Flink ?
	fffff805`52c28027 757f            jne     nt!CmUnRegisterCallback+0x388 (fffff805`52c280a8)  Branch ; __fastfail

	nt!CmUnRegisterCallback+0x309:
	; RemoveEntryList(rax)
	fffff805`52c28029 48894c2458      mov     qword ptr [rsp+58h],rcx ; Entry.Flink = Entry.Flink.Flink
	fffff805`52c2802e 488d542458      lea     rdx,[rsp+58h] ; rdx = Entry
	fffff805`52c28033 48895108        mov     qword ptr [rcx+8],rdx ; Entry.Flink.Flink.Blink = Entry
	fffff805`52c28037 488d58f0        lea     rbx,[rax-10h]
	fffff805`52c2803b 48895c2448      mov     qword ptr [rsp+48h],rbx
	fffff805`52c28040 488b4330        mov     rax,qword ptr [rbx+30h]
	fffff805`52c28044 4889442468      mov     qword ptr [rsp+68h],rax
	fffff805`52c28049 488b4338        mov     rax,qword ptr [rbx+38h]
	fffff805`52c2804d 4889442470      mov     qword ptr [rsp+70h],rax
	fffff805`52c28052 488b4728        mov     rax,qword ptr [rdi+28h]
	fffff805`52c28056 4c8d442468      lea     r8,[rsp+68h]
	fffff805`52c2805b ba28000000      mov     edx,28h
	fffff805`52c28060 488b4f20        mov     rcx,qword ptr [rdi+20h]
	fffff805`52c28064 e8272e9aff      call    nt!guard_dispatch_icall (fffff805`525cae90)
	fffff805`52c28069 eb22            jmp     nt!CmUnRegisterCallback+0x36d (fffff805`52c2808d)  Branch
```

### CmpPostApc

```
	fffff805`52aa56e6 488d4310        lea     rax,[rbx+10h] ; if rbx points to _KAPC then rax = _KAPC.ApcListEntry
	fffff805`52aa56ea 4c8b00          mov     r8,qword ptr [rax] ; r8 = Entry.Flink
	fffff805`52aa56ed 488b5008        mov     rdx,qword ptr [rax+8] ; rdx = Entry.Blink
	fffff805`52aa56f1 49394008        cmp     qword ptr [r8+8],rax ; Entry.Flink.Blink != Entry ?
	fffff805`52aa56f5 7527            jne     nt!CmpPostApc+0x18e (fffff805`52aa571e)  Branch ; __fastfail

	nt!CmpPostApc+0x167:
	fffff805`52aa56f7 483902          cmp     qword ptr [rdx],rax ; Entry.Blink.Flink != Entry ?
	fffff805`52aa56fa 7522            jne     nt!CmpPostApc+0x18e (fffff805`52aa571e)  Branch ; __fastfail

	nt!CmpPostApc+0x16c:
	; RemoveEntryList(rax)
	fffff805`52aa56fc 4c8902          mov     qword ptr [rdx],r8
	fffff805`52aa56ff 49895008        mov     qword ptr [r8+8],rdx
	fffff805`52aa5703 488bcb          mov     rcx,rbx
	fffff805`52aa5706 e8099a0200      call    nt!CmpFreeSubordinatePost (fffff805`52acf114)
	fffff805`52aa570b 488bcb          mov     rcx,rbx
	fffff805`52aa570e e819000000      call    nt!CmpFreePostBlock (fffff805`52aa572c)
	fffff805`52aa5713 488b5c2440      mov     rbx,qword ptr [rsp+40h]
	fffff805`52aa5718 4883c430        add     rsp,30h
	fffff805`52aa571c 5f              pop     rdi
	fffff805`52aa571d c3              ret
```

### ExFreePoolWithTag (see exercize 2)

### ExQueueWorkItem (see exercize 3)

### ExTimerRundown

```
	Can't find list related code.
```

### ExpDeleteTimer

```
	nt!ExpDeleteTimer+0x123e8e:
	fffff802`80658ade 498b0e          mov     rcx,qword ptr [r14] ; rcx = r14.Flink
	fffff802`80658ae1 498b4608        mov     rax,qword ptr [r14+8] ; rax = r14.Blink
	fffff802`80658ae5 4c397108        cmp     qword ptr [rcx+8],r14 ; r14.Flink.Blink != r14 ?
	fffff802`80658ae9 0f8518020000    jne     nt!ExpDeleteTimer+0x1240b7 (fffff802`80658d07)  Branch ; __fastfail

	nt!ExpDeleteTimer+0x123e9f:
	fffff802`80658aef 4c3930          cmp     qword ptr [rax],r14 ; r14.Blink.Flink != r14 ?
	fffff802`80658af2 0f850f020000    jne     nt!ExpDeleteTimer+0x1240b7 (fffff802`80658d07)  Branch ; __fastfail

	nt!ExpDeleteTimer+0x123ea8:
	; RemoveEntryList(r14)
	fffff802`80658af8 488908          mov     qword ptr [rax],rcx
	fffff802`80658afb 48894108        mov     qword ptr [rcx+8],rax
	fffff802`80658aff 49832600        and     qword ptr [r14],0
	fffff802`80658b03 4983ceff        or      r14,0FFFFFFFFFFFFFFFFh
	fffff802`80658b07 498bc6          mov     rax,r14
	fffff802`80658b0a f0480fc105cd8a1d00 lock xadd qword ptr [nt!ExpWakeTimerLock (fffff802`808315e0)],rax
	fffff802`80658b13 2406            and     al,6
	fffff802`80658b15 3c02            cmp     al,2
	fffff802`80658b17 7508            jne     nt!ExpDeleteTimer+0x123ed1 (fffff802`80658b21)  Branch
```

### ExpSetTimer (see exercize 3)

### IoDeleteDevice (calls PoRunDownDeviceObject)

```
	nt!PoRunDownDeviceObject+0x3c:
	fffff802`804e10d4 488b0da5334900  mov     rcx,qword ptr [nt!ExPageLockHandle (fffff802`80974480)]
	fffff802`804e10db e8b04c5c00      call    nt!MmLockPagableSectionByHandle (fffff802`80aa5d90)
	fffff802`804e10e0 488d0d99473600  lea     rcx,[nt!PopVolumeLock (fffff802`80845880)]
	fffff802`804e10e7 e89400fcff      call    nt!ExAcquireFastMutex (fffff802`804a1180)
	fffff802`804e10ec 488d0d1d473600  lea     rcx,[nt!PopDopeGlobalLock (fffff802`80845810)]
	fffff802`804e10f3 e878f4f4ff      call    nt!KeAcquireSpinLockRaiseToDpc (fffff802`80430570)
	fffff802`804e10f8 488d4b48        lea     rcx,[rbx+48h]
	fffff802`804e10fc 408af8          mov     dil,al
	fffff802`804e10ff 488b11          mov     rdx,qword ptr [rcx] ; rdx = rcx.Flink
	fffff802`804e1102 4885d2          test    rdx,rdx ; rdx == 0 ?
	fffff802`804e1105 741f            je      nt!PoRunDownDeviceObject+0x8e (fffff802`804e1126)  Branch

	nt!PoRunDownDeviceObject+0x6f:
	fffff802`804e1107 4c8b4108        mov     r8,qword ptr [rcx+8] ; r8 = rcx.Blink
	fffff802`804e110b 48394a08        cmp     qword ptr [rdx+8],rcx ; rcx.Flink.Blink != rcx ?
	fffff802`804e110f 7565            jne     nt!PoRunDownDeviceObject+0xde (fffff802`804e1176)  Branch ; __fastfail

	nt!PoRunDownDeviceObject+0x79:
	fffff802`804e1111 493908          cmp     qword ptr [r8],rcx ; rcx.Blink.Flink != rcx ?
	fffff802`804e1114 7560            jne     nt!PoRunDownDeviceObject+0xde (fffff802`804e1176)  Branch ; __fastfail

	nt!PoRunDownDeviceObject+0x7e:
	; RemoveEntryList(rcx)
	fffff802`804e1116 498910          mov     qword ptr [r8],rdx
	fffff802`804e1119 4c894208        mov     qword ptr [rdx+8],r8
	fffff802`804e111d 48832100        and     qword ptr [rcx],0
	fffff802`804e1121 4883635000      and     qword ptr [rbx+50h],0
```

### IoUnregisterFsRegisrationChange

```
	Can't find symbol.
```

### IopfCompleteRequest

```
	nt!IopfCompleteRequest+0x9e0:
	fffff802`804aff90 8b5704          mov     edx,dword ptr [rdi+4]
	fffff802`804aff93 8d4201          lea     eax,[rdx+1]
	fffff802`804aff96 894704          mov     dword ptr [rdi+4],eax
	fffff802`804aff99 488d4718        lea     rax,[rdi+18h] ; rax = Entry
	fffff802`804aff9d 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = Entry.Blink
	fffff802`804affa1 483901          cmp     qword ptr [rcx],rax ; Entry.Blink.Flink != Entry ?
	fffff802`804affa4 0f851b010000    jne     nt!IopfCompleteRequest+0xb15 (fffff802`804b00c5)  Branch ; __fastfail

	nt!IopfCompleteRequest+0x9fa:
	; InsertTailList(rax, r12)
	fffff802`804affaa 49890424        mov     qword ptr [r12],rax
	fffff802`804affae 49894c2408      mov     qword ptr [r12+8],rcx
	fffff802`804affb3 4c8921          mov     qword ptr [rcx],r12
	fffff802`804affb6 4c896008        mov     qword ptr [rax+8],r12
	fffff802`804affba 85d2            test    edx,edx
	fffff802`804affbc 0f85d6feffff    jne     nt!IopfCompleteRequest+0x8e8 (fffff802`804afe98)  Branch

	nt!IopfCompleteRequest+0xa9d:
	fffff802`804b004d 488b5320        mov     rdx,qword ptr [rbx+20h] ; rdx = Entry.Flink
	fffff802`804b0051 488d4320        lea     rax,[rbx+20h] ; rax = Entry
	fffff802`804b0055 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = Entry.Blink
	fffff802`804b0059 48394208        cmp     qword ptr [rdx+8],rax ; Entry.Flink.Blink != Entry ?
	fffff802`804b005d 7566            jne     nt!IopfCompleteRequest+0xb15 (fffff802`804b00c5)  Branch ; __fastfail

	nt!IopfCompleteRequest+0xaaf:
	fffff802`804b005f 483901          cmp     qword ptr [rcx],rax ; Entry.Blink.Flink != Entry ?
	fffff802`804b0062 7561            jne     nt!IopfCompleteRequest+0xb15 (fffff802`804b00c5)  Branch ; __fastfail

	nt!IopfCompleteRequest+0xab4:
	; RemoveEntryList(rax)
	fffff802`804b0064 488911          mov     qword ptr [rcx],rdx
	fffff802`804b0067 48894a08        mov     qword ptr [rdx+8],rcx
	; InitializeHeadList(rax)
	fffff802`804b006b 48894008        mov     qword ptr [rax+8],rax
	fffff802`804b006f 488900          mov     qword ptr [rax],rax
	fffff802`804b0072 4885f6          test    rsi,rsi
	fffff802`804b0075 0f8403fbffff    je      nt!IopfCompleteRequest+0x5ce (fffff802`804afb7e)  Branch

	nt!IopfCompleteRequest+0xb09:
	; InitializeHeadList(r15)
	fffff802`804b00b9 4d897f08        mov     qword ptr [r15+8],r15
	fffff802`804b00bd 4d893f          mov     qword ptr [r15],r15
	fffff802`804b00c0 e92cfbffff      jmp     nt!IopfCompleteRequest+0x641 (fffff802`804afbf1)  Branch

	nt!IopfCompleteRequest+0x1762aa:
	fffff802`8062585a 498b4500        mov     rax,qword ptr [r13] ; rax = r13.Flink
	fffff802`8062585e 498bd5          mov     rdx,r13 ; rdx = r13
	fffff802`80625861 488955af        mov     qword ptr [rbp-51h],rdx
	fffff802`80625865 4c8be8          mov     r13,rax ; r13 = r13.Flink
	fffff802`80625868 488b4a08        mov     rcx,qword ptr [rdx+8] ; rcx = r13.Blink
	fffff802`8062586c 48395008        cmp     qword ptr [rax+8],rdx ; r13.Flink.Blink != r13 ?
	fffff802`80625870 0f854fa8e8ff    jne     nt!IopfCompleteRequest+0xb15 (fffff802`804b00c5)  Branch ; __fastfail

	nt!IopfCompleteRequest+0x1762c6:
	fffff802`80625876 483911          cmp     qword ptr [rcx],rdx ; r13.Blink.Flink != r13 ?
	fffff802`80625879 0f8546a8e8ff    jne     nt!IopfCompleteRequest+0xb15 (fffff802`804b00c5)  Branch ; __fastfail

	nt!IopfCompleteRequest+0x1762cf:
	; RemoveEntryList(r13)
	fffff802`8062587f 488901          mov     qword ptr [rcx],rax
	fffff802`80625882 48894808        mov     qword ptr [rax+8],rcx
	fffff802`80625886 0fb64210        movzx   eax,byte ptr [rdx+10h]
	fffff802`8062588a 413ac6          cmp     al,r14b
	fffff802`8062588d 7528            jne     nt!IopfCompleteRequest+0x176307 (fffff802`806258b7)  Branch

	nt!IopfCompleteRequest+0x1763e4:
	fffff802`80625994 448b5104        mov     r10d,dword ptr [rcx+4]
	fffff802`80625998 488d5118        lea     rdx,[rcx+18h] ; rdx = Entry
	fffff802`8062599c 418d4201        lea     eax,[r10+1]
	fffff802`806259a0 894104          mov     dword ptr [rcx+4],eax
	fffff802`806259a3 4c8b4208        mov     r8,qword ptr [rdx+8] ; r8 = Entry.Blink
	fffff802`806259a7 493910          cmp     qword ptr [r8],rdx ; Entry.Blink.Flink != Entry ?
	fffff802`806259aa 0f8515a7e8ff    jne     nt!IopfCompleteRequest+0xb15 (fffff802`804b00c5)  Branch ; __fastfail

	nt!IopfCompleteRequest+0x176400:
	fffff802`806259b0 488b45af        mov     rax,qword ptr [rbp-51h]
	; InsertTailList(rdx, rax)
	fffff802`806259b4 488910          mov     qword ptr [rax],rdx
	fffff802`806259b7 4c894008        mov     qword ptr [rax+8],r8
	fffff802`806259bb 498900          mov     qword ptr [r8],rax
	fffff802`806259be 48894208        mov     qword ptr [rdx+8],rax
	fffff802`806259c2 4585d2          test    r10d,r10d
	fffff802`806259c5 7515            jne     nt!IopfCompleteRequest+0x17642c (fffff802`806259dc)  Branch

	; These two blocks are identical to the two above, except for the jump location at the end.

	nt!IopfCompleteRequest+0x17653c:
	fffff802`80625aec 448b5104        mov     r10d,dword ptr [rcx+4]
	fffff802`80625af0 488d5118        lea     rdx,[rcx+18h] ; rdx = Entry
	fffff802`80625af4 418d4201        lea     eax,[r10+1]
	fffff802`80625af8 894104          mov     dword ptr [rcx+4],eax
	fffff802`80625afb 4c8b4208        mov     r8,qword ptr [rdx+8] ; r8 = Entry.Blink
	fffff802`80625aff 493910          cmp     qword ptr [r8],rdx ; Entry.Blink.Flink != Entry ?
	fffff802`80625b02 0f85bda5e8ff    jne     nt!IopfCompleteRequest+0xb15 (fffff802`804b00c5)  Branch ; __fastfail

	nt!IopfCompleteRequest+0x176558:
	fffff802`80625b08 488b45af        mov     rax,qword ptr [rbp-51h]
	; InsertTailList(rdx, rax)
	fffff802`80625b0c 488910          mov     qword ptr [rax],rdx
	fffff802`80625b0f 4c894008        mov     qword ptr [rax+8],r8
	fffff802`80625b13 498900          mov     qword ptr [r8],rax
	fffff802`80625b16 48894208        mov     qword ptr [rdx+8],rax
	fffff802`80625b1a 4585d2          test    r10d,r10d
	fffff802`80625b1d 7515            jne     nt!IopfCompleteRequest+0x176584 (fffff802`80625b34)  Branch

	nt!IopfCompleteRequest+0x17694d:
	fffff802`80625efd 488b11          mov     rdx,qword ptr [rcx] ; rdx = rcx.Flink
	fffff802`80625f00 4c8d41e0        lea     r8,[rcx-20h]
	fffff802`80625f04 4c3bc3          cmp     r8,rbx
	fffff802`80625f07 740d            je      nt!IopfCompleteRequest+0x176966 (fffff802`80625f16)  Branch

	nt!IopfCompleteRequest+0x176966:
	fffff802`80625f16 488b4108        mov     rax,qword ptr [rcx+8] ; rax = rcx.Blink
	fffff802`80625f1a 48394a08        cmp     qword ptr [rdx+8],rcx ; rcx.Flink.Blink != rcx ?
	fffff802`80625f1e 0f85a1a1e8ff    jne     nt!IopfCompleteRequest+0xb15 (fffff802`804b00c5)  Branch ; __fastfail

	nt!IopfCompleteRequest+0x176974:
	fffff802`80625f24 483908          cmp     qword ptr [rax],rcx ; rcx.Blink.Flink != rcx ?
	fffff802`80625f27 0f8598a1e8ff    jne     nt!IopfCompleteRequest+0xb15 (fffff802`804b00c5)  Branch ; __fastfail

	nt!IopfCompleteRequest+0x17697d:
	; RemoveEntryList(rcx)
	fffff802`80625f2d 488910          mov     qword ptr [rax],rdx
	fffff802`80625f30 498bca          mov     rcx,r10
	fffff802`80625f33 48894208        mov     qword ptr [rdx+8],rax
	fffff802`80625f37 498d4020        lea     rax,[r8+20h] ; rax = ...
	; InitializeHeadList(rax)
	fffff802`80625f3b 48894008        mov     qword ptr [rax+8],rax
	fffff802`80625f3f 488900          mov     qword ptr [rax],rax
	fffff802`80625f42 e839b0e7ff      call    nt!ObfDereferenceObject (fffff802`804a0f80)
```

### KeDeregisterbugCheckCallback

```
	nt!KeDeregisterBugCheckCallback+0x5f:
	fffff802`806a950f 40887338        mov     byte ptr [rbx+38h],sil
	fffff802`806a9513 488b0b          mov     rcx,qword ptr [rbx] ; rcx = rbx.Flink
	fffff802`806a9516 488b4308        mov     rax,qword ptr [rbx+8] ; rax = rbx.Blink
	fffff802`806a951a 48395908        cmp     qword ptr [rcx+8],rbx ; rbx.Flink.Blink != rbx ?
	fffff802`806a951e 756e            jne     nt!KeDeregisterBugCheckCallback+0xde (fffff802`806a958e)  Branch ; __fastfail

	nt!KeDeregisterBugCheckCallback+0x70:
	fffff802`806a9520 483918          cmp     qword ptr [rax],rbx ; rbx.Blink.Flink != rbx ?
	fffff802`806a9523 7569            jne     nt!KeDeregisterBugCheckCallback+0xde (fffff802`806a958e)  Branch ; __fastfail

	nt!KeDeregisterBugCheckCallback+0x75:
	; RemoveEntryList(rbx)
	fffff802`806a9525 488908          mov     qword ptr [rax],rcx
	fffff802`806a9528 40b601          mov     sil,1
	fffff802`806a952b 48894108        mov     qword ptr [rcx+8],rax
```

### KeDeregisterObjectNotification

```
	nt!KeDeregisterObjectNotification+0x4d:
	fffff802`804ff85d 488b0b          mov     rcx,qword ptr [rbx] ; rcx = rbx.Flink
	fffff802`804ff860 488b4308        mov     rax,qword ptr [rbx+8] ; rax = rbx.Blink
	fffff802`804ff864 48395908        cmp     qword ptr [rcx+8],rbx ; rbx.Flink.Blink != rbx ?
	fffff802`804ff868 754e            jne     nt!KeDeregisterObjectNotification+0xa8 (fffff802`804ff8b8)  Branch ; __fastfail

	nt!KeDeregisterObjectNotification+0x5a:
	fffff802`804ff86a 483918          cmp     qword ptr [rax],rbx ; rbx.Blink.Flink != rbx ?
	fffff802`804ff86d 7549            jne     nt!KeDeregisterObjectNotification+0xa8 (fffff802`804ff8b8)  Branch ; __fastfail

	nt!KeDeregisterObjectNotification+0x5f:
	; RemoveEntryList(rbx)
	fffff802`804ff86f 488908          mov     qword ptr [rax],rcx
	fffff802`804ff872 40b501          mov     bpl,1
	fffff802`804ff875 48894108        mov     qword ptr [rcx+8],rax
	fffff802`804ff879 c6431105        mov     byte ptr [rbx+11h],5

	; -----------------------------

	nt!KeRemoveQueueEntry+0x4c:
	fffff802`804ff914 ff4b04          dec     dword ptr [rbx+4]
	fffff802`804ff917 488b0f          mov     rcx,qword ptr [rdi] ; rcx = rdi.Flink
	fffff802`804ff91a 488b4708        mov     rax,qword ptr [rdi+8] ; rax = rdi.Blink
	fffff802`804ff91e 48397908        cmp     qword ptr [rcx+8],rdi ; rdi.Flink.Blink != rdi ?
	fffff802`804ff922 754a            jne     nt!KeRemoveQueueEntry+0xa6 (fffff802`804ff96e)  Branch ; __fastfail

	nt!KeRemoveQueueEntry+0x5c:
	fffff802`804ff924 483938          cmp     qword ptr [rax],rdi ; rdi.Blink.Flink != rdi ?
	fffff802`804ff927 7545            jne     nt!KeRemoveQueueEntry+0xa6 (fffff802`804ff96e)  Branch ; __fastfail

	nt!KeRemoveQueueEntry+0x61:
	; RemoveEntryList(rdi)
	fffff802`804ff929 488908          mov     qword ptr [rax],rcx
	fffff802`804ff92c 40b501          mov     bpl,1
	fffff802`804ff92f 48894108        mov     qword ptr [rcx+8],rax
```

### KeRegisterObjectNotification

```
	nt!KeRegisterObjectNotification+0x62:
	fffff802`804303c2 488b4b10        mov     rcx,qword ptr [rbx+10h] ; rcx = Entry.Blink
	fffff802`804303c6 488d4308        lea     rax,[rbx+8] ; rax = Entry
	fffff802`804303ca 483901          cmp     qword ptr [rcx],rax ; Entry.Blink.Flink != Entry ?
	fffff802`804303cd 0f8552010000    jne     nt!KeRegisterObjectNotification+0x1c5 (fffff802`80430525)  Branch ; __fastfail

	nt!KeRegisterObjectNotification+0x73:
	; InsertTailList(rax, rdi)
	fffff802`804303d3 488907          mov     qword ptr [rdi],rax
	fffff802`804303d6 48894f08        mov     qword ptr [rdi+8],rcx
	fffff802`804303da 488939          mov     qword ptr [rcx],rdi
	fffff802`804303dd 48897808        mov     qword ptr [rax+8],rdi
	fffff802`804303e1 f081237fffffff  lock and dword ptr [rbx],0FFFFFF7Fh
	fffff802`804303e8 8b05be415400    mov     eax,dword ptr [nt!KiIrqlFlags (fffff802`809745ac)]
	fffff802`804303ee 85c0            test    eax,eax
	fffff802`804303f0 0f850a031c00    jne     nt!KeRegisterObjectNotification+0x1c03a0 (fffff802`805f0700)  Branch

	nt!KeRegisterObjectNotification+0x139:
	fffff802`80430499 8b5504          mov     edx,dword ptr [rbp+4]
	fffff802`8043049c 8d4201          lea     eax,[rdx+1]
	fffff802`8043049f 894504          mov     dword ptr [rbp+4],eax
	fffff802`804304a2 488d4518        lea     rax,[rbp+18h] ; rax = Entry
	fffff802`804304a6 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = Entry.Blink
	fffff802`804304aa 483901          cmp     qword ptr [rcx],rax ; Entry.Blink.Flink != rax ?
	fffff802`804304ad 7576            jne     nt!KeRegisterObjectNotification+0x1c5 (fffff802`80430525)  Branch ; __fastfail

	nt!KeRegisterObjectNotification+0x14f:
	; InsertTailList(rax, rdi)
	fffff802`804304af 488907          mov     qword ptr [rdi],rax
	fffff802`804304b2 48894f08        mov     qword ptr [rdi+8],rcx
	fffff802`804304b6 488939          mov     qword ptr [rcx],rdi
	fffff802`804304b9 48897808        mov     qword ptr [rax+8],rdi
	fffff802`804304bd 85d2            test    edx,edx
	fffff802`804304bf 7505            jne     nt!KeRegisterObjectNotification+0x166 (fffff802`804304c6)  Branch
```

### KeRemoveQueueApc (calls KiRemoveQueueApc)

```
	nt!KiRemoveQueueApc+0xd:
	fffff802`8051bfd9 488b5108        mov     rdx,qword ptr [rcx+8]
	fffff802`8051bfdd 4c8d5110        lea     r10,[rcx+10h]
	fffff802`8051bfe1 448a5951        mov     r11b,byte ptr [rcx+51h]
	fffff802`8051bfe5 4881c298000000  add     rdx,98h
	fffff802`8051bfec c6415200        mov     byte ptr [rcx+52h],0
	fffff802`8051bff0 4d8b0a          mov     r9,qword ptr [r10] ; r9 = r10.Flink
	fffff802`8051bff3 498b4208        mov     rax,qword ptr [r10+8] ; rax = r10.Blink
	fffff802`8051bff7 4d395108        cmp     qword ptr [r9+8],r10 ; r10.Flink.Blink != r10 ?
	fffff802`8051bffb 7538            jne     nt!KiRemoveQueueApc+0x69 (fffff802`8051c035)  Branch ; __fastfail

	nt!KiRemoveQueueApc+0x31:
	fffff802`8051bffd 4c3910          cmp     qword ptr [rax],r10 ; r10.Blink.Flink != r10 ?
	fffff802`8051c000 7533            jne     nt!KiRemoveQueueApc+0x69 (fffff802`8051c035)  Branch ; __fastfail

	nt!KiRemoveQueueApc+0x36:
	; RemoveEntryList(r10)
	fffff802`8051c002 4c8908          mov     qword ptr [rax],r9
	fffff802`8051c005 49894108        mov     qword ptr [r9+8],rax
	fffff802`8051c009 493bc1          cmp     rax,r9
	fffff802`8051c00c 75c7            jne     nt!KiRemoveQueueApc+0x9 (fffff802`8051bfd5)  Branch
```

### KeRemoveQueueDpc (calls KeRemoveQueueDpcEx)

```
	; _KDPC in this version of Windows holds a _SINGLE_LIST_ENTRY rather than a _LIST_ENTRY
	; see https://www.geoffchappell.com/studies/windows/km/ntoskrnl/api/ke/dpcobj/kdpc.htm for details
	; So the following comments may make sense:

	nt!KeRemoveQueueDpcEx+0x140cde:
	; Do rcx = rax, rax = rax.Next while rax == rdx
	fffff802`8064339e 488bc8          mov     rcx,rax
	fffff802`806433a1 488b00          mov     rax,qword ptr [rax]

	nt!KeRemoveQueueDpcEx+0x140ce4:
	fffff802`806433a4 483bc2          cmp     rax,rdx
	fffff802`806433a7 75f5            jne     nt!KeRemoveQueueDpcEx+0x140cde (fffff802`8064339e)  Branch

	nt!KeRemoveQueueDpcEx+0x140ce9:
	; Assume rax now points to DPC we're after, and rcx is the element just before rax.
	; Assume rdx is the entry we want to remove.
	fffff802`806433a9 488b02          mov     rax,qword ptr [rdx] ; rax = rdx.Next
	fffff802`806433ac 488901          mov     qword ptr [rcx],rax ; rcx.Next = rdx.Next
	fffff802`806433af 4885c0          test    rax,rax
	fffff802`806433b2 7504            jne     nt!KeRemoveQueueDpcEx+0x140cf8 (fffff802`806433b8)  Branch
```

### KiCancelTimer

```
	nt!KiCancelTimer+0xb4:
	fffff802`804a5cf4 488b4b20        mov     rcx,qword ptr [rbx+20h] ; rcx = Entry.Flink
	fffff802`804a5cf8 488d5320        lea     rdx,[rbx+20h] ; rdx = Entry
	fffff802`804a5cfc 488b4208        mov     rax,qword ptr [rdx+8] ; rax = Entry.Blink
	fffff802`804a5d00 4d8d442410      lea     r8,[r12+10h]
	fffff802`804a5d05 49c1e005        shl     r8,5
	fffff802`804a5d09 48395108        cmp     qword ptr [rcx+8],rdx ; Entry.Flink.Blink != Entry ?
	fffff802`804a5d0d 0f8563d11700    jne     nt!KiCancelTimer+0x17d236 (fffff802`80622e76)  Branch ; __fastfail

	nt!KiCancelTimer+0xd3:
	fffff802`804a5d13 483910          cmp     qword ptr [rax],rdx ; Entry.Blink.Flink != Entry ?
	fffff802`804a5d16 0f855ad11700    jne     nt!KiCancelTimer+0x17d236 (fffff802`80622e76)  Branch ; __fastfail

	nt!KiCancelTimer+0xdc:
	; RemoveEntryList(rdx)
	fffff802`804a5d1c 488908          mov     qword ptr [rax],rcx
	fffff802`804a5d1f 48894108        mov     qword ptr [rcx+8],rax
	fffff802`804a5d23 483bc1          cmp     rax,rcx
	fffff802`804a5d26 7479            je      nt!KiCancelTimer+0x161 (fffff802`804a5da1)  Branch
```

### KeTerminateThread

```
	nt!KeTerminateThread:
	fffff802`804c6af8 4053            push    rbx
	fffff802`804c6afa 55              push    rbp
	fffff802`804c6afb 56              push    rsi
	fffff802`804c6afc 4154            push    r12
	fffff802`804c6afe 4155            push    r13
	fffff802`804c6b00 4156            push    r14
	fffff802`804c6b02 4157            push    r15
	fffff802`804c6b04 4883ec50        sub     rsp,50h
	fffff802`804c6b08 33c0            xor     eax,eax
	fffff802`804c6b0a 488bd9          mov     rbx,rcx ; rbx = _KTHREAD ?
	fffff802`804c6b0d f7417400100000  test    dword ptr [rcx+74h],1000h
	fffff802`804c6b14 4889442430      mov     qword ptr [rsp+30h],rax
	fffff802`804c6b19 4889442438      mov     qword ptr [rsp+38h],rax
	fffff802`804c6b1e 4889442440      mov     qword ptr [rsp+40h],rax
	fffff802`804c6b23 0f85e1841600    jne     nt!KeTerminateThread+0x168512 (fffff802`8062f00a)  Branch

	nt!KeTerminateThread+0x41:
	fffff802`804c6b39 488bab20020000  mov     rbp,qword ptr [rbx+220h] ; rbp = _KTHREAD._KPROCESS (assuming rbx = _EPROCESS)
	fffff802`804c6b40 c6838302000016  mov     byte ptr [rbx+283h],16h
	fffff802`804c6b47 440f20c1        mov     rcx,cr8
	fffff802`804c6b4b 41bc02000000    mov     r12d,2
	fffff802`804c6b51 450f22c4        mov     cr8,r12
	fffff802`804c6b55 8b0551da4a00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff802`809745ac)]
	fffff802`804c6b5b 458d6c24ff      lea     r13d,[r12-1]
	fffff802`804c6b60 85c0            test    eax,eax
	fffff802`804c6b62 0f85ca841600    jne     nt!KeTerminateThread+0x16853a (fffff802`8062f032)  Branch

	nt!KeTerminateThread+0x70:
	fffff802`804c6b68 488d4d40        lea     rcx,[rbp+40h] ; rcx = _KPROCESS.ProcessLock
	fffff802`804c6b6c e88fb8f5ff      call    nt!ExAcquireSpinLockExclusiveAtDpcLevel (fffff802`80422400)
	fffff802`804c6b71 488b8300030000  mov     rax,qword ptr [rbx+300h] ; rax = _KPROCESS.ThreadListEntry.Blink
	fffff802`804c6b78 488db3f8020000  lea     rsi,[rbx+2F8h] ; rsi = _KPROCESS.ThreadListEntry
	fffff802`804c6b7f 483906          cmp     qword ptr [rsi],rax ; _KPROCESS.ThreadListEntry.Flink == _KPROCESS.ThreadListEntry.Blink ?
	fffff802`804c6b82 0f8461010000    je      nt!KeTerminateThread+0x1f1 (fffff802`804c6ce9)  Branch ; last thread for process

	nt!KeTerminateThread+0x90:
	fffff802`804c6b88 488bcd          mov     rcx,rbp ; rcx = _KPROCESS
	fffff802`804c6b8b e86041f6ff      call    nt!KiAcquireKobjectLockSafe (fffff802`8042acf0)
	fffff802`804c6b90 488b16          mov     rdx,qword ptr [rsi] ; rdx = ThreadListEntry.Flink
	fffff802`804c6b93 488b4608        mov     rax,qword ptr [rsi+8] ; rax = ThreadListEntry.Blink
	fffff802`804c6b97 48397208        cmp     qword ptr [rdx+8],rsi ; ThreadListEntry.Flink.Blink != ThreadListEntry ?
	fffff802`804c6b9b 0f8569020000    jne     nt!KeTerminateThread+0x312 (fffff802`804c6e0a)  Branch ; __fastfail

	nt!KeTerminateThread+0xa9:
	fffff802`804c6ba1 483930          cmp     qword ptr [rax],rsi ; ThreadListEntry.Blink.Flink != ThreadListEntry ?
	fffff802`804c6ba4 0f8560020000    jne     nt!KeTerminateThread+0x312 (fffff802`804c6e0a)  Branch ; __fastfail

	nt!KeTerminateThread+0xb2:
	; RemoveEntryList(rsi)
	fffff802`804c6baa 488910          mov     qword ptr [rax],rdx
	fffff802`804c6bad 48894208        mov     qword ptr [rdx+8],rax
	fffff802`804c6bb1 f08165007fffffff lock and dword ptr [rbp],0FFFFFF7Fh
	fffff802`804c6bb9 488b4368        mov     rax,qword ptr [rbx+68h]
	fffff802`804c6bbd 4885c0          test    rax,rax
	fffff802`804c6bc0 0f859c010000    jne     nt!KeTerminateThread+0x26a (fffff802`804c6d62)  Branch

	nt!KeTerminateThread+0x11f:
	; InitializeHeadList(r14)
	fffff802`804c6c17 4d897608        mov     qword ptr [r14+8],r14
	fffff802`804c6c1b 4d8936          mov     qword ptr [r14],r14
	fffff802`804c6c1e f081237fffffff  lock and dword ptr [rbx],0FFFFFF7Fh
	fffff802`804c6c25 c6838401000004  mov     byte ptr [rbx+184h],4
	fffff802`804c6c2c 4883bd082d000000 cmp     qword ptr [rbp+2D08h],0
	fffff802`804c6c34 0f8502010000    jne     nt!KeTerminateThread+0x244 (fffff802`804c6d3c)  Branch

	; InterlockedPopEntrySList():
	nt!KeTerminateThread+0x142:
	fffff802`804c6c3a 4c8d8328060000  lea     r8,[rbx+628h]
	; Hint the processor that the memory holding the Head pointer is about to be
	; modified. The processor will (probably) move that memory closer to it (1st or 2nd level cache) and invalidate other cached copies thereof
	; See https://www.felixcloutier.com/x86/prefetchw
	fffff802`804c6c41 0f0d0da01f3700  prefetchw [nt!PsReaperListHead (fffff802`80838be8)]
	; Load current Head to rax
	fffff802`804c6c48 488b05991f3700  mov     rax,qword ptr [nt!PsReaperListHead (fffff802`80838be8)] ; rax = Head

	nt!KeTerminateThread+0x157:
	; Set r8.Next = Head.Next
	fffff802`804c6c4f 498900          mov     qword ptr [r8],rax ; *r8 = Head
	; Set rcx to rax (current Head)
	fffff802`804c6c52 488bc8          mov     rcx,rax
	; Atomically: If current Head == rax i.e. hasn't changed, then replace it with r8, the new Head.
	fffff802`804c6c55 f04c0fb1058a1f3700 lock cmpxchg qword ptr [nt!PsReaperListHead (fffff802`80838be8)],r8 ; Head = r8
	fffff802`804c6c5e 483bc1          cmp     rax,rcx ; rax != rcx if the exchange occurred.
	fffff802`804c6c61 75ec            jne     nt!KeTerminateThread+0x157 (fffff802`804c6c4f)  Branch ; jump if exchanged

	nt!KeTerminateThread+0x16b:
	fffff802`804c6c63 4885c0          test    rax,rax ; end of list ?
	fffff802`804c6c66 7548            jne     nt!KeTerminateThread+0x1b8 (fffff802`804c6cb0)  Branch

	nt!KeTerminateThread+0x1f1:
	fffff802`804c6ce9 488364243000    and     qword ptr [rsp+30h],0
	fffff802`804c6cef 488d154a694c00  lea     rdx,[nt!KiProcessListLock (fffff802`8098d640)]
	fffff802`804c6cf6 488d4c2430      lea     rcx,[rsp+30h]
	fffff802`804c6cfb 4889542438      mov     qword ptr [rsp+38h],rdx
	fffff802`804c6d00 e85b31f5ff      call    nt!KxAcquireQueuedSpinLock (fffff802`80419e60)
	fffff802`804c6d05 488d8548020000  lea     rax,[rbp+248h] ; rax = _KPROCESS.ProcessListEntry
	fffff802`804c6d0c 488b10          mov     rdx,qword ptr [rax] ; rdx = ProcessListEntry.Flink
	fffff802`804c6d0f 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = ProcessListEntry.Blink
	fffff802`804c6d13 48394208        cmp     qword ptr [rdx+8],rax ; ProcessListEntry.Flink.Blink != ProcessListEntry ?
	fffff802`804c6d17 0f85ed000000    jne     nt!KeTerminateThread+0x312 (fffff802`804c6e0a)  Branch ; __fastfail

	nt!KeTerminateThread+0x225:
	fffff802`804c6d1d 483901          cmp     qword ptr [rcx],rax ; ProcessListEntry.Blink.Flink != ProcessListEntry ?
	fffff802`804c6d20 0f85e4000000    jne     nt!KeTerminateThread+0x312 (fffff802`804c6e0a) Branch ; __fastfail

	nt!KeTerminateThread+0x22e:
	; RemoveEntryList(rax)
	fffff802`804c6d26 488911          mov     qword ptr [rcx],rdx
	fffff802`804c6d29 48894a08        mov     qword ptr [rdx+8],rcx
	fffff802`804c6d2d 488d4c2430      lea     rcx,[rsp+30h]
	fffff802`804c6d32 e8e99efdff      call    nt!KxReleaseQueuedSpinLock (fffff802`804a0c20)
	fffff802`804c6d37 e94cfeffff      jmp     nt!KeTerminateThread+0x90 (fffff802`804c6b88)  Branch

	nt!KeTerminateThread+0x2fc:
	fffff802`804c6df4 8b4d04          mov     ecx,dword ptr [rbp+4]
	fffff802`804c6df7 8d4101          lea     eax,[rcx+1]
	fffff802`804c6dfa 894504          mov     dword ptr [rbp+4],eax
	fffff802`804c6dfd 488d4518        lea     rax,[rbp+18h] ; rax = _KPROCESS.ProfileListHead
	fffff802`804c6e01 488b5008        mov     rdx,qword ptr [rax+8] ; rdx = ProfileListHead.Blink
	fffff802`804c6e05 483902          cmp     qword ptr [rdx],rax ; ProfileListHead.Blink.Flink == ProfileListHead
	fffff802`804c6e08 747c            je      nt!KeTerminateThread+0x38e (fffff802`804c6e86)  Branch

	nt!KeTerminateThread+0x38e:
	; InsertTailList(rax, rsi)
	fffff802`804c6e86 488906          mov     qword ptr [rsi],rax
	fffff802`804c6e89 48895608        mov     qword ptr [rsi+8],rdx
	fffff802`804c6e8d 488932          mov     qword ptr [rdx],rsi
	fffff802`804c6e90 48897008        mov     qword ptr [rax+8],rsi
	fffff802`804c6e94 85c9            test    ecx,ecx
	fffff802`804c6e96 75cf            jne     nt!KeTerminateThread+0x36f (fffff802`804c6e67)  Branch
```

### KiDeliverApc

```
	nt!KiDeliverApc+0x11b:
	fffff802`804a60db 488b0a          mov     rcx,qword ptr [rdx] ; rcx = rdx.Flink
	fffff802`804a60de 488b4208        mov     rax,qword ptr [rdx+8] ; rax = rdx.Blink
	fffff802`804a60e2 48395108        cmp     qword ptr [rcx+8],rdx ; rdx.Flink.Blink != rdx ?
	fffff802`804a60e6 0f8586d11700    jne     nt!KiDeliverApc+0x17d2b2 (fffff802`80623272)  Branch ; __fastfail

	nt!KiDeliverApc+0x12c:
	fffff802`804a60ec 483910          cmp     qword ptr [rax],rdx ; rdx.Blink.Flink != rdx ?
	fffff802`804a60ef 0f857dd11700    jne     nt!KiDeliverApc+0x17d2b2 (fffff802`80623272)  Branch ; __fastfail

	nt!KiDeliverApc+0x135:
	; RemoveEntryList(rdx)
	fffff802`804a60f5 488908          mov     qword ptr [rax],rcx
	fffff802`804a60f8 48894108        mov     qword ptr [rcx+8],rax

	nt!KiDeliverApc+0x24a:
	fffff802`804a620a 488b0a          mov     rcx,qword ptr [rdx] ; rcx = rdx.Flink
	fffff802`804a620d 488b4208        mov     rax,qword ptr [rdx+8] ; rax = rdx.Blink
	fffff802`804a6211 48395108        cmp     qword ptr [rcx+8],rdx ; rdx.Flink.Blink != rdx ?
	fffff802`804a6215 0f8557d01700    jne     nt!KiDeliverApc+0x17d2b2 (fffff802`80623272)  Branch ; __fastfail

	nt!KiDeliverApc+0x25b:
	fffff802`804a621b 483910          cmp     qword ptr [rax],rdx ; rdx.Blink.Flink != rdx ?
	fffff802`804a621e 0f854ed01700    jne     nt!KiDeliverApc+0x17d2b2 (fffff802`80623272)  Branch ; __fastfail

	nt!KiDeliverApc+0x264:
	; RemoveEntryList(rdx)
	fffff802`804a6224 488908          mov     qword ptr [rax],rcx
	fffff802`804a6227 48894108        mov     qword ptr [rcx+8],rax
	fffff802`804a622b 488bcb          mov     rcx,rbx
	fffff802`804a622e c6465200        mov     byte ptr [rsi+52h],0
	fffff802`804a6232 e8f9210500      call    nt!KiReleaseThreadLockSafe (fffff802`804f8430)
	fffff802`804a6237 8b056fe34c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff802`809745ac)]
	fffff802`804a623d 85c0            test    eax,eax
	fffff802`804a623f 0f8531ce1700    jne     nt!KiDeliverApc+0x17d0b6 (fffff802`80623076)  Branch

	nt!KiDeliverApc+0x3e0:
	fffff802`804a63a0 48894507        mov     qword ptr [rbp+7],rax
	fffff802`804a63a4 488b4730        mov     rax,qword ptr [rdi+30h]
	fffff802`804a63a8 488945e7        mov     qword ptr [rbp-19h],rax
	fffff802`804a63ac 488b4738        mov     rax,qword ptr [rdi+38h]
	fffff802`804a63b0 488945ff        mov     qword ptr [rbp-1],rax
	fffff802`804a63b4 488b4740        mov     rax,qword ptr [rdi+40h]
	fffff802`804a63b8 488945f7        mov     qword ptr [rbp-9],rax
	fffff802`804a63bc 488b4748        mov     rax,qword ptr [rdi+48h]
	fffff802`804a63c0 488945ef        mov     qword ptr [rbp-11h],rax
	fffff802`804a63c4 488b11          mov     rdx,qword ptr [rcx] ; rdx = rcx.Flink
	fffff802`804a63c7 488b4108        mov     rax,qword ptr [rcx+8] ; rax = rcx.Blink
	fffff802`804a63cb 48394a08        cmp     qword ptr [rdx+8],rcx ; rcx.Flink.Blink != rcx ?
	fffff802`804a63cf 0f859dce1700    jne     nt!KiDeliverApc+0x17d2b2 (fffff802`80623272)  Branch ; __fastfail

	nt!KiDeliverApc+0x415:
	fffff802`804a63d5 483908          cmp     qword ptr [rax],rcx ; rcx.Blink.Flink != rcx ?
	fffff802`804a63d8 0f8594ce1700    jne     nt!KiDeliverApc+0x17d2b2 (fffff802`80623272)  Branch ; __fastfail

	nt!KiDeliverApc+0x41e:
	; RemoveEntryList(rcx)
	fffff802`804a63de 488910          mov     qword ptr [rax],rdx
	fffff802`804a63e1 48894208        mov     qword ptr [rdx+8],rax
	fffff802`804a63e5 44884f52        mov     byte ptr [rdi+52h],r9b
	fffff802`804a63e9 0fb683c2000000  movzx   eax,byte ptr [rbx+0C2h]
	fffff802`804a63f0 a801            test    al,1
	fffff802`804a63f2 0f8546ce1700    jne     nt!KiDeliverApc+0x17d27e (fffff802`8062323e)  Branch

	; (didn't notice code changed to KiRemoveBoostThread... :))
	nt!KiRemoveBoostThread+0x17ce5e:
	; PushEntryList(r8, rdx)
	fffff802`8062344e 498b00          mov     rax,qword ptr [r8] ; rax = r8.Next
	fffff802`80623451 488902          mov     qword ptr [rdx],rax ; rdx.Next = r8.Next
	fffff802`80623454 498910          mov     qword ptr [r8],rdx ; r8.Next = rdx
	fffff802`80623457 66f0ff838c050000 lock inc word ptr [rbx+58Ch]
	fffff802`8062345f e8ec95edff      call    nt!KiAbQueueAutoBoostDpc (fffff802`804fca50)
	fffff802`80623464 90              nop
	fffff802`80623465 e9c332e8ff      jmp     nt!KiRemoveBoostThread+0x13d (fffff802`804a672d)  Branch
```

### KiExecuteAllDpcs

```
	nt!KiExecuteAllDpcs+0x126:
	; PopEntryList(rbx)
	fffff802`80450526 488b0b          mov     rcx,qword ptr [rbx] ; rcx = rbx.Next
	fffff802`80450529 488b01          mov     rax,qword ptr [rcx] ; rax = rbx.Next.Next
	fffff802`8045052c 488903          mov     qword ptr [rbx],rax ; rbx.Next = rbx.Next.Next
	fffff802`8045052f 4885c0          test    rax,rax ; rbx.Next.Next was not 0 ?
	fffff802`80450532 7504            jne     nt!KiExecuteAllDpcs+0x138 (fffff802`80450538)  Branch

	nt!KiExecuteAllDpcs+0x134:
	fffff802`80450534 48895b08        mov     qword ptr [rbx+8],rbx ; rbx.Next = rbx
```

### KiExpireTimerTable

```
	Can't find list related code.
```

### KiFindReadyThread

```
	Symbol not found.
```

### KiFlushQueueApc

```
	nt!KiFlushQueueApc+0xc3:
	fffff802`804c7003 490fbec6        movsx   rax,r14b
	fffff802`804c7007 488d8e98000000  lea     rcx,[rsi+98h]
	fffff802`804c700e 48c1e004        shl     rax,4
	fffff802`804c7012 4803c8          add     rcx,rax
	fffff802`804c7015 488b19          mov     rbx,qword ptr [rcx] ; rbx = rcx.Flink
	fffff802`804c7018 483bd9          cmp     rbx,rcx ; rbx == rcx ?
	fffff802`804c701b 0f8483000000    je      nt!KiFlushQueueApc+0x164 (fffff802`804c70a4)  Branch ; go elsewhere

	nt!KiFlushQueueApc+0xe1:
	fffff802`804c7021 488b4108        mov     rax,qword ptr [rcx+8] ; rax = rcx.Blink
	fffff802`804c7025 48394b08        cmp     qword ptr [rbx+8],rcx ; rcx.Flink.Blink != rcx ?
	fffff802`804c7029 0f8509821600    jne     nt!KiFlushQueueApc+0x1682f8 (fffff802`8062f238)  Branch ; __fastfail

	nt!KiFlushQueueApc+0xef:
	fffff802`804c702f 483908          cmp     qword ptr [rax],rcx ; rcx.Blink.Flink != rcx ?
	fffff802`804c7032 0f8500821600    jne     nt!KiFlushQueueApc+0x1682f8 (fffff802`8062f238)  Branch ; __fastfail

	nt!KiFlushQueueApc+0xf8:
	; RemoveEntryList(rcx)
	fffff802`804c7038 488918          mov     qword ptr [rax],rbx
	fffff802`804c703b 48894308        mov     qword ptr [rbx+8],rax
	fffff802`804c703f 488bc3          mov     rax,rbx ; set rax to rbx, and loop until coming full circle

	nt!KiFlushQueueApc+0x102:
	fffff802`804c7042 c6404200        mov     byte ptr [rax+42h],0
	fffff802`804c7046 488b00          mov     rax,qword ptr [rax] ; rax = rax.Flink
	fffff802`804c7049 483bc3          cmp     rax,rbx ; rax != rbx ?
	fffff802`804c704c 75f4            jne     nt!KiFlushQueueApc+0x102 (fffff802`804c7042)  Branch ; loop

	nt!KiFlushQueueApc+0x10e:
	; InitializeHeadList(rcx)
	fffff802`804c704e 48894908        mov     qword ptr [rcx+8],rcx
	fffff802`804c7052 488909          mov     qword ptr [rcx],rcx
```

### KiInsertTimerTable

```
	fffff802`804a5a50 498b06          mov     rax,qword ptr [r14] ; rax = r14.Flink

	nt!KiInsertTimerTable+0xd3:
	fffff802`804a5a53 488d4e20        lea     rcx,[rsi+20h] ; rcx = Entry
	fffff802`804a5a57 4c397008        cmp     qword ptr [rax+8],r14 ; r14.Flink.Blink != r14 ?
	fffff802`804a5a5b 0f8516d31700    jne     nt!KiInsertTimerTable+0x17d3f7 (fffff802`80622d77)  Branch ; __fastfail

	nt!KiInsertTimerTable+0xe1:
	; InsertTailList(rax, rcx)
	fffff802`804a5a61 4c897108        mov     qword ptr [rcx+8],r14
	fffff802`804a5a65 488901          mov     qword ptr [rcx],rax
	fffff802`804a5a68 48894808        mov     qword ptr [rax+8],rcx
	fffff802`804a5a6c 49890e          mov     qword ptr [r14],rcx
	fffff802`804a5a6f 4c8bb424a0000000 mov     r14,qword ptr [rsp+0A0h]
	fffff802`804a5a77 f6c302          test    bl,2
	fffff802`804a5a7a 7464            je      nt!KiInsertTimerTable+0x160 (fffff802`804a5ae0)  Branch
```

### KiProcessExpiredTimerList

```
	nt!KiProcessExpiredTimerList+0x226:
	fffff802`804513b6 488b03          mov     rax,qword ptr [rbx] ; rax = rbx.Flink
	fffff802`804513b9 48395808        cmp     qword ptr [rax+8],rbx ; rbx.Flink.Blink == rbx ?
	fffff802`804513bd 7407            je      nt!KiProcessExpiredTimerList+0x236 (fffff802`804513c6)  Branch ; carry on

	nt!KiProcessExpiredTimerList+0x22f:
	fffff802`804513bf b903000000      mov     ecx,3
	fffff802`804513c4 cd29            int     29h

	nt!KiProcessExpiredTimerList+0x236:
	fffff802`804513c6 488b4b08        mov     rcx,qword ptr [rbx+8] ; rcx = rbx.Blink
	fffff802`804513ca 483919          cmp     qword ptr [rcx],rbx ; rbx.Blink.Flink != rbx ?
	fffff802`804513cd 75f0            jne     nt!KiProcessExpiredTimerList+0x22f (fffff802`804513bf)  Branch ; __fastfail

	nt!KiProcessExpiredTimerList+0x23f:
	; RemoveEntryList(rbx)
	fffff802`804513cf 488901          mov     qword ptr [rcx],rax
	fffff802`804513d2 48894808        mov     qword ptr [rax+8],rcx
```

### MiDeleteVirtualAddresses

```
	Didn't find list code in funciton body or in MiDeletePagablePteRange.
```

### NtNotifyChangeMultipleKeys

```
	nt!NtNotifyChangeMultipleKeys+0x489:
	; InitializeListHead(rsp+130h) ?
	fffff802`80acbcb9 488d842430010000 lea     rax,[rsp+130h]
	fffff802`80acbcc1 4889842438010000 mov     qword ptr [rsp+138h],rax
	fffff802`80acbcc9 488d842430010000 lea     rax,[rsp+130h]
	fffff802`80acbcd1 4889842430010000 mov     qword ptr [rsp+130h],rax

	nt!NtNotifyChangeMultipleKeys+0x125a3b:
	fffff802`80bf126b 488b0e          mov     rcx,qword ptr [rsi] ; rcx = rsi.Flink
	fffff802`80bf126e 488b4608        mov     rax,qword ptr [rsi+8] ; rax = rsi.Blink
	fffff802`80bf1272 48397108        cmp     qword ptr [rcx+8],rsi ; rsi.Flink.Blink != rsi ?
	fffff802`80bf1276 0f85a3000000    jne     nt!NtNotifyChangeMultipleKeys+0x125aef (fffff802`80bf131f)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125a4c:
	fffff802`80bf127c 483930          cmp     qword ptr [rax],rsi ; rsi.Blink.Flink != rsi ?
	fffff802`80bf127f 0f859a000000    jne     nt!NtNotifyChangeMultipleKeys+0x125aef (fffff802`80bf131f)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125a55:
	; RemoveEntryList(rsi)
	fffff802`80bf1285 488908          mov     qword ptr [rax],rcx
	fffff802`80bf1288 48894108        mov     qword ptr [rcx+8],rax
	fffff802`80bf128c 450f20c0        mov     r8,cr8
	fffff802`80bf1290 4c89842488000000 mov     qword ptr [rsp+88h],r8
	fffff802`80bf1298 41b901000000    mov     r9d,1
	fffff802`80bf129e 450f22c1        mov     cr8,r9
	fffff802`80bf12a2 488d4610        lea     rax,[rsi+10h]
	fffff802`80bf12a6 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff802`80bf12a9 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = rax.Blink
	fffff802`80bf12ad 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff802`80bf12b1 7567            jne     nt!NtNotifyChangeMultipleKeys+0x125aea (fffff802`80bf131a)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125a83:
	fffff802`80bf12b3 483901          cmp     qword ptr [rcx],rax ; rax.Blink.Flink != rax ?
	fffff802`80bf12b6 7562            jne     nt!NtNotifyChangeMultipleKeys+0x125aea (fffff802`80bf131a)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125a88:
	; RemoveEntryList(rax)
	fffff802`80bf12b8 488911          mov     qword ptr [rcx],rdx
	fffff802`80bf12bb 48894a08        mov     qword ptr [rdx+8],rcx
	fffff802`80bf12bf 8b05e732d8ff    mov     eax,dword ptr [nt!KiIrqlFlags (fffff802`809745ac)]
	fffff802`80bf12c5 85c0            test    eax,eax
	fffff802`80bf12c7 743c            je      nt!NtNotifyChangeMultipleKeys+0x125ad5 (fffff802`80bf1305)  Branch

	nt!NtNotifyChangeMultipleKeys+0x125b4c:
	fffff802`80bf137c 498b4500        mov     rax,qword ptr [r13] ; rax = r13.Flink
	fffff802`80bf1380 4885c0          test    rax,rax ; rax == 0 ?
	fffff802`80bf1383 741e            je      nt!NtNotifyChangeMultipleKeys+0x125b73 (fffff802`80bf13a3)  Branch

	nt!NtNotifyChangeMultipleKeys+0x125b55:
	fffff802`80bf1385 498b4d08        mov     rcx,qword ptr [r13+8] ; rcx = r13.Blink
	fffff802`80bf1389 4c396808        cmp     qword ptr [rax+8],r13 ; r13.Flink.Blink != r13 ?
	fffff802`80bf138d 0f85e8000000    jne     nt!NtNotifyChangeMultipleKeys+0x125c4b (fffff802`80bf147b)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125b63:
	fffff802`80bf1393 4c3929          cmp     qword ptr [rcx],r13 ; r13.Blink.Flink != r13 ?
	fffff802`80bf1396 0f85df000000    jne     nt!NtNotifyChangeMultipleKeys+0x125c4b (fffff802`80bf147b)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125b6c:
	; RemoveEntryList(r13)
	fffff802`80bf139c 488901          mov     qword ptr [rcx],rax
	fffff802`80bf139f 48894808        mov     qword ptr [rax+8],rcx

	nt!NtNotifyChangeMultipleKeys+0x125b73:
	fffff802`80bf13a3 498d4510        lea     rax,[r13+10h]
	fffff802`80bf13a7 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff802`80bf13aa 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = rax.Blink
	fffff802`80bf13ae 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff802`80bf13b2 0f85c8000000    jne     nt!NtNotifyChangeMultipleKeys+0x125c50 (fffff802`80bf1480)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125b88:
	fffff802`80bf13b8 483901          cmp     qword ptr [rcx],rax ; rax.Blink.Flink != rax ?
	fffff802`80bf13bb 0f85bf000000    jne     nt!NtNotifyChangeMultipleKeys+0x125c50 (fffff802`80bf1480)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125b91:
	; RemoveEntryList(rax)
	fffff802`80bf13c1 488911          mov     qword ptr [rcx],rdx
	fffff802`80bf13c4 48894a08        mov     qword ptr [rdx+8],rcx

	nt!NtNotifyChangeMultipleKeys+0x125b98:
	fffff802`80bf13c8 488b06          mov     rax,qword ptr [rsi] ; rax = rsi.Flink
	fffff802`80bf13cb 4885c0          test    rax,rax ; rax == 0 ?
	fffff802`80bf13ce 741e            je      nt!NtNotifyChangeMultipleKeys+0x125bbe (fffff802`80bf13ee)  Branch

	nt!NtNotifyChangeMultipleKeys+0x125ba0:
	fffff802`80bf13d0 488b4e08        mov     rcx,qword ptr [rsi+8] ; rcx = rsi.Blink
	fffff802`80bf13d4 48397008        cmp     qword ptr [rax+8],rsi ; rsi.Flink.Blink != rsi ?
	fffff802`80bf13d8 0f85a7000000    jne     nt!NtNotifyChangeMultipleKeys+0x125c55 (fffff802`80bf1485)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125bae:
	fffff802`80bf13de 483931          cmp     qword ptr [rcx],rsi ; rsi.Blink.Flink != rsi ?
	fffff802`80bf13e1 0f859e000000    jne     nt!NtNotifyChangeMultipleKeys+0x125c55 (fffff802`80bf1485)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125bb7:
	; RemoveEntryList(rsi)
	fffff802`80bf13e7 488901          mov     qword ptr [rcx],rax
	fffff802`80bf13ea 48894808        mov     qword ptr [rax+8],rcx

	nt!NtNotifyChangeMultipleKeys+0x125bbe:
	fffff802`80bf13ee 488d4610        lea     rax,[rsi+10h]
	fffff802`80bf13f2 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff802`80bf13f5 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = rax.Blink
	fffff802`80bf13f9 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff802`80bf13fd 0f85c9000000    jne     nt!NtNotifyChangeMultipleKeys+0x125c9c (fffff802`80bf14cc)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125bd3:
	fffff802`80bf1403 483901          cmp     qword ptr [rcx],rax ; rax.Blink.Flink != rax ?
	fffff802`80bf1406 0f85c0000000    jne     nt!NtNotifyChangeMultipleKeys+0x125c9c (fffff802`80bf14cc)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125bdc:
	; RemoveEntryList(rax)
	fffff802`80bf140c 488911          mov     qword ptr [rcx],rdx
	fffff802`80bf140f 48894a08        mov     qword ptr [rdx+8],rcx
	fffff802`80bf1413 8b059331d8ff    mov     eax,dword ptr [nt!KiIrqlFlags (fffff802`809745ac)]
	fffff802`80bf1419 85c0            test    eax,eax
	fffff802`80bf141b 7433            je      nt!NtNotifyChangeMultipleKeys+0x125c20 (fffff802`80bf1450)  Branch

	nt!NtNotifyChangeMultipleKeys+0x125cbd:
	fffff802`80bf14ed 498b4500        mov     rax,qword ptr [r13] ; rax = r13.Flink
	fffff802`80bf14f1 4885c0          test    rax,rax ; rax == 0 ?
	fffff802`80bf14f4 741e            je      nt!NtNotifyChangeMultipleKeys+0x125ce4 (fffff802`80bf1514)  Branch

	nt!NtNotifyChangeMultipleKeys+0x125cc6:
	fffff802`80bf14f6 498b4d08        mov     rcx,qword ptr [r13+8] ; rcx = r13.Blink
	fffff802`80bf14fa 4c396808        cmp     qword ptr [rax+8],r13 ; r13.Flink.Blink != r13 ?
	fffff802`80bf14fe 0f85d5000000    jne     nt!NtNotifyChangeMultipleKeys+0x125da9 (fffff802`80bf15d9)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125cd4:
	fffff802`80bf1504 4c3929          cmp     qword ptr [rcx],r13 ; r13.Blink.Flink != r13 ?
	fffff802`80bf1507 0f85cc000000    jne     nt!NtNotifyChangeMultipleKeys+0x125da9 (fffff802`80bf15d9)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125cdd:
	; RemoveEntryList(r13)
	fffff802`80bf150d 488901          mov     qword ptr [rcx],rax
	fffff802`80bf1510 48894808        mov     qword ptr [rax+8],rcx

	nt!NtNotifyChangeMultipleKeys+0x125ce4:
	fffff802`80bf1514 498d4510        lea     rax,[r13+10h]
	fffff802`80bf1518 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff802`80bf151b 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = rax.Blink
	fffff802`80bf151f 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff802`80bf1523 0f85b5000000    jne     nt!NtNotifyChangeMultipleKeys+0x125dae (fffff802`80bf15de)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125cf9:
	fffff802`80bf1529 483901          cmp     qword ptr [rcx],rax ; rax.Blink.Flink != rax ?
	fffff802`80bf152c 0f85ac000000    jne     nt!NtNotifyChangeMultipleKeys+0x125dae (fffff802`80bf15de)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125d02:
	; RemoveEntryList(rax)
	fffff802`80bf1532 488911          mov     qword ptr [rcx],rdx
	fffff802`80bf1535 48894a08        mov     qword ptr [rdx+8],rcx

	nt!NtNotifyChangeMultipleKeys+0x125d09:
	fffff802`80bf1539 488b06          mov     rax,qword ptr [rsi] ; rax = rsi.Flink
	fffff802`80bf153c 4885c0          test    rax,rax ; rsi.Flink == 0 ?
	fffff802`80bf153f 741e            je      nt!NtNotifyChangeMultipleKeys+0x125d2f (fffff802`80bf155f)  Branch

	nt!NtNotifyChangeMultipleKeys+0x125d11:
	fffff802`80bf1541 488b4e08        mov     rcx,qword ptr [rsi+8] ; rcx = rsi.Blink
	fffff802`80bf1545 48397008        cmp     qword ptr [rax+8],rsi ; rsi.Flink.Blink != rsi ?
	fffff802`80bf1549 0f8594000000    jne     nt!NtNotifyChangeMultipleKeys+0x125db3 (fffff802`80bf15e3)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125d1f:
	fffff802`80bf154f 483931          cmp     qword ptr [rcx],rsi ; rsi.Blink.Flink != rsi ?
	fffff802`80bf1552 0f858b000000    jne     nt!NtNotifyChangeMultipleKeys+0x125db3 (fffff802`80bf15e3)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125d28:
	; RemoveEntryList(rsi)
	fffff802`80bf1558 488901          mov     qword ptr [rcx],rax
	fffff802`80bf155b 48894808        mov     qword ptr [rax+8],rcx

	nt!NtNotifyChangeMultipleKeys+0x125d2f:
	fffff802`80bf155f 488d4610        lea     rax,[rsi+10h]
	fffff802`80bf1563 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff802`80bf1566 488b4808        mov     rcx,qword ptr [rax+8] ; rcx = rax.Blink
	fffff802`80bf156a 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff802`80bf156e 7578            jne     nt!NtNotifyChangeMultipleKeys+0x125db8 (fffff802`80bf15e8)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125d40:
	fffff802`80bf1570 483901          cmp     qword ptr [rcx],rax ; rax.Blink.Flink != rax ?
	fffff802`80bf1573 7573            jne     nt!NtNotifyChangeMultipleKeys+0x125db8 (fffff802`80bf15e8)  Branch ; __fastfail

	nt!NtNotifyChangeMultipleKeys+0x125d45:
	; RemoveEntryList(rax)
	fffff802`80bf1575 488911          mov     qword ptr [rcx],rdx
	fffff802`80bf1578 48894a08        mov     qword ptr [rdx+8],rcx
	fffff802`80bf157c 8b052a30d8ff    mov     eax,dword ptr [nt!KiIrqlFlags (fffff802`809745ac)]
	fffff802`80bf1582 85c0            test    eax,eax
	fffff802`80bf1584 7433            je      nt!NtNotifyChangeMultipleKeys+0x125d89 (fffff802`80bf15b9)  Branch
```

### ObRegisterCallbacks

```
	nt!ObRegisterCallbacks+0x121:
	fffff802`80b811b1 48c1e306        shl     rbx,6
	fffff802`80b811b5 4883c320        add     rbx,20h
	fffff802`80b811b9 4803de          add     rbx,rsi
	fffff802`80b811bc 488d4b38        lea     rcx,[rbx+38h]
	; InitializeListHead(rbx)
	fffff802`80b811c0 48895b08        mov     qword ptr [rbx+8],rbx
	fffff802`80b811c4 48891b          mov     qword ptr [rbx],rbx
	fffff802`80b811c7 e814fa93ff      call    nt!ExInitializePushLock (fffff802`804c0be0)
	fffff802`80b811cc 418b4608        mov     eax,dword ptr [r14+8]
	fffff802`80b811d0 488bd3          mov     rdx,rbx
	fffff802`80b811d3 894310          mov     dword ptr [rbx+10h],eax
	fffff802`80b811d6 48897318        mov     qword ptr [rbx+18h],rsi
	fffff802`80b811da 498b06          mov     rax,qword ptr [r14]
	fffff802`80b811dd 488b08          mov     rcx,qword ptr [rax]
	fffff802`80b811e0 48894b20        mov     qword ptr [rbx+20h],rcx
	fffff802`80b811e4 498b4610        mov     rax,qword ptr [r14+10h]
	fffff802`80b811e8 48894328        mov     qword ptr [rbx+28h],rax
	fffff802`80b811ec 498b4618        mov     rax,qword ptr [r14+18h]
	fffff802`80b811f0 48894330        mov     qword ptr [rbx+30h],rax
	fffff802`80b811f4 e86b000000      call    nt!ObpInsertCallbackByAltitude (fffff802`80b81264)
	fffff802`80b811f9 8bd8            mov     ebx,eax
	fffff802`80b811fb 85c0            test    eax,eax
	fffff802`80b811fd 7815            js      nt!ObRegisterCallbacks+0x184 (fffff802`80b81214)  Branch

	nt!ObRegisterCallbacks+0xa0980:
	fffff802`80c21a10 8bc7            mov     eax,edi
	fffff802`80c21a12 4c8d7620        lea     r14,[rsi+20h]
	fffff802`80c21a16 48c1e006        shl     rax,6
	fffff802`80c21a1a 4c03f0          add     r14,rax
	fffff802`80c21a1d 65488b042588010000 mov   rax,qword ptr gs:[188h]
	fffff802`80c21a26 66ff88e6010000  dec     word ptr [rax+1E6h]
	fffff802`80c21a2d 498b4e20        mov     rcx,qword ptr [r14+20h]
	fffff802`80c21a31 33d2            xor     edx,edx
	fffff802`80c21a33 4803cd          add     rcx,rbp
	fffff802`80c21a36 e8550088ff      call    nt!ExAcquirePushLockExclusiveEx (fffff802`804a1a90)
	fffff802`80c21a3b 498b0e          mov     rcx,qword ptr [r14] ; rcx = r14.Flink
	fffff802`80c21a3e 4c397108        cmp     qword ptr [rcx+8],r14 ; r14.Flink.Blink != r14 ?
	fffff802`80c21a42 7554            jne     nt!ObRegisterCallbacks+0xa0a08 (fffff802`80c21a98)  Branch ; __fastfail

	nt!ObRegisterCallbacks+0xa09b4:
	fffff802`80c21a44 498b4608        mov     rax,qword ptr [r14+8] ; rax = r14.Blink
	fffff802`80c21a48 4c3930          cmp     qword ptr [rax],r14 ; r14.Blink.Flink != r14 ?
	fffff802`80c21a4b 754b            jne     nt!ObRegisterCallbacks+0xa0a08 (fffff802`80c21a98)  Branch ; __fastfail

	nt!ObRegisterCallbacks+0xa09bd:
	; RemoveEntryList(r14)
	fffff802`80c21a4d 488908          mov     qword ptr [rax],rcx ; r14.Blink = r14.Flink
	fffff802`80c21a50 33d2            xor     edx,edx
	fffff802`80c21a52 48894108        mov     qword ptr [rcx+8],rax
	fffff802`80c21a56 498b4e20        mov     rcx,qword ptr [r14+20h]
	fffff802`80c21a5a 4803cd          add     rcx,rbp
	fffff802`80c21a5d e8fe0488ff      call    nt!ExReleasePushLockEx (fffff802`804a1f60)
	fffff802`80c21a62 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
	fffff802`80c21a6b e8200488ff      call    nt!KiLeaveGuardedRegionUnsafe (fffff802`804a1e90)
	fffff802`80c21a70 0fb74602        movzx   eax,word ptr [rsi+2]
	fffff802`80c21a74 4103fd          add     edi,r13d
	fffff802`80c21a77 3bf8            cmp     edi,eax
	fffff802`80c21a79 7295            jb      nt!ObRegisterCallbacks+0xa0980 (fffff802`80c21a10)  Branch
```

### ObUnRegisterCallbacks

```
	nt!ObUnRegisterCallbacks+0x1a:
	fffff802`80ca0eea 8bc6            mov     eax,esi
	fffff802`80ca0eec 488d7b20        lea     rdi,[rbx+20h]
	fffff802`80ca0ef0 48c1e006        shl     rax,6
	fffff802`80ca0ef4 4803f8          add     rdi,rax
	fffff802`80ca0ef7 488d4f38        lea     rcx,[rdi+38h]
	fffff802`80ca0efb e8807782ff      call    nt!ExWaitForRundownProtectionRelease (fffff802`804c8680)
	fffff802`80ca0f00 65488b042588010000 mov   rax,qword ptr gs:[188h]
	fffff802`80ca0f09 66ff88e6010000  dec     word ptr [rax+1E6h]
	fffff802`80ca0f10 488b4f20        mov     rcx,qword ptr [rdi+20h]
	fffff802`80ca0f14 33d2            xor     edx,edx
	fffff802`80ca0f16 4881c1b8000000  add     rcx,0B8h
	fffff802`80ca0f1d e86e0b80ff      call    nt!ExAcquirePushLockExclusiveEx (fffff802`804a1a90)
	fffff802`80ca0f22 488b0f          mov     rcx,qword ptr [rdi] ; rcx = rdi.Flink
	fffff802`80ca0f25 48397908        cmp     qword ptr [rcx+8],rdi ; rdi.Flink.Blink != rdi ?
	fffff802`80ca0f29 7557            jne     nt!ObUnRegisterCallbacks+0xb2 (fffff802`80ca0f82)  Branch ; __fastfail

	nt!ObUnRegisterCallbacks+0x5b:
	fffff802`80ca0f2b 488b4708        mov     rax,qword ptr [rdi+8] ; rax = rdi.Blink
	fffff802`80ca0f2f 483938          cmp     qword ptr [rax],rdi ; rdi.Blink.Flink != rdi ?
	fffff802`80ca0f32 754e            jne     nt!ObUnRegisterCallbacks+0xb2 (fffff802`80ca0f82)  Branch ; __fastfail

	nt!ObUnRegisterCallbacks+0x64:
	; RemoveEntryList(rdi)
	fffff802`80ca0f34 488908          mov     qword ptr [rax],rcx
	fffff802`80ca0f37 33d2            xor     edx,edx
	fffff802`80ca0f39 48894108        mov     qword ptr [rcx+8],rax
	fffff802`80ca0f3d 488b4f20        mov     rcx,qword ptr [rdi+20h]
	fffff802`80ca0f41 4881c1b8000000  add     rcx,0B8h
	fffff802`80ca0f48 e8131080ff      call    nt!ExReleasePushLockEx (fffff802`804a1f60)
	fffff802`80ca0f4d 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
	fffff802`80ca0f56 e8350f80ff      call    nt!KiLeaveGuardedRegionUnsafe (fffff802`804a1e90)
	fffff802`80ca0f5b 0fb74302        movzx   eax,word ptr [rbx+2]
	fffff802`80ca0f5f ffc6            inc     esi
	fffff802`80ca0f61 3bf0            cmp     esi,eax
	fffff802`80ca0f63 7285            jb      nt!ObUnRegisterCallbacks+0x1a (fffff802`80ca0eea)  Branch

	nt!ObpCallPostOperationCallbacks+0x1a:
	fffff802`80ca0faa 48393f          cmp     qword ptr [rdi],rdi ; rdi.Flink == rdi ?
	fffff802`80ca0fad 7455            je      nt!ObpCallPostOperationCallbacks+0x74 (fffff802`80ca1004)  Branch

	nt!ObpCallPostOperationCallbacks+0x1f:
	fffff802`80ca0faf 488b7708        mov     rsi,qword ptr [rdi+8] ; rsi = rdi.Blink
	fffff802`80ca0fb3 48393e          cmp     qword ptr [rsi],rdi ; rdi.Blink.Flink != rdi ?
	fffff802`80ca0fb6 7545            jne     nt!ObpCallPostOperationCallbacks+0x6d (fffff802`80ca0ffd)  Branch ; __fastfail

	nt!ObpCallPostOperationCallbacks+0x28:
	fffff802`80ca0fb8 488b4608        mov     rax,qword ptr [rsi+8] ; rax = rdi.Blink.Blink 
	fffff802`80ca0fbc 483930          cmp     qword ptr [rax],rsi ; rdi.Blink.Blink.Flink != rdi.Blink ?
	fffff802`80ca0fbf 753c            jne     nt!ObpCallPostOperationCallbacks+0x6d (fffff802`80ca0ffd)  Branch ; __fastfail

	nt!ObpCallPostOperationCallbacks+0x31:
	; RemoveEntryList(rsi)
	fffff802`80ca0fc1 48894708        mov     qword ptr [rdi+8],rax
	fffff802`80ca0fc5 488bd5          mov     rdx,rbp
	fffff802`80ca0fc8 488938          mov     qword ptr [rax],rdi
	fffff802`80ca0fcb 488b5e10        mov     rbx,qword ptr [rsi+10h]
	fffff802`80ca0fcf 488b4618        mov     rax,qword ptr [rsi+18h]
	fffff802`80ca0fd3 48894518        mov     qword ptr [rbp+18h],rax
	fffff802`80ca0fd7 488b4b18        mov     rcx,qword ptr [rbx+18h]
	fffff802`80ca0fdb 488b4330        mov     rax,qword ptr [rbx+30h]
	fffff802`80ca0fdf 488b4908        mov     rcx,qword ptr [rcx+8]
	fffff802`80ca0fe3 e8a89e92ff      call    nt!guard_dispatch_icall (fffff802`805cae90)
	fffff802`80ca0fe8 488d4b38        lea     rcx,[rbx+38h]
	fffff802`80ca0fec e8df5480ff      call    nt!ExReleaseRundownProtection (fffff802`804a64d0)
	fffff802`80ca0ff1 33d2            xor     edx,edx
	fffff802`80ca0ff3 488bce          mov     rcx,rsi
	fffff802`80ca0ff6 e8a5e0acff      call    nt!ExFreePool (fffff802`8076f0a0)
	fffff802`80ca0ffb ebad            jmp     nt!ObpCallPostOperationCallbacks+0x1a (fffff802`80ca0faa)  Branch
```
