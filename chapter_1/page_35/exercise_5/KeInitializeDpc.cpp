//nt!_KDPC
//+ 0x000 TargetInfoAsUlong : Uint4B
//+ 0x000 Type : UChar
//+ 0x001 Importance : UChar
//+ 0x002 Number : Uint2B
//+ 0x008 DpcListEntry : _SINGLE_LIST_ENTRY
//+ 0x010 ProcessorHistory : Uint8B
//+ 0x018 DeferredRoutine : Ptr64     void
//+ 0x020 DeferredContext : Ptr64 Void
//+ 0x028 SystemArgument1 : Ptr64 Void
//+ 0x030 SystemArgument2 : Ptr64 Void
//+ 0x038 DpcData : Ptr64 Void

// With help from https://www.geoffchappell.com/studies/windows/km/ntoskrnl/api/ke/dpcobj/kdpc.htm
typedef struct
{
    union {
        ULONG TargetInfoAsUlong;
        struct {
            UCHAR Type;
            UCHAR Importance;
            USHORT volatile Number;
            UCHAR Expedite;
        };
    };
    _SINGLE_LIST_ENTRY DpcListEntry;
    UINT64 ProcessorHistory;
    PVOID DeferredRoutine;
    PVOID DeferredContext;
    PVOID SystemArgument1;
    PVOID SystemArgument2;
    PVOID DpcData;
} _KDPC, *PRKDPC;

//nt!KeInitializeDpc:
//fffff802`8040b790 33c0 xor eax, eax
//fffff802`8040b792 c70113010000    mov     dword ptr[rcx], 113h
//fffff802`8040b798 48894138        mov     qword ptr[rcx + 38h], rax
//fffff802`8040b79c 48894110        mov     qword ptr[rcx + 10h], rax
//fffff802`8040b7a0 48895118        mov     qword ptr[rcx + 18h], rdx
//fffff802`8040b7a4 4c894120        mov     qword ptr[rcx + 20h], r8
//fffff802`8040b7a8 c3              ret

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
