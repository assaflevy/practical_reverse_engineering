//nt!KxWaitForLockChainValid:
//fffff802`804e0810 48895c2408      mov     qword ptr[rsp + 8], rbx
//fffff802`804e0815 57              push    rdi
//fffff802`804e0816 4883ec20        sub     rsp, 20h
//fffff802`804e081a 488bf9          mov     rdi, rcx
//fffff802`804e081d 33db xor ebx, ebx
//
//nt!KxWaitForLockChainValid + 0xf:
//fffff802`804e081f ffc3            inc     ebx
//fffff802`804e0821 851d212a4900    test    dword ptr[nt!HvlLongSpinCountMask(fffff802`80973248)], ebx
//fffff802`804e0827 0f84896c1500    je      nt!KxWaitForLockChainValid + 0x156ca6 (fffff802`806374b6)  Branch
//
//nt!KxWaitForLockChainValid + 0x1d:
//fffff802`804e082d f390            pause
//
//nt!KxWaitForLockChainValid + 0x1f:
//fffff802`804e082f 488b07          mov     rax, qword ptr[rdi]
//fffff802`804e0832 4885c0          test    rax, rax
//fffff802`804e0835 74e8            je      nt!KxWaitForLockChainValid + 0xf (fffff802`804e081f)  Branch
//
//nt!KxWaitForLockChainValid + 0x27:
//fffff802`804e0837 488b5c2430      mov     rbx, qword ptr[rsp + 30h]
//fffff802`804e083c 4883c420        add     rsp, 20h
//fffff802`804e0840 5f              pop     rdi
//fffff802`804e0841 c3              ret
//
//nt!KxWaitForLockChainValid + 0x156ca6:
//fffff802`806374b6 8b05e0ce3300    mov     eax, dword ptr[nt!HvlEnlightenments(fffff802`8097439c)]
//fffff802`806374bc a840            test    al, 40h
//fffff802`806374be 0f846993eaff    je      nt!KxWaitForLockChainValid + 0x1d (fffff802`804e082d)  Branch
//
//nt!KxWaitForLockChainValid + 0x156cb4:
//fffff802`806374c4 e8b7880700      call    nt!KiCheckVpBackingLongSpinWaitHypercall(fffff802`806afd80)
//fffff802`806374c9 84c0            test    al, al
//fffff802`806374cb 0f845c93eaff    je      nt!KxWaitForLockChainValid + 0x1d (fffff802`804e082d)  Branch
//
//nt!KxWaitForLockChainValid + 0x156cc1:
//fffff802`806374d1 8bcb            mov     ecx, ebx
//fffff802`806374d3 e8a8e70400      call    nt!HvlNotifyLongSpinWait(fffff802`80685c80)
//fffff802`806374d8 90              nop
//fffff802`806374d9 e95193eaff      jmp     nt!KxWaitForLockChainValid + 0x1f (fffff802`804e082f)  Branch

DWORD HvlLongSpinCountMask;
DWORD HvlEnlightments;

void HvlNotifyLongSpinWait(DWORD);

void
KxWaitForLockChainValid(
    PVOID param1 // ?
)
{
    // rdi = rcx
    for (DWORD ebx = 1; ; ++ebx)
    {
        if ((ebx & HvlLongSpinCountMask) != 0)
        {
            YieldProcessor(); // _mm_pause()
            if (*(PDWORD64)param1)
            {
                return;
            }
            continue;
        }

        if ((BYTE)HvlEnlightments & 0x40)
        {
            if (KiCheckVpBackingLongSpinWaitHypercall())
            {
                HvlNotifyLongSpinWait(ebx);
                if (*(PDWORD64)param1)
                {
                    return;
                }
                continue;
            }
        }

        YieldProcessor(); // _mm_pause()
        if (*(PDWORD64)param1)
        {
            return;
        }
    }
}
