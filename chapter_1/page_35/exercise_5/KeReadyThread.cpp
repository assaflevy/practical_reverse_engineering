//nt!KeReadyThread:
//fffff802`8048f48c 4053            push    rbx
//fffff802`8048f48e 4883ec20        sub     rsp, 20h
//fffff802`8048f492 488b91b8000000  mov     rdx, qword ptr[rcx + 0B8h]
//fffff802`8048f499 488bd9          mov     rbx, rcx
//fffff802`8048f49c 8b8240020000    mov     eax, dword ptr[rdx + 240h]
//fffff802`8048f4a2 a807            test    al, 7
//fffff802`8048f4a4 750e            jne     nt!KeReadyThread + 0x28 (fffff802`8048f4b4)  Branch
//
//nt!KeReadyThread + 0x1a:
//fffff802`8048f4a6 488bcb          mov     rcx, rbx
//fffff802`8048f4a9 e836020000      call    nt!KiFastReadyThread(fffff802`8048f6e4)
//
//nt!KeReadyThread + 0x22:
//fffff802`8048f4ae 4883c420        add     rsp, 20h
//fffff802`8048f4b2 5b              pop     rbx
//fffff802`8048f4b3 c3              ret
//
//nt!KeReadyThread + 0x28:
//fffff802`8048f4b4 450f20c0        mov     r8, cr8
//fffff802`8048f4b8 b902000000      mov     ecx, 2
//fffff802`8048f4bd 440f22c1        mov     cr8, rcx
//fffff802`8048f4c1 8b05e5504e00    mov     eax, dword ptr[nt!KiIrqlFlags(fffff802`809745ac)]
//fffff802`8048f4c7 85c0            test    eax, eax
//fffff802`8048f4c9 0f8501b11800    jne     nt!KeReadyThread + 0x18b144 (fffff802`8061a5d0)  Branch
//
//nt!KeReadyThread + 0x43:
//fffff802`8048f4cf 488bcb          mov     rcx, rbx
//fffff802`8048f4d2 e8c9f00200      call    nt!KiInSwapSingleProcess(fffff802`804be5a0)
//fffff802`8048f4d7 84c0            test    al, al
//fffff802`8048f4d9 75d3            jne     nt!KeReadyThread + 0x22 (fffff802`8048f4ae)  Branch
//
//nt!KeReadyThread + 0x4f:
//fffff802`8048f4db ebc9            jmp     nt!KeReadyThread + 0x1a (fffff802`8048f4a6)  Branch
//
//nt!KeReadyThread + 0x18b144:
//fffff802`8061a5d0 a801            test    al, 1
//fffff802`8061a5d2 0f84f74ee7ff    je      nt!KeReadyThread + 0x43 (fffff802`8048f4cf)  Branch
//
//nt!KeReadyThread + 0x18b14c:
//fffff802`8061a5d8 443ac1          cmp     r8b, cl
//fffff802`8061a5db 0f83ee4ee7ff    jae     nt!KeReadyThread + 0x43 (fffff802`8048f4cf)  Branch
//
//nt!KeReadyThread + 0x18b155:
//fffff802`8061a5e1 65488b042520000000 mov   rax, qword ptr gs : [20h]
//fffff802`8061a5ea 488b88b8610000  mov     rcx, qword ptr[rax + 61B8h]
//fffff802`8061a5f1 f0810900000100  lock or dword ptr[rcx], 10000h
//fffff802`8061a5f8 e9d24ee7ff      jmp     nt!KeReadyThread + 0x43 (fffff802`8048f4cf)  Branch

void KiFastReadyThread(PKTHREAD);
KIRQL KeGetCurrentIrql();
VOID KeRaiseIrql(IN KIRQL NewIrql, OUT PKIRQL OldIrql);
DWORD64 KiInSwapSingleProcess(PKTHREAD);

DWORD KiIrqlFlags;

VOID
NTAPI
KeReadyThread(
    IN PKTHREAD Thread
)
{
    PKPROCESS Process = Thread->ApcState.Process;

    if (Thread->Affinity.Mask & 0x7 == 0)
    {
        KiFastReadyThread(Thread);
        return;
    }

    KIRQL newIrql = 2;
    KIRQL prevIrql;
    KeRaiseIrql(newIrql, &prevIrql);
    if (!(KiIrqlFlags == 0 || (KiIrqlFlags & 0x1) != 0 || (prevIrql >= newIrql)))
    {
        const DWORD64 KRCB_OFFSET_SCHEDULER_ASSIST = 0x61B8;
        PBYTE pKPRCB = (PBYTE)__readgsqword(0x20);
        PVOID pSchedAssist = pKPRCB + KRCB_OFFSET_SCHEDULER_ASSIST;
        InterlockedOr64((long long*)pSchedAssist, 0x10000);
    }

    if (KiInSwapSingleProcess(Thread))
        return;

    KiFastReadyThread(Thread);
}
