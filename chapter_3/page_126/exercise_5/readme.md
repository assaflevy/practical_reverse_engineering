# Exercise
Repeat the previous exercise for RemoveTailList in the following routines:

■ BootApplicationPersistentDataProcess<br>
■ CmpCallCallBacks<br>
■ CmpDelayCloseWorker<br>
■ ObpCallPostOperationCallbacks<br>
■ RaspAddCacheEntry

# Solution

### BootApplicationPresistentDataProcess

```
	Symbol found but all bytes are 0
```

### CmpCallCallBacks (calls CmpCallCallBacksEx)

```
	nt!CmpCallCallBacksEx+0x193:
	fffff805`52a0d063 4d396d00        cmp     qword ptr [r13],r13 ; r13.Flink != r13 ?
	fffff805`52a0d067 7507            jne     nt!CmpCallCallBacksEx+0x1a0 (fffff805`52a0d070)  Branch

	nt!CmpCallCallBacksEx+0x1a0:
	fffff805`52a0d070 498b5d08        mov     rbx,qword ptr [r13+8] ; rbx = r13.Blink
	fffff805`52a0d074 48895c2458      mov     qword ptr [rsp+58h],rbx
	fffff805`52a0d079 488b4308        mov     rax,qword ptr [rbx+8] ; rax = r13.Blink.Blink
	fffff805`52a0d07d 4c392b          cmp     qword ptr [rbx],r13 ; r13.Blink.Flink != r13
	fffff805`52a0d080 0f85f0bf1a00    jne     nt!CmpCallCallBacksEx+0x1ac1a6 (fffff805`52bb9076)  Branch ; __fastfail

    ; Jump if r13.Blink.Blink.Front != r13.Blink (sanity)
	nt!CmpCallCallBacksEx+0x1b6:
	fffff805`52a0d086 483918          cmp     qword ptr [rax],rbx ; r13.Blink.Blink.Flink != r13.Blink ?
	fffff805`52a0d089 0f85e7bf1a00    jne     nt!CmpCallCallBacksEx+0x1ac1a6 (fffff805`52bb9076)  Branch ; __fastfail

	nt!CmpCallCallBacksEx+0x1bf:
	; RemoveEntryList(rbx)
	fffff805`52a0d08f 49894508        mov     qword ptr [r13+8],rax ; r13.Blink = r13.Blink.Blink
	fffff805`52a0d093 4c8928          mov     qword ptr [rax],r13 ; r13.Blink.Blink.Flink = r13

	; ----------------
	
	nt!CmpCallCallBacksEx+0x329:
	fffff805`52a0d1f9 4c896618        mov     qword ptr [rsi+18h],r12
	fffff805`52a0d1fd 48897e20        mov     qword ptr [rsi+20h],rdi
	fffff805`52a0d201 488d4e10        lea     rcx,[rsi+10h]
	fffff805`52a0d205 488b542450      mov     rdx,qword ptr [rsp+50h]
	fffff805`52a0d20a 488b8260070000  mov     rax,qword ptr [rdx+760h]
	fffff805`52a0d211 488901          mov     qword ptr [rcx],rax
	fffff805`52a0d214 48898a60070000  mov     qword ptr [rdx+760h],rcx
	fffff805`52a0d21b 498b4508        mov     rax,qword ptr [r13+8] ; rax = r13.Blink
	fffff805`52a0d21f 4c3928          cmp     qword ptr [rax],r13 ; rax.Blink.Flink, r13
	fffff805`52a0d222 0f8585bc1a00    jne     nt!CmpCallCallBacksEx+0x1abfdd (fffff805`52bb8ead)  Branch ; (sanity) jump to __fastfail (int 29h) if not equal

	nt!CmpCallCallBacksEx+0x358:
	; InsertTailList(r13, rsi)
	fffff805`52a0d228 4c892e          mov     qword ptr [rsi],r13
	fffff805`52a0d22b 48894608        mov     qword ptr [rsi+8],rax
	fffff805`52a0d22f 488930          mov     qword ptr [rax],rsi
	fffff805`52a0d232 49897508        mov     qword ptr [r13+8],rsi

	; -------------------
	
	nt!CmpCallCallBacksEx+0x1abfe4:
	fffff805`52bb8eb4 488b0e          mov     rcx,qword ptr [rsi] ; rcx = rsi.Flink
	fffff805`52bb8eb7 488b4608        mov     rax,qword ptr [rsi+8] ; rax = rsi.Blink
	fffff805`52bb8ebb 48397108        cmp     qword ptr [rcx+8],rsi ; rsi.Flink.Blink != rsi
	fffff805`52bb8ebf 756e            jne     nt!CmpCallCallBacksEx+0x1ac05f (fffff805`52bb8f2f)  Branch ; __fastfail

	nt!CmpCallCallBacksEx+0x1abff1:
	fffff805`52bb8ec1 483930          cmp     qword ptr [rax],rsi ; rsi.Blink.Flink != rsi ?
	fffff805`52bb8ec4 7569            jne     nt!CmpCallCallBacksEx+0x1ac05f (fffff805`52bb8f2f)  Branch ; __fastfail

	nt!CmpCallCallBacksEx+0x1abff6:
	; RemoveEntryList(rsi)
	fffff805`52bb8ec6 488908          mov     qword ptr [rax],rcx ; rsi.Blink.Flink = rsi.Flink
	fffff805`52bb8ec9 48894108        mov     qword ptr [rcx+8],rax ; rsi.Flink.Blink = rsi.Blink
