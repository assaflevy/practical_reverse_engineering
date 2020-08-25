# Exercise
Repeat the previous exercise for InsertHeadList in the following routines:

■ CcSetVacbInFreeList<br>
■ CmpDoSort<br>
■ ExBurnMemory<br>
■ ExFreePoolWithTag<br>
■ IoPageRead<br>
■ IovpCallDriver1<br>
■ KeInitThread<br>
■ KiInsertQueueApc<br>
■ KeInsertQueueDpc<br>
■ KiQueueReadyThread<br>
■ MiInsertInSystemSpace<br>
■ MiUpdateWsle<br>
■ ObpInsertCallbackByAltitude<br>

# Solution

### CcSetVacbInFreeList

```
	nt!CcSetVacbInFreeList:
	fffff805`5242235c 4883ec38        sub     rsp,38h
	fffff805`52422360 ff0d5a3d4400    dec     dword ptr [nt!CcNumberOfMappedVacbs (fffff805`528660c0)]
	fffff805`52422366 488d4210        lea     rax,[rdx+10h] ; rax = Entry
	fffff805`5242236a 4533d2          xor     r10d,r10d
	fffff805`5242236d 4584c0          test    r8b,r8b ; r8b is non zero ?
	fffff805`52422370 7549            jne     nt!CcSetVacbInFreeList+0x5f (fffff805`524223bb)  Branch

	nt!CcSetVacbInFreeList+0x16:
	fffff805`52422372 488b0d97394400  mov     rcx,qword ptr [nt!CcVacbFreeList (fffff805`52865d10)] ; rcx = Head.Flink
	fffff805`52422379 4c8d0590394400  lea     r8,[nt!CcVacbFreeList (fffff805`52865d10)] ; r8 = Head
	fffff805`52422380 4c394108        cmp     qword ptr [rcx+8],r8 ; Head.Flink.Blink != Head ?
	fffff805`52422384 755f            jne     nt!CcSetVacbInFreeList+0x89 (fffff805`524223e5)  Branch ; __fastfail

	nt!CcSetVacbInFreeList+0x2a:
	; InsertHeadList(r8, rax)
	fffff805`52422386 488908          mov     qword ptr [rax],rcx
	fffff805`52422389 4c894008        mov     qword ptr [rax+8],r8
	fffff805`5242238d 48894108        mov     qword ptr [rcx+8],rax
	fffff805`52422391 48890578394400  mov     qword ptr [nt!CcVacbFreeList (fffff805`52865d10)],rax ; Why not qword ptr [r8] ?
	fffff805`52422398 488b4a20        mov     rcx,qword ptr [rdx+20h]
	fffff805`5242239c 4c895208        mov     qword ptr [rdx+8],r10
	fffff805`524223a0 8b4104          mov     eax,dword ptr [rcx+4]
	fffff805`524223a3 85c0            test    eax,eax
	fffff805`524223a5 0f8423801c00    je      nt!CcSetVacbInFreeList+0x1c8072 (fffff805`525ea3ce)  Branch

	nt!CcSetVacbInFreeList+0x4f:
	fffff805`524223ab ffc8            dec     eax
	fffff805`524223ad 894104          mov     dword ptr [rcx+4],eax
	fffff805`524223b0 ff0542394400    inc     dword ptr [nt!CcNumberOfFreeVacbs (fffff805`52865cf8)]

	nt!CcSetVacbInFreeList+0x5a:
	fffff805`524223b6 4883c438        add     rsp,38h
	fffff805`524223ba c3              ret

	nt!CcSetVacbInFreeList+0x5f:
	; use rcx+348h as Head
	fffff805`524223bb 4c8d8148030000  lea     r8,[rcx+348h] ; r8 = Head
	fffff805`524223c2 4d8b08          mov     r9,qword ptr [r8] ; r9 = Head.Flink
	fffff805`524223c5 4d394108        cmp     qword ptr [r9+8],r8 ; Head.Flink.Blink != Head ?
	fffff805`524223c9 751a            jne     nt!CcSetVacbInFreeList+0x89 (fffff805`524223e5)  Branch ; __fastfail

	nt!CcSetVacbInFreeList+0x6f:
	; InsertHeadList(r8, rax)
	fffff805`524223cb 4c8908          mov     qword ptr [rax],r9 ; Entry.Flink = Head.Flink
	fffff805`524223ce 4c894008        mov     qword ptr [rax+8],r8 ; Entry.Blink = Head
	fffff805`524223d2 49894108        mov     qword ptr [r9+8],rax ; Head.Flink.Blink = rax
	fffff805`524223d6 498900          mov     qword ptr [r8],rax ; Head.Flink = rax
	fffff805`524223d9 4c895208        mov     qword ptr [rdx+8],r10
	fffff805`524223dd ff8158030000    inc     dword ptr [rcx+358h]
	fffff805`524223e3 ebd1            jmp     nt!CcSetVacbInFreeList+0x5a (fffff805`524223b6)  Branch

	nt!CcSetVacbInFreeList+0x89:
	fffff805`524223e5 b903000000      mov     ecx,3
	fffff805`524223ea cd29            int     29h
```

### CmpDoSort

```
	Symbol found but memory zeroed.
```

### ExBurnMemory

```
	Symbol found but memory zeroed.
```

### ExFreePoolWithTag (calls ExFreeHeapPool)

```
	nt!ExFreeHeapPool+0x534:
	fffff805`524adfa4 488bd7          mov     rdx,rdi
	; Presumably replaced with interlocked singly linked list
	fffff805`524adfa7 e824c31100      call    nt!ExpInterlockedPushEntrySList (fffff805`525ca2d0)
	fffff805`524adfac e916feffff      jmp     nt!ExFreeHeapPool+0x357 (fffff805`524addc7)  Branch
```

### IoPageRead (calls IoPageReadEx which calls IopQueuethreadIrp)

```
	nt!IopQueueThreadIrp+0x8e:
	; InsertHeadList(rdi, rsi)
	fffff805`5249e82e 488906          mov     qword ptr [rsi],rax
	fffff805`5249e831 48897e08        mov     qword ptr [rsi+8],rdi
	fffff805`5249e835 48897008        mov     qword ptr [rax+8],rsi
	fffff805`5249e839 488937          mov     qword ptr [rdi],rsi
```
	
### IovpCallDriver1

```
	nt!IovpCallDriver1+0x2b0:
	fffff805`52d6f7b4 410fba6e181a    bts     dword ptr [r14+18h],1Ah
	fffff805`52d6f7ba 498d4620        lea     rax,[r14+20h]
	fffff805`52d6f7be 83bc24b800000000 cmp     dword ptr [rsp+0B8h],0
	; InitializeListHead(rax)
	fffff805`52d6f7c6 48894008        mov     qword ptr [rax+8],rax
	fffff805`52d6f7ca 488900          mov     qword ptr [rax],rax

	nt!IovpCallDriver1+0x32d:
	fffff805`52d6f831 410fb617        movzx   edx,byte ptr [r15]
	fffff805`52d6f835 498b4d08        mov     rcx,qword ptr [r13+8]
	fffff805`52d6f839 e83e0d0000      call    nt!VfGetPristineDispatchRoutine (fffff805`52d7057c)
	fffff805`52d6f83e 48894728        mov     qword ptr [rdi+28h],rax
	fffff805`52d6f842 4d8d4620        lea     r8,[r14+20h]
	fffff805`52d6f846 0fba77041e      btr     dword ptr [rdi+4],1Eh
	fffff805`52d6f84b 488d4710        lea     rax,[rdi+10h]
	fffff805`52d6f84f 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff805`52d6f852 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink == rax ?
	fffff805`52d6f856 7407            je      nt!IovpCallDriver1+0x35b (fffff805`52d6f85f)  Branch ; do insert

	nt!IovpCallDriver1+0x35b:
	; InsertHeadList(rax, r8)
	fffff805`52d6f85f 498910          mov     qword ptr [r8],rdx
	fffff805`52d6f862 49894008        mov     qword ptr [r8+8],rax
	fffff805`52d6f866 4c894208        mov     qword ptr [rdx+8],r8
	fffff805`52d6f86a 4c8900          mov     qword ptr [rax],r8
```

### KeInitThread

```
	See above
```

### KiInsertQueueApc

```
	nt!KiInsertQueueApc+0x3d:
	fffff805`524c6879 480fbed0        movsx   rdx,al
	fffff805`524c687d 4883c110        add     rcx,10h
	fffff805`524c6881 48c1e204        shl     rdx,4
	fffff805`524c6885 4903d0          add     rdx,r8
	fffff805`524c6888 488b4208        mov     rax,qword ptr [rdx+8] ; rax = Head.Blink
	fffff805`524c688c 483910          cmp     qword ptr [rax],rdx ; Head.Blink.Flink != Head ? 
	fffff805`524c688f 0f85d1811100    jne     nt!KiInsertQueueApc+0x11822a (fffff805`525dea66)  Branch ; __fastfail

	nt!KiInsertQueueApc+0x59:
	; InsertTailList(rdx, rcx)
	fffff805`524c6895 488911          mov     qword ptr [rcx],rdx
	fffff805`524c6898 48894108        mov     qword ptr [rcx+8],rax
	fffff805`524c689c 488908          mov     qword ptr [rax],rcx
	fffff805`524c689f 48894a08        mov     qword ptr [rdx+8],rcx
	fffff805`524c68a3 c3              ret

	nt!KiInsertQueueApc+0x78:
	fffff805`524c68b4 808ac200000002  or      byte ptr [rdx+0C2h],2
	fffff805`524c68bb 4883c110        add     rcx,10h
	fffff805`524c68bf 480fbed0        movsx   rdx,al
	fffff805`524c68c3 48c1e204        shl     rdx,4
	fffff805`524c68c7 4903d0          add     rdx,r8
	fffff805`524c68ca 488b02          mov     rax,qword ptr [rdx] ; rax = rdx.Flink
	fffff805`524c68cd 48395008        cmp     qword ptr [rax+8],rdx ; rdx.Flink.Blink != rdx ?
	fffff805`524c68d1 0f858f811100    jne     nt!KiInsertQueueApc+0x11822a (fffff805`525dea66)  Branch ; __fastfail

	nt!KiInsertQueueApc+0x9b:
	; InsertHeadList(rdx, rcx)
	fffff805`524c68d7 488901          mov     qword ptr [rcx],rax
	fffff805`524c68da 48895108        mov     qword ptr [rcx+8],rdx
	fffff805`524c68de 48894808        mov     qword ptr [rax+8],rcx
	fffff805`524c68e2 48890a          mov     qword ptr [rdx],rcx
	fffff805`524c68e5 c3              ret

	nt!KiInsertQueueApc+0xd9:
	fffff805`524c6915 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff805`524c6918 4883c110        add     rcx,10h
	fffff805`524c691c 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff805`524c6920 0f8540811100    jne     nt!KiInsertQueueApc+0x11822a (fffff805`525dea66)  Branch ; __fastfail

	nt!KiInsertQueueApc+0xea:
	; InsertHeadList(rax, rcx)
	fffff805`524c6926 488911          mov     qword ptr [rcx],rdx
	fffff805`524c6929 48894108        mov     qword ptr [rcx+8],rax
	fffff805`524c692d 48894a08        mov     qword ptr [rdx+8],rcx
	fffff805`524c6931 488908          mov     qword ptr [rax],rcx
	fffff805`524c6934 c3              ret
```

### KiInsertQueueDpc

```
	Can't find anything that makes a lot of sense.
```

### KiQueueReadyThread

```
	nt!KiQueueReadyThread+0x192:
	fffff805`5248fa72 488b0e          mov     rcx,qword ptr [rsi] ; rcx = rsi.Flink
	fffff805`5248fa75 48397108        cmp     qword ptr [rcx+8],rsi ; rsi.Flink.Blink != rsi ? 
	fffff805`5248fa79 0f8526ae1800    jne     nt!KiQueueReadyThread+0x18afc5 (fffff805`5261a8a5)  Branch ; __fastfail

	nt!KiQueueReadyThread+0x19f:
	; InsertHeadList(rsi, rax)
	fffff805`5248fa7f 488908          mov     qword ptr [rax],rcx
	fffff805`5248fa82 48897008        mov     qword ptr [rax+8],rsi
	fffff805`5248fa86 48894108        mov     qword ptr [rcx+8],rax
	fffff805`5248fa8a 488906          mov     qword ptr [rsi],rax
	fffff805`5248fa8d 0fb3af1c590000  btr     dword ptr [rdi+591Ch],ebp

	nt!KiQueueReadyThread+0x230:
	fffff805`5248fb10 488b4e08        mov     rcx,qword ptr [rsi+8] ; rcx = rsi.Blink
	fffff805`5248fb14 483931          cmp     qword ptr [rcx],rsi ; rsi.Blink.Flink != rsi ?
	fffff805`5248fb17 0f8588ad1800    jne     nt!KiQueueReadyThread+0x18afc5 (fffff805`5261a8a5)  Branch ; __fastfail

	nt!KiQueueReadyThread+0x23d:
	; InsertTailList(rsi, rax)
	fffff805`5248fb1d 488930          mov     qword ptr [rax],rsi
	fffff805`5248fb20 48894808        mov     qword ptr [rax+8],rcx
	fffff805`5248fb24 488901          mov     qword ptr [rcx],rax
	fffff805`5248fb27 48894608        mov     qword ptr [rsi+8],rax
	fffff805`5248fb2b e964ffffff      jmp     nt!KiQueueReadyThread+0x1b4 (fffff805`5248fa94)  Branch

	nt!KiQueueReadyThread+0x4fd:
	fffff805`5248fddd 488b10          mov     rdx,qword ptr [rax] ; rdx = rax.Flink
	fffff805`5248fde0 48394208        cmp     qword ptr [rdx+8],rax ; rax.Flink.Blink != rax ?
	fffff805`5248fde4 0f85bbaa1800    jne     nt!KiQueueReadyThread+0x18afc5 (fffff805`5261a8a5)  Branch ; __fastfail

	nt!KiQueueReadyThread+0x50a:
	; InsertHeadList(rax, rcx)
	fffff805`5248fdea 488911          mov     qword ptr [rcx],rdx
	fffff805`5248fded 48894108        mov     qword ptr [rcx+8],rax
	fffff805`5248fdf1 48894a08        mov     qword ptr [rdx+8],rcx
	fffff805`5248fdf5 488908          mov     qword ptr [rax],rcx
	fffff805`5248fdf8 0fabaf1c590000  bts     dword ptr [rdi+591Ch],ebp

	nt!KiQueueReadyThread+0x549:
	fffff805`5248fe29 488b5008        mov     rdx,qword ptr [rax+8] ; rdx = rax.Blink
	fffff805`5248fe2d 483902          cmp     qword ptr [rdx],rax ; rax.Blink.Flink != rax ?
	fffff805`5248fe30 0f856faa1800    jne     nt!KiQueueReadyThread+0x18afc5 (fffff805`5261a8a5)  Branch ; __fastfail

	nt!KiQueueReadyThread+0x556:
	; InsertTailList(rax, rcx)
	fffff805`5248fe36 488901          mov     qword ptr [rcx],rax
	fffff805`5248fe39 48895108        mov     qword ptr [rcx+8],rdx
	fffff805`5248fe3d 48890a          mov     qword ptr [rdx],rcx
	fffff805`5248fe40 48894808        mov     qword ptr [rax+8],rcx
	fffff805`5248fe44 ebb9            jmp     nt!KiQueueReadyThread+0x51f (fffff805`5248fdff)  Branch
```

### MiInsertInSystemSpace

```
	Couldn't find it.
```

### MiUpdateWsle

```
	Symbol not found.
```

### ObpInsertCallbackByAltitude

```
	nt!ObpInsertCallbackByAltitude+0x4d:
	fffff805`52b812b1 488b4308        mov     rax,qword ptr [rbx+8] ; rax = rbx.Blink
	fffff805`52b812b5 488b08          mov     rcx,qword ptr [rax] ; rcx = rbx.Blink.Flink
	fffff805`52b812b8 48394108        cmp     qword ptr [rcx+8],rax ; rbx.Blink.Flink.Blink != rbx.Blink ? 
	fffff805`52b812bc 0f8517080a00    jne     nt!ObpInsertCallbackByAltitude+0xa0875 (fffff805`52c21ad9)  Branch ; __fastfail

	nt!ObpInsertCallbackByAltitude+0x5e:
	; InsertTailList(rbx, rdi)
	fffff805`52b812c2 48890f          mov     qword ptr [rdi],rcx
	fffff805`52b812c5 48894708        mov     qword ptr [rdi+8],rax
	fffff805`52b812c9 48897908        mov     qword ptr [rcx+8],rdi
	fffff805`52b812cd 488938          mov     qword ptr [rax],rdi
```
