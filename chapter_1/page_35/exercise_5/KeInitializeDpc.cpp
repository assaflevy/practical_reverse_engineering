#include "kstruct.h"

//fffff802`8040b790 33c0 xor eax, eax
//fffff802`8040b792 c70113010000    mov     dword ptr[rcx], 113h
//fffff802`8040b798 48894138        mov     qword ptr[rcx + 38h], rax
//fffff802`8040b79c 48894110        mov     qword ptr[rcx + 10h], rax
//fffff802`8040b7a0 48895118        mov     qword ptr[rcx + 18h], rdx
//fffff802`8040b7a4 4c894120        mov     qword ptr[rcx + 20h], r8
//fffff802`8040b7a8 c3              ret

// With help from https://www.geoffchappell.com/studies/windows/km/ntoskrnl/api/ke/dpcobj/kdpc.htm

VOID
NTAPI
KeInitializeDpc(
    IN PRKDPC Dpc,
    IN PKDEFERRED_ROUTINE DeferredRoutine,
    IN PVOID DeferredContext)
{
    Dpc->TargetInfoAsUlong = 0x113;
    Dpc->DpcData = 0;
    Dpc->ProcessorHistory = 0;
    Dpc->DeferredRoutine = DeferredRoutine;
    Dpc->DeferredContext = DeferredContext;
}