```

### nt!CmpDelayCloseWorker

```
	nt!CmpDelayCloseWorker+0x208:
	fffff805`52a1aa68 488b0d59b0e4ff  mov     rcx,qword ptr [nt!CmpDelayedLRUListHead+0x8 (fffff805`52865ac8)] ; rcx = Head.Blink
	fffff805`52a1aa6f 4c8d8120ffffff  lea     r8,[rcx-0E0h]
	fffff805`52a1aa76 483931          cmp     qword ptr [rcx],rsi ; Head.Blink.Flink != rsi ?
	fffff805`52a1aa79 756b            jne     nt!CmpDelayCloseWorker+0x286 (fffff805`52a1aae6)  Branch ; __fastfail (so rsi is Head)

	nt!CmpDelayCloseWorker+0x21b:
	fffff805`52a1aa7b 488b5108        mov     rdx,qword ptr [rcx+8] ; rdx = Head.Blink.Blink
	fffff805`52a1aa7f 48390a          cmp     qword ptr [rdx],rcx ; Head.Blink.Blink.Flink, Head.Blink
	fffff805`52a1aa82 7562            jne     nt!CmpDelayCloseWorker+0x286 (fffff805`52a1aae6)  Branch ; __fastfail

	nt!CmpDelayCloseWorker+0x224:
	; RemoveEntryList(rcx)
	fffff805`52a1aa84 4889153db0e4ff  mov     qword ptr [nt!CmpDelayedLRUListHead+0x8 (fffff805`52865ac8)],rdx ; Head.Blink = Head.Blink.Blink
	fffff805`52a1aa8b ffc8            dec     eax
	fffff805`52a1aa8d 488932          mov     qword ptr [rdx],rsi ; Head.Blink.Blink.Flink = Head
