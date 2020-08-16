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

// Thanks to https://www.vergiliusproject.com/kernels/x64/Windows%2010%20|%202016/2004%2020H1%20(May%202020%20Update)/_DISPATCHER_HEADER
struct _DISPATCHER_HEADER
{
    union
    {
        volatile LONG Lock;                                                 //0x0
        LONG LockNV;                                                        //0x0
        struct
        {
            UCHAR Type;                                                     //0x0
            UCHAR Signalling;                                               //0x1
            UCHAR Size;                                                     //0x2
            UCHAR Reserved1;                                                //0x3
        };
        struct
        {
            UCHAR TimerType;                                                //0x0
            union
            {
                UCHAR TimerControlFlags;                                    //0x1
                struct
                {
                    UCHAR Absolute : 1;                                       //0x1
                    UCHAR Wake : 1;                                           //0x1
                    UCHAR EncodedTolerableDelay : 6;                          //0x1
                };
            };
            UCHAR Hand;                                                     //0x2
            union
            {
                UCHAR TimerMiscFlags;                                       //0x3
                struct
                {
                    UCHAR Index : 6;                                          //0x3
                    UCHAR Inserted : 1;                                       //0x3
                    volatile UCHAR Expired : 1;                               //0x3
                };
            };
        };
        struct
        {
            UCHAR Timer2Type;                                               //0x0
            union
            {
                UCHAR Timer2Flags;                                          //0x1
                struct
                {
                    UCHAR Timer2Inserted : 1;                                 //0x1
                    UCHAR Timer2Expiring : 1;                                 //0x1
                    UCHAR Timer2CancelPending : 1;                            //0x1
                    UCHAR Timer2SetPending : 1;                               //0x1
                    UCHAR Timer2Running : 1;                                  //0x1
                    UCHAR Timer2Disabled : 1;                                 //0x1
                    UCHAR Timer2ReservedFlags : 2;                            //0x1
                };
            };
            UCHAR Timer2ComponentId;                                        //0x2
            UCHAR Timer2RelativeId;                                         //0x3
        };
        struct
        {
            UCHAR QueueType;                                                //0x0
            union
            {
                UCHAR QueueControlFlags;                                    //0x1
                struct
                {
                    UCHAR Abandoned : 1;                                      //0x1
                    UCHAR DisableIncrement : 1;                               //0x1
                    UCHAR QueueReservedControlFlags : 6;                      //0x1
                };
            };
            UCHAR QueueSize;                                                //0x2
            UCHAR QueueReserved;                                            //0x3
        };
        struct
        {
            UCHAR ThreadType;                                               //0x0
            UCHAR ThreadReserved;                                           //0x1
            union
            {
                UCHAR ThreadControlFlags;                                   //0x2
                struct
                {
                    UCHAR CycleProfiling : 1;                                 //0x2
                    UCHAR CounterProfiling : 1;                               //0x2
                    UCHAR GroupScheduling : 1;                                //0x2
                    UCHAR AffinitySet : 1;                                    //0x2
                    UCHAR Tagged : 1;                                         //0x2
                    UCHAR EnergyProfiling : 1;                                //0x2
                    UCHAR SchedulerAssist : 1;                                //0x2
                    UCHAR ThreadReservedControlFlags : 1;                     //0x2
                };
            };
            union
            {
                UCHAR DebugActive;                                          //0x3
                struct
                {
                    UCHAR ActiveDR7 : 1;                                      //0x3
                    UCHAR Instrumented : 1;                                   //0x3
                    UCHAR Minimal : 1;                                        //0x3
                    UCHAR Reserved4 : 2;                                      //0x3
                    UCHAR AltSyscall : 1;                                     //0x3
                    UCHAR UmsScheduled : 1;                                   //0x3
                    UCHAR UmsPrimary : 1;                                     //0x3
                };
            };
        };
        struct
        {
            UCHAR MutantType;                                               //0x0
            UCHAR MutantSize;                                               //0x1
            UCHAR DpcActive;                                                //0x2
            UCHAR MutantReserved;                                           //0x3
        };
    };
    LONG SignalState;                                                       //0x4
    struct _LIST_ENTRY WaitListHead;                                        //0x8
};

typedef struct _KQUEUE {
    _DISPATCHER_HEADER Header; //+0x000
    LIST_ENTRY EntryListHead; //+0x018
    ULONG CurrentCount; //+0x028
    ULONG MaximumCount; //+0x02C
    LIST_ENTRY ThreadListHead; //+0x030
} KQUEUE, * PKQUEUE, * RESTRICTED_POINTER PRKQUEUE;

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

