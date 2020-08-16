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