```

### nt!ObpCallPostOperationsCallbacks

```
	nt!ObpCallPostOperationCallbacks+0x1a:
	fffff805`52ca0faa 48393f          cmp     qword ptr [rdi],rdi ; rdi.Flink == rdi ?
	fffff805`52ca0fad 7455            je      nt!ObpCallPostOperationCallbacks+0x74 (fffff805`52ca1004)  Branch ; reached the end

	nt!ObpCallPostOperationCallbacks+0x1f:
	fffff805`52ca0faf 488b7708        mov     rsi,qword ptr [rdi+8] ; rsi = rdi.Blink
	fffff805`52ca0fb3 48393e          cmp     qword ptr [rsi],rdi ; rdi.Blink.Flink != rdi ?
	fffff805`52ca0fb6 7545            jne     nt!ObpCallPostOperationCallbacks+0x6d (fffff805`52ca0ffd)  Branch ; __fastfail

	nt!ObpCallPostOperationCallbacks+0x28:
	fffff805`52ca0fb8 488b4608        mov     rax,qword ptr [rsi+8] ; rax = rdi.Blink.Blink
	fffff805`52ca0fbc 483930          cmp     qword ptr [rax],rsi ; rdi.Blink.Blink.Flink != rsi ?
	fffff805`52ca0fbf 753c            jne     nt!ObpCallPostOperationCallbacks+0x6d (fffff805`52ca0ffd)  Branch ; __fastfail

	; RemoveTailList(rdi)
	nt!ObpCallPostOperationCallbacks+0x31:
	fffff805`52ca0fc1 48894708        mov     qword ptr [rdi+8],rax ; rdi.Blink = rdi.Blink.Blink
	fffff805`52ca0fc5 488bd5          mov     rdx,rbp
	fffff805`52ca0fc8 488938          mov     qword ptr [rax],rdi ; rdi.Blink.Blink.Flink = rdi
```

### RaspAddCacheEntry

```
	nt!RaspAddCacheEntry:
	fffff805`52d93634 4883ec28        sub     rsp,28h
	fffff805`52d93638 488b01          mov     rax,qword ptr [rcx] ; rax = rcx.Flink
	fffff805`52d9363b 48394808        cmp     qword ptr [rax+8],rcx ; rcx.Flink.Blink != rcx ?
	fffff805`52d9363f 7549            jne     nt!RaspAddCacheEntry+0x56 (fffff805`52d9368a)  Branch ; __fastfail

	; InsertHeadList(rcx, rdx)
	nt!RaspAddCacheEntry+0xd:
	fffff805`52d93641 488902          mov     qword ptr [rdx],rax   ; rdx.Flink = rcx.Flink
	fffff805`52d93644 48894a08        mov     qword ptr [rdx+8],rcx ; rdx.Blink = rcx
	fffff805`52d93648 48895008        mov     qword ptr [rax+8],rdx ; rcx.Flink.Blink = rdx
	fffff805`52d9364c 488911          mov     qword ptr [rcx],rdx   ; rcx.Flink = rdx
	fffff805`52d9364f 8b5130          mov     edx,dword ptr [rcx+30h]
	fffff805`52d93652 85d2            test    edx,edx
	fffff805`52d93654 7428            je      nt!RaspAddCacheEntry+0x4a (fffff805`52d9367e)  Branch ; return

	nt!RaspAddCacheEntry+0x22:
	fffff805`52d93656 8b4134          mov     eax,dword ptr [rcx+34h]
	fffff805`52d93659 3bc2            cmp     eax,edx
	fffff805`52d9365b 7526            jne     nt!RaspAddCacheEntry+0x4f (fffff805`52d93683)  Branch

	nt!RaspAddCacheEntry+0x29:
	fffff805`52d9365d 488b4108        mov     rax,qword ptr [rcx+8] ; rax = rcx.Blink
	fffff805`52d93661 483908          cmp     qword ptr [rax],rcx ; rcx.Blink.Flink != rcx ?
	fffff805`52d93664 7524            jne     nt!RaspAddCacheEntry+0x56 (fffff805`52d9368a)  Branch ; __fastfail

	nt!RaspAddCacheEntry+0x32:
	fffff805`52d93666 488b5008        mov     rdx,qword ptr [rax+8] ; rdx = rcx.Blink.Blink
	fffff805`52d9366a 483902          cmp     qword ptr [rdx],rax ; rcx.Blink.Blink.Flink != rcx.Blink ?
	fffff805`52d9366d 751b            jne     nt!RaspAddCacheEntry+0x56 (fffff805`52d9368a)  Branch ; __fastfail

	; RemoveTailList(rcx)
	nt!RaspAddCacheEntry+0x3b:
	fffff805`52d9366f 48895108        mov     qword ptr [rcx+8],rdx ; rcx.Blink = rcx.Blink.Blink
	fffff805`52d93673 48890a          mov     qword ptr [rdx],rcx ; rcx.Blink.Blink.Flink = rcx
	fffff805`52d93676 488bc8          mov     rcx,rax ; rax is the removed entry
	fffff805`52d93679 e81a000000      call    nt!RaspDestroyCachedBitmap (fffff805`52d93698)
```

