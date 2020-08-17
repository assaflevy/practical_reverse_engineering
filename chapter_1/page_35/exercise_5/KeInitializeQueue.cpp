#include "kstruct.h"

//fffff802`80536270 4053            push    rbx
//fffff802`80536272 4883ec20        sub     rsp, 20h
//fffff802`80536276 488bd9          mov     rbx, rcx
//fffff802`80536279 c60104          mov     byte ptr[rcx], 4
//fffff802`8053627c 33c9            xor ecx, ecx
//fffff802`8053627e 66c743010010    mov     word ptr[rbx + 1], 1000h
//fffff802`80536284 488d4308        lea     rax, [rbx + 8]
//fffff802`80536288 894b04          mov     dword ptr[rbx + 4], ecx
//fffff802`8053628b 48894008        mov     qword ptr[rax + 8], rax
//fffff802`8053628f 488900          mov     qword ptr[rax], rax
//fffff802`80536292 488d4318        lea     rax, [rbx + 18h]
//fffff802`80536296 48894008        mov     qword ptr[rax + 8], rax
//fffff802`8053629a 488900          mov     qword ptr[rax], rax
//fffff802`8053629d 488d4330        lea     rax, [rbx + 30h]
//fffff802`805362a1 48894008        mov     qword ptr[rax + 8], rax
//fffff802`805362a5 488900          mov     qword ptr[rax], rax
//fffff802`805362a8 894b28          mov     dword ptr[rbx + 28h], ecx
//fffff802`805362ab 85d2            test    edx, edx
//fffff802`805362ad 750c            jne     nt!KeInitializeQueue + 0x4b (fffff802`805362bb)  Branch
//
//nt!KeInitializeQueue + 0x3f:
//fffff802`805362af b9ffff0000      mov     ecx, 0FFFFh
//fffff802`805362b4 e8670d0000      call    nt!KeQueryActiveProcessorCountEx(fffff802`80537020)
//fffff802`805362b9 8bd0            mov     edx, eax
//
//nt!KeInitializeQueue + 0x4b:
//fffff802`805362bb 89532c          mov     dword ptr[rbx + 2Ch], edx
//fffff802`805362be 4883c420        add     rsp, 20h
//fffff802`805362c2 5b              pop     rbx
//fffff802`805362c3 c3              ret

VOID
KeInitializeQueue(
    PRKQUEUE Queue,
    ULONG    Count
)
{
    Queue->Header.QueueType = 4;
    Queue->Header.QueueControlFlags = 0x00;
    Queue->Header.QueueSize = 0x10;
    Queue->Header.SignalState = 0;
    InitializeListHead(Queue->Header.WaitListHead);
    InitializeListHead(Queue->EntryListHead);
    InitializeListHead(Queue->ThreadListHead);
    Queue->CurrentCount = 0;
    if (Count != 0)
    {
        Queue->MaximumCount = Count;
    }
    else
    {
        Queue->MaximumCount = KeQueryActiveProcessorCountEx(0xFFFF);
    }
}

