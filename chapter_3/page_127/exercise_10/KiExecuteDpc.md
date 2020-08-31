The `KiExecuteDpc` function executes all DPCs in the current processor's list.

This function does not return (normally at least). Neither `KiTryToEndDpcProcessing` nor `KiLeaveGuardedRegionUnsafe` cause the function to exit.<br>
I'll assuming that this functions runs forever in a loop, and that this is the processor's "DpcThread" if there is such a thing.

According to the docs [1], "threaded Dpcs" run at either `PASSIVE_LEVEL` or `DISPATCH_LEVEL`. So the thread running them can be preempted by normal user-mode threads (when not executing Dpcs) and can run forever.<br>
Note: as seen in the function, while it actually executes Dpcs, the thread can't be preempted because it clears the interrupt flag.

[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-threaded-dpcs

---------------------

The function's header looks like this:
VOID KiExecuteDpc(PKPRCB Prcb);

The first part is initialization:
  * Set current thread's priority to highest
  * Disable current thread's quantum. I'm assuming this is equiavalent to QuantumTarget = INFINITE
  * Set the thread's affinity to the processor which KPRCB was provided as a parameter)
  * Set KPRCB.ThreadDpcEnable = 1

The second part is an endless loop:
  * Wait for DPC gate
  * Get current thread
  * Decrease thread's SpecialApcDisable<br>  
  * Inner loop:
	 * Set KPRCB.ThreadDpcEnable = 1
	 * If SMAP is enabled, turn on the AC flag, effectively working around SMAP.
	 * Clear interrupt flag. Maskable interrupts are disabled, including the scheduler switching to another thread.
	 --- begin disable maskable interrupts
	 * Call KiExecuteAllDpcs(Prcb, Thread, MaybeNumDpcsExecuted?, TRUE)
	 * Set interrupt flag.
	 --- end disable maskable interrupts
	 * Call KiTryToEndDpcProcessing(&Prcb.ThreadDpcSate, &Prcb.DpcData[1])
	 * if KiTryToEndDpcProcessing() returns 0, then re-iterate inner loop.
	 * Call KiLeaveGuardedRegionUnsafe(GetCurrentThread())
	 * Re-iterate outer loop.
	
-------------------------

```
0: kd> uf /c /o KiExecuteDpc
nt!KiExecuteDpc (fffff806`3d19ed00)
  nt!KiExecuteDpc+0x37 (fffff806`3d19ed37):
    call to nt!memset (fffff806`3d1f1040)
  nt!KiExecuteDpc+0x4d (fffff806`3d19ed4d):
    call to nt!KeSetPriorityThread (fffff806`3d0d4170)
  nt!KiExecuteDpc+0x5d (fffff806`3d19ed5d):
    call to nt!KiSetSystemAffinityThreadToProcessor (fffff806`3d19ef64)
  nt!KiExecuteDpc+0x81 (fffff806`3d19ed81):
    call to nt!KeWaitForGate (fffff806`3d052278)
  nt!KiExecuteDpc+0xb9 (fffff806`3d19edb9):
    call to nt!KiExecuteAllDpcs (fffff806`3d03a3b0)
  nt!KiExecuteDpc+0xd2 (fffff806`3d19edd2):
    call to nt!KiTryToEndDpcProcessing (fffff806`3d149998)
  nt!KiExecuteDpc+0xe4 (fffff806`3d19ede4):
    call to nt!KiLeaveGuardedRegionUnsafe (fffff806`3d025d30)

0: kd> uf KiExecuteDpc
nt!KiExecuteDpc:
fffff806`3d19ed00 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff806`3d19ed05 48896c2418      mov     qword ptr [rsp+18h],rbp
fffff806`3d19ed0a 56              push    rsi
fffff806`3d19ed0b 57              push    rdi
fffff806`3d19ed0c 4156            push    r14
fffff806`3d19ed0e 4881ec40010000  sub     rsp,140h
fffff806`3d19ed15 488b0514358700  mov     rax,qword ptr [nt!_security_cookie (fffff806`3da12230)]
fffff806`3d19ed1c 4833c4          xor     rax,rsp
fffff806`3d19ed1f 4889842430010000 mov     qword ptr [rsp+130h],rax
fffff806`3d19ed27 488bf9          mov     rdi,rcx ; rdi = rcx
fffff806`3d19ed2a 33d2            xor     edx,edx ; 
fffff806`3d19ed2c 488d4c2424      lea     rcx,[rsp+24h] 
fffff806`3d19ed31 41b80c010000    mov     r8d,10Ch
fffff806`3d19ed37 e804230500      call    nt!memset (fffff806`3d1f1040)
fffff806`3d19ed3c 65488b342588010000 mov   rsi,qword ptr gs:[188h] ; rsi = _ETHREAD
fffff806`3d19ed45 ba1f000000      mov     edx,1Fh ; Thread priority 31 - highest
fffff806`3d19ed4a 488bce          mov     rcx,rsi ; current thread
fffff806`3d19ed4d e81e54f3ff      call    nt!KeSetPriorityThread (fffff806`3d0d4170)
fffff806`3d19ed52 f00fba6e7808    lock bts dword ptr [rsi+78h],8 ; atomically set _KTHREAD.DisableQuantum bit. Assuming i.e. "run thread regardless of quantum"
fffff806`3d19ed58 8b4f24          mov     ecx,dword ptr [rdi+24h] ; Set thread's affinity to this processor
fffff806`3d19ed5b 33d2            xor     edx,edx
fffff806`3d19ed5d e802020000      call    nt!KiSetSystemAffinityThreadToProcessor (fffff806`3d19ef64)
fffff806`3d19ed62 c6872831000001  mov     byte ptr [rdi+3128h],1 ; Set _KPRCB.ThreadDpcEnable = 1
fffff806`3d19ed69 488d9f2e310000  lea     rbx,[rdi+312Eh] ; rbx = & _KPRCB.ThreadDpcState

