//nt!KeInitializeApc:
//fffff802`804c7a70 c60112          mov     byte ptr[rcx], 12h
//fffff802`804c7a73 4c8bd1          mov     r10, rcx
//fffff802`804c7a76 c6410258        mov     byte ptr[rcx + 2], 58h
//fffff802`804c7a7a 4183f802        cmp     r8d, 2
//fffff802`804c7a7e 7443            je      nt!KeInitializeApc + 0x53 (fffff802`804c7ac3)  Branch
//
//nt!KeInitializeApc + 0x10:
//fffff802`804c7a80 488b442428      mov     rax, qword ptr[rsp + 28h]
//fffff802`804c7a85 44884150        mov     byte ptr[rcx + 50h], r8b
//fffff802`804c7a89 48894128        mov     qword ptr[rcx + 28h], rax
//fffff802`804c7a8d 48895108        mov     qword ptr[rcx + 8], rdx
//fffff802`804c7a91 488b542430      mov     rdx, qword ptr[rsp + 30h]
//fffff802`804c7a96 48895130        mov     qword ptr[rcx + 30h], rdx
//fffff802`804c7a9a 488bc2          mov     rax, rdx
//fffff802`804c7a9d 48f7d8          neg     rax
//fffff802`804c7aa0 4c894920        mov     qword ptr[rcx + 20h], r9
//fffff802`804c7aa4 481bc9          sbb     rcx, rcx
//fffff802`804c7aa7 48234c2440 and rcx, qword ptr[rsp + 40h]
//fffff802`804c7aac 48f7da          neg     rdx
//fffff802`804c7aaf 1ac0            sbb     al, al
//fffff802`804c7ab1 22442438 and al, byte ptr[rsp + 38h]
//fffff802`804c7ab5 41884251        mov     byte ptr[r10 + 51h], al
//fffff802`804c7ab9 49894a38        mov     qword ptr[r10 + 38h], rcx
//fffff802`804c7abd 41c6425200      mov     byte ptr[r10 + 52h], 0
//fffff802`804c7ac2 c3              ret
//
//nt!KeInitializeApc + 0x53:
//fffff802`804c7ac3 448a824a020000  mov     r8b, byte ptr[rdx + 24Ah]
//fffff802`804c7aca ebb4            jmp     nt!KeInitializeApc + 0x10 (fffff802`804c7a80)  Branch

typedef struct _KAPC
{
    UCHAR Type;
    UCHAR SpareByte0;
    UCHAR Size;
    UCHAR SpareByte1;
    ULONG SpareLong0;
    PKTHREAD Thread;
    LIST_ENTRY ApcListEntry;
    PVOID KernelRoutine;
    PVOID RundownRoutine;
    PVOID NormalRoutine;
    PVOID NormalContext;
    PVOID SystemArgument1;
    PVOID SystemArgument2;
    CHAR ApcStateIndex;
    CHAR ApcMode;
    UCHAR Inserted;
} *PRKAPC;

VOID
NTAPI
KeInitializeApc(
    IN  PRKAPC Apc,
    IN  PRKTHREAD Thread,
    IN  KAPC_ENVIRONMENT Environment,
    IN  PKKERNEL_ROUTINE KernelRoutine,
    IN  PKRUNDOWN_ROUTINE RundownRoutine OPTIONAL,
    IN  PKNORMAL_ROUTINE NormalRoutine OPTIONAL,
    IN  KPROCESSOR_MODE ApcMode OPTIONAL,
    IN  PVOID NormalContext OPTIONAL
)
{
    Apc->Type = 0x12;
    Apc->Size = 0x58;
    if ((ULONG)Environment == 2)
    {
        Environment = Thread->ApcStateIndex;
    }

    Apc->ApcStateIndex = Environment;
    Apc->RundownRoutine = RundownRoutine;
    Apc->Thread = Thread;
    Apc->NormalRoutine = NormalRoutine;
    Apc->KernelRoutine = KernelRoutine;
    // Really cool branchless programming in this part's assembly:
    //fffff802`804c7a9a 488bc2           mov     rax, rdx                     ; 
    //fffff802`804c7a9d 48f7d8           neg     rax                          ; rax = -rdx
    //fffff802`804c7aa4 481bc9           sbb     rcx, rcx                     ; rcx = 0 if 
    //fffff802`804c7aa7 48234c2440 and rcx, qword ptr[rsp + 40h]                ; rsp+40 is NormalContext parameters
    //fffff802`804c7aac 48f7da           neg     rdx
    //fffff802`804c7aaf 1ac0             sbb     al, al
    //fffff802`804c7ab1 22442438 and al, byte ptr[rsp + 38h]
    //fffff802`804c7ab5 41884251         mov     byte ptr[r10 + 51h], al
    //fffff802`804c7ab9 49894a38         mov     qword ptr[r10 + 38h], rcx
    // And see this great explanation: https://stackoverflow.com/a/41038556/298403
    if (NormalRoutine != nullptr)
    {
        Apc->NormalContext = NormalContext;
        Apc->ApcMode = ApcMode;
    }
    else
    {
        Apc->NormalContext = 0;
        Apc->ApcMode = 0;
    }
    Apc->Inserted = 0;
}