nt!KiExecuteDpc+0x70:
fffff806`3d19ed70 8364242000      and     dword ptr [rsp+20h],0
fffff806`3d19ed75 488d8f807b0000  lea     rcx,[rdi+7B80h] ; & _KPRCB.DpcGate
fffff806`3d19ed7c ba05000000      mov     edx,5
fffff806`3d19ed81 e8f234ebff      call    nt!KeWaitForGate (fffff806`3d052278)
fffff806`3d19ed86 65488b042588010000 mov   rax,qword ptr gs:[188h] ; rax = _KTHREAD
fffff806`3d19ed8f 66ff88e6010000  dec     word ptr [rax+1E6h] ; _KTHREAD.SpecialApcDisable--

nt!KiExecuteDpc+0x96:
fffff806`3d19ed96 b801000000      mov     eax,1
fffff806`3d19ed9b 668703          xchg    ax,word ptr [rbx] ; _KPRCB.ThreadDpcState = 1
fffff806`3d19ed9e 833da7c7950000  cmp     dword ptr [nt!KeSmapEnabled (fffff806`3dafb54c)],0
fffff806`3d19eda5 7544            jne     nt!KiExecuteDpc+0xeb (fffff806`3d19edeb)  Branch

nt!KiExecuteDpc+0xa7:
fffff806`3d19eda7 fa              cli ; Clear interrupt flag. Maskable interrupts are disabled.
fffff806`3d19eda8 41b901000000    mov     r9d,1
fffff806`3d19edae 4c8d442420      lea     r8,[rsp+20h]
fffff806`3d19edb3 488bd6          mov     rdx,rsi
fffff806`3d19edb6 488bcf          mov     rcx,rdi
fffff806`3d19edb9 e8f2b5e9ff      call    nt!KiExecuteAllDpcs (fffff806`3d03a3b0)
fffff806`3d19edbe fb              sti ; Set interrupt flag.
fffff806`3d19edbf 833d86c7950000  cmp     dword ptr [nt!KeSmapEnabled (fffff806`3dafb54c)],0
fffff806`3d19edc6 7528            jne     nt!KiExecuteDpc+0xf0 (fffff806`3d19edf0)  Branch

nt!KiExecuteDpc+0xc8: ; Try to end DPC processing, keep ExecutingAllDpcs() until succeeding.
fffff806`3d19edc8 488d97e8300000  lea     rdx,[rdi+30E8h] ; & _KPRCB.DpcData[1]
fffff806`3d19edcf 488bcb          mov     rcx,rbx ; 
fffff806`3d19edd2 e8c1abfaff      call    nt!KiTryToEndDpcProcessing (fffff806`3d149998)
fffff806`3d19edd7 84c0            test    al,al
fffff806`3d19edd9 74bb            je      nt!KiExecuteDpc+0x96 (fffff806`3d19ed96)  Branch

nt!KiExecuteDpc+0xdb:
fffff806`3d19eddb 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff806`3d19ede4 e8476fe8ff      call    nt!KiLeaveGuardedRegionUnsafe (fffff806`3d025d30)
fffff806`3d19ede9 eb85            jmp     nt!KiExecuteDpc+0x70 (fffff806`3d19ed70)  Branch

nt!KiExecuteDpc+0xeb:
fffff806`3d19edeb 0f01ca          clac ; Disallow supervisor-mode access to user-mode pages.
fffff806`3d19edee ebb7            jmp     nt!KiExecuteDpc+0xa7 (fffff806`3d19eda7)  Branch

nt!KiExecuteDpc+0xf0:
fffff806`3d19edf0 0f01cb          stac ; Allow supervisor-mode access to user-mode pages.
fffff806`3d19edf3 ebd3            jmp     nt!KiExecuteDpc+0xc8 (fffff806`3d19edc8)  Branch
```
