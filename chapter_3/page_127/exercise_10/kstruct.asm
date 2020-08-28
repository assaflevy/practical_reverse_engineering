nt!_KDPC
   +0x000 TargetInfoAsUlong : Uint4B
   +0x000 Type             : UChar
   +0x001 Importance       : UChar
   +0x002 Number           : Uint2B
   +0x008 DpcListEntry     : _SINGLE_LIST_ENTRY
   +0x010 ProcessorHistory : Uint8B
   +0x018 DeferredRoutine  : Ptr64     void 
   +0x020 DeferredContext  : Ptr64 Void
   +0x028 SystemArgument1  : Ptr64 Void
   +0x030 SystemArgument2  : Ptr64 Void
   +0x038 DpcData          : Ptr64 Void

nt!_KPCR
   +0x000 NtTib            : _NT_TIB
   +0x000 GdtBase          : Ptr64 _KGDTENTRY64
   +0x008 TssBase          : Ptr64 _KTSS64
   +0x010 UserRsp          : Uint8B
   +0x018 Self             : Ptr64 _KPCR
   +0x020 CurrentPrcb      : Ptr64 _KPRCB
   +0x028 LockArray        : Ptr64 _KSPIN_LOCK_QUEUE
   +0x030 Used_Self        : Ptr64 Void
   +0x038 IdtBase          : Ptr64 _KIDTENTRY64
   +0x040 Unused           : [2] Uint8B
   +0x050 Irql             : UChar
   +0x051 SecondLevelCacheAssociativity : UChar
   +0x052 ObsoleteNumber   : UChar
   +0x053 Fill0            : UChar
   +0x054 Unused0          : [3] Uint4B
   +0x060 MajorVersion     : Uint2B
   +0x062 MinorVersion     : Uint2B
   +0x064 StallScaleFactor : Uint4B
   +0x068 Unused1          : [3] Ptr64 Void
   +0x080 KernelReserved   : [15] Uint4B
   +0x0bc SecondLevelCacheSize : Uint4B
   +0x0c0 HalReserved      : [16] Uint4B
   +0x100 Unused2          : Uint4B
   +0x108 KdVersionBlock   : Ptr64 Void
   +0x110 Unused3          : Ptr64 Void
   +0x118 PcrAlign1        : [24] Uint4B
   +0x180 Prcb             : _KPRCB
   
nt!_KPRCB
   +0x000 MxCsr            : Uint4B
   +0x004 LegacyNumber     : UChar
   +0x005 ReservedMustBeZero : UChar
   +0x006 InterruptRequest : UChar
   +0x007 IdleHalt         : UChar
   +0x008 CurrentThread    : Ptr64 _KTHREAD
   +0x010 NextThread       : Ptr64 _KTHREAD
   +0x018 IdleThread       : Ptr64 _KTHREAD
   +0x020 NestingLevel     : UChar
   +0x021 ClockOwner       : UChar
   +0x022 PendingTickFlags : UChar
   +0x022 PendingTick      : Pos 0, 1 Bit
   +0x022 PendingBackupTick : Pos 1, 1 Bit
   +0x023 IdleState        : UChar
   +0x024 Number           : Uint4B
   +0x028 RspBase          : Uint8B
   +0x030 PrcbLock         : Uint8B
   +0x038 PriorityState    : Ptr64 Char
   +0x040 CpuType          : Char
   +0x041 CpuID            : Char
   +0x042 CpuStep          : Uint2B
   +0x042 CpuStepping      : UChar
   +0x043 CpuModel         : UChar
   +0x044 MHz              : Uint4B
   +0x048 HalReserved      : [8] Uint8B
   +0x088 MinorVersion     : Uint2B
   +0x08a MajorVersion     : Uint2B
   +0x08c BuildType        : UChar
   +0x08d CpuVendor        : UChar
   +0x08e CoresPerPhysicalProcessor : UChar
   +0x08f LogicalProcessorsPerCore : UChar
   +0x090 TscFrequency     : Uint8B
   +0x098 PrcbPad04        : [5] Uint8B
   +0x0c0 ParentNode       : Ptr64 _KNODE
   +0x0c8 GroupSetMember   : Uint8B
   +0x0d0 Group            : UChar
   +0x0d1 GroupIndex       : UChar
   +0x0d2 PrcbPad05        : [2] UChar
   +0x0d4 InitialApicId    : Uint4B
   +0x0d8 ScbOffset        : Uint4B
   +0x0dc ApicMask         : Uint4B
   +0x0e0 AcpiReserved     : Ptr64 Void
   +0x0e8 CFlushSize       : Uint4B
   +0x0ec PrcbFlags        : _KPRCBFLAG
   +0x0f0 TrappedSecurityDomain : Uint8B
   +0x0f8 BpbState         : UChar
   +0x0f8 BpbCpuIdle       : Pos 0, 1 Bit
   +0x0f8 BpbFlushRsbOnTrap : Pos 1, 1 Bit
   +0x0f8 BpbIbpbOnReturn  : Pos 2, 1 Bit
   +0x0f8 BpbIbpbOnTrap    : Pos 3, 1 Bit
   +0x0f8 BpbIbpbOnRetpolineExit : Pos 4, 1 Bit
   +0x0f8 BpbStateReserved : Pos 5, 3 Bits
   +0x0f9 BpbFeatures      : UChar
   +0x0f9 BpbClearOnIdle   : Pos 0, 1 Bit
   +0x0f9 BpbEnabled       : Pos 1, 1 Bit
   +0x0f9 BpbSmep          : Pos 2, 1 Bit
   +0x0f9 BpbFeaturesReserved : Pos 3, 5 Bits
   +0x0fa BpbCurrentSpecCtrl : UChar
   +0x0fb BpbKernelSpecCtrl : UChar
   +0x0fc BpbNmiSpecCtrl   : UChar
   +0x0fd BpbUserSpecCtrl  : UChar
   +0x0fe PairRegister     : Int2B
   +0x0f0 PrcbPad11        : [2] Uint8B
   +0x100 ProcessorState   : _KPROCESSOR_STATE
   +0x6c0 ExtendedSupervisorState : Ptr64 _XSAVE_AREA_HEADER
   +0x6c8 ProcessorSignature : Uint4B
   +0x6cc ProcessorFlags   : Uint4B
   +0x6d0 BpbRetpolineExitSpecCtrl : UChar
   +0x6d1 BpbTrappedRetpolineExitSpecCtrl : UChar
   +0x6d2 BpbTrappedBpbState : UChar
   +0x6d2 BpbTrappedCpuIdle : Pos 0, 1 Bit
   +0x6d2 BpbTrappedFlushRsbOnTrap : Pos 1, 1 Bit
   +0x6d2 BpbTrappedIbpbOnReturn : Pos 2, 1 Bit
   +0x6d2 BpbTrappedIbpbOnTrap : Pos 3, 1 Bit
   +0x6d2 BpbTrappedIbpbOnRetpolineExit : Pos 4, 1 Bit
   +0x6d2 BpbtrappedBpbStateReserved : Pos 5, 3 Bits
   +0x6d3 BpbRetpolineState : UChar
   +0x6d3 BpbRunningNonRetpolineCode : Pos 0, 1 Bit
   +0x6d3 BpbIndirectCallsSafe : Pos 1, 1 Bit
   +0x6d3 BpbRetpolineEnabled : Pos 2, 1 Bit
   +0x6d3 BpbRetpolineStateReserved : Pos 3, 5 Bits
   +0x6d4 PrcbPad12b       : Uint4B
   +0x6d0 PrcbPad12a       : Uint8B
   +0x6d8 PrcbPad12        : [3] Uint8B
   +0x6f0 LockQueue        : [17] _KSPIN_LOCK_QUEUE
   +0x800 PPLookasideList  : [16] _PP_LOOKASIDE_LIST
   +0x900 PPNxPagedLookasideList : [32] _GENERAL_LOOKASIDE_POOL
   +0x1500 PPNPagedLookasideList : [32] _GENERAL_LOOKASIDE_POOL
   +0x2100 PPPagedLookasideList : [32] _GENERAL_LOOKASIDE_POOL
   +0x2d00 MsrIa32TsxCtrl   : Uint8B
   +0x2d08 DeferredReadyListHead : _SINGLE_LIST_ENTRY
   +0x2d10 MmPageFaultCount : Int4B
   +0x2d14 MmCopyOnWriteCount : Int4B
   +0x2d18 MmTransitionCount : Int4B
   +0x2d1c MmDemandZeroCount : Int4B
   +0x2d20 MmPageReadCount  : Int4B
   +0x2d24 MmPageReadIoCount : Int4B
   +0x2d28 MmDirtyPagesWriteCount : Int4B
   +0x2d2c MmDirtyWriteIoCount : Int4B
   +0x2d30 MmMappedPagesWriteCount : Int4B
   +0x2d34 MmMappedWriteIoCount : Int4B
   +0x2d38 KeSystemCalls    : Uint4B
   +0x2d3c KeContextSwitches : Uint4B
   +0x2d40 PrcbPad40        : Uint4B
   +0x2d44 CcFastReadNoWait : Uint4B
   +0x2d48 CcFastReadWait   : Uint4B
   +0x2d4c CcFastReadNotPossible : Uint4B
   +0x2d50 CcCopyReadNoWait : Uint4B
   +0x2d54 CcCopyReadWait   : Uint4B
   +0x2d58 CcCopyReadNoWaitMiss : Uint4B
   +0x2d5c IoReadOperationCount : Int4B
   +0x2d60 IoWriteOperationCount : Int4B
   +0x2d64 IoOtherOperationCount : Int4B
   +0x2d68 IoReadTransferCount : _LARGE_INTEGER
   +0x2d70 IoWriteTransferCount : _LARGE_INTEGER
   +0x2d78 IoOtherTransferCount : _LARGE_INTEGER
   +0x2d80 PacketBarrier    : Int4B
   +0x2d84 TargetCount      : Int4B
   +0x2d88 IpiFrozen        : Uint4B
   +0x2d8c PrcbPad30        : Uint4B
   +0x2d90 IsrDpcStats      : Ptr64 Void
   +0x2d98 DeviceInterrupts : Uint4B
   +0x2d9c LookasideIrpFloat : Int4B
   +0x2da0 InterruptLastCount : Uint4B
   +0x2da4 InterruptRate    : Uint4B
   +0x2da8 PrcbPad31        : Uint8B
   +0x2db0 PairPrcb         : Ptr64 _KPRCB
   +0x2db8 StaticAffinity   : _KSTATIC_AFFINITY_BLOCK
   +0x3058 PrcbPad35        : [5] Uint8B
   +0x3080 InterruptObjectPool : _SLIST_HEADER
   +0x3090 DpcRuntimeHistoryHashTable : Ptr64 _RTL_HASH_TABLE
   +0x3098 DpcRuntimeHistoryHashTableCleanupDpc : Ptr64 _KDPC
   +0x30a0 CurrentDpcRoutine : Ptr64     void 
   +0x30a8 CurrentDpcRuntimeHistoryCached : Uint8B
   +0x30b0 CurrentDpcStartTime : Uint8B
   +0x30b8 PrcbPad41        : [1] Uint8B
   +0x30c0 DpcData          : [2] _KDPC_DATA
   +0x3110 DpcStack         : Ptr64 Void
   +0x3118 MaximumDpcQueueDepth : Int4B
   +0x311c DpcRequestRate   : Uint4B
   +0x3120 MinimumDpcRate   : Uint4B
   +0x3124 DpcLastCount     : Uint4B
   +0x3128 ThreadDpcEnable  : UChar
   +0x3129 QuantumEnd       : UChar
   +0x312a DpcRoutineActive : UChar
   +0x312b IdleSchedule     : UChar
   +0x312c DpcRequestSummary : Int4B
   +0x312c DpcRequestSlot   : [2] Int2B
   +0x312c NormalDpcState   : Int2B
   +0x312e ThreadDpcState   : Int2B
   +0x312c DpcNormalProcessingActive : Pos 0, 1 Bit
   +0x312c DpcNormalProcessingRequested : Pos 1, 1 Bit
   +0x312c DpcNormalThreadSignal : Pos 2, 1 Bit
   +0x312c DpcNormalTimerExpiration : Pos 3, 1 Bit
   +0x312c DpcNormalDpcPresent : Pos 4, 1 Bit
   +0x312c DpcNormalLocalInterrupt : Pos 5, 1 Bit
   +0x312c DpcNormalSpare   : Pos 6, 10 Bits
   +0x312c DpcThreadActive  : Pos 16, 1 Bit
   +0x312c DpcThreadRequested : Pos 17, 1 Bit
   +0x312c DpcThreadSpare   : Pos 18, 14 Bits
   +0x3130 PrcbPad93        : Uint4B
   +0x3134 LastTick         : Uint4B
   +0x3138 ClockInterrupts  : Uint4B
   +0x313c ReadyScanTick    : Uint4B
   +0x3140 InterruptObject  : [256] Ptr64 Void
   +0x3940 TimerTable       : _KTIMER_TABLE
   +0x7b58 PrcbPad92        : [10] Uint4B
   +0x7b80 DpcGate          : _KGATE
   +0x7b98 PrcbPad52        : Ptr64 Void
   +0x7ba0 CallDpc          : _KDPC
   +0x7be0 ClockKeepAlive   : Int4B
   +0x7be4 PrcbPad60        : [2] UChar
   +0x7be6 NmiActive        : UChar
   +0x7be7 MceActive        : UChar
   +0x7be6 CombinedNmiMceActive : Uint2B
   +0x7be8 DpcWatchdogPeriod : Int4B
   +0x7bec DpcWatchdogCount : Int4B
   +0x7bf0 KeSpinLockOrdering : Int4B
   +0x7bf4 DpcWatchdogProfileCumulativeDpcThreshold : Uint4B
   +0x7bf8 CachedPtes       : Ptr64 Void
   +0x7c00 WaitListHead     : _LIST_ENTRY
   +0x7c10 WaitLock         : Uint8B
   +0x7c18 ReadySummary     : Uint4B
   +0x7c1c AffinitizedSelectionMask : Int4B
   +0x7c20 QueueIndex       : Uint4B
   +0x7c24 PrcbPad75        : [2] Uint4B
   +0x7c2c DpcWatchdogSequenceNumber : Uint4B
   +0x7c30 TimerExpirationDpc : _KDPC
   +0x7c70 ScbQueue         : _RTL_RB_TREE
   +0x7c80 DispatcherReadyListHead : [32] _LIST_ENTRY
   +0x7e80 InterruptCount   : Uint4B
   +0x7e84 KernelTime       : Uint4B
   +0x7e88 UserTime         : Uint4B
   +0x7e8c DpcTime          : Uint4B
   +0x7e90 InterruptTime    : Uint4B
   +0x7e94 AdjustDpcThreshold : Uint4B
   +0x7e98 DebuggerSavedIRQL : UChar
   +0x7e99 GroupSchedulingOverQuota : UChar
   +0x7e9a DeepSleep        : UChar
   +0x7e9b PrcbPad80        : UChar
   +0x7e9c DpcTimeCount     : Uint4B
   +0x7ea0 DpcTimeLimit     : Uint4B
   +0x7ea4 PeriodicCount    : Uint4B
   +0x7ea8 PeriodicBias     : Uint4B
   +0x7eac AvailableTime    : Uint4B
   +0x7eb0 KeExceptionDispatchCount : Uint4B
   +0x7eb4 ReadyThreadCount : Uint4B
   +0x7eb8 ReadyQueueExpectedRunTime : Uint8B
   +0x7ec0 StartCycles      : Uint8B
   +0x7ec8 TaggedCyclesStart : Uint8B
   +0x7ed0 TaggedCycles     : [3] Uint8B
   +0x7ee8 AffinitizedCycles : Uint8B
   +0x7ef0 ImportantCycles  : Uint8B
   +0x7ef8 UnimportantCycles : Uint8B
   +0x7f00 DpcWatchdogProfileSingleDpcThreshold : Uint4B
   +0x7f04 MmSpinLockOrdering : Int4B
   +0x7f08 CachedStack      : Ptr64 Void
   +0x7f10 PageColor        : Uint4B
   +0x7f14 NodeColor        : Uint4B
   +0x7f18 NodeShiftedColor : Uint4B
   +0x7f1c SecondaryColorMask : Uint4B
   +0x7f20 PrcbPad81        : [6] UChar
   +0x7f26 ExceptionStackActive : UChar
   +0x7f27 TbFlushListActive : UChar
   +0x7f28 ExceptionStack   : Ptr64 Void
   +0x7f30 PrcbPad82        : [1] Uint8B
   +0x7f38 CycleTime        : Uint8B
   +0x7f40 Cycles           : [4] [2] Uint8B
   +0x7f80 CcFastMdlReadNoWait : Uint4B
   +0x7f84 CcFastMdlReadWait : Uint4B
   +0x7f88 CcFastMdlReadNotPossible : Uint4B
   +0x7f8c CcMapDataNoWait  : Uint4B
   +0x7f90 CcMapDataWait    : Uint4B
   +0x7f94 CcPinMappedDataCount : Uint4B
   +0x7f98 CcPinReadNoWait  : Uint4B
   +0x7f9c CcPinReadWait    : Uint4B
   +0x7fa0 CcMdlReadNoWait  : Uint4B
   +0x7fa4 CcMdlReadWait    : Uint4B
   +0x7fa8 CcLazyWriteHotSpots : Uint4B
   +0x7fac CcLazyWriteIos   : Uint4B
   +0x7fb0 CcLazyWritePages : Uint4B
   +0x7fb4 CcDataFlushes    : Uint4B
   +0x7fb8 CcDataPages      : Uint4B
   +0x7fbc CcLostDelayedWrites : Uint4B
   +0x7fc0 CcFastReadResourceMiss : Uint4B
   +0x7fc4 CcCopyReadWaitMiss : Uint4B
   +0x7fc8 CcFastMdlReadResourceMiss : Uint4B
   +0x7fcc CcMapDataNoWaitMiss : Uint4B
   +0x7fd0 CcMapDataWaitMiss : Uint4B
   +0x7fd4 CcPinReadNoWaitMiss : Uint4B
   +0x7fd8 CcPinReadWaitMiss : Uint4B
   +0x7fdc CcMdlReadNoWaitMiss : Uint4B
   +0x7fe0 CcMdlReadWaitMiss : Uint4B
   +0x7fe4 CcReadAheadIos   : Uint4B
   +0x7fe8 MmCacheTransitionCount : Int4B
   +0x7fec MmCacheReadCount : Int4B
   +0x7ff0 MmCacheIoCount   : Int4B
   +0x7ff4 PrcbPad91        : Uint4B
   +0x7ff8 MmInternal       : Ptr64 Void
   +0x8000 PowerState       : _PROCESSOR_POWER_STATE
   +0x8200 HyperPte         : Ptr64 Void
   +0x8208 ScbList          : _LIST_ENTRY
   +0x8218 ForceIdleDpc     : _KDPC
   +0x8258 DpcWatchdogDpc   : _KDPC
   +0x8298 DpcWatchdogTimer : _KTIMER
   +0x82d8 Cache            : [5] _CACHE_DESCRIPTOR
   +0x8314 CacheCount       : Uint4B
   +0x8318 CachedCommit     : Uint4B
   +0x831c CachedResidentAvailable : Uint4B
   +0x8320 WheaInfo         : Ptr64 Void
   +0x8328 EtwSupport       : Ptr64 Void
   +0x8330 ExSaPageArray    : Ptr64 Void
   +0x8338 KeAlignmentFixupCount : Uint4B
   +0x833c PrcbPad95        : Uint4B
   +0x8340 HypercallPageList : _SLIST_HEADER
   +0x8350 StatisticsPage   : Ptr64 Uint8B
   +0x8358 GenerationTarget : Uint8B
   +0x8360 PrcbPad85        : [4] Uint8B
   +0x8380 HypercallCachedPages : Ptr64 Void
   +0x8388 VirtualApicAssist : Ptr64 Void
   +0x8390 PackageProcessorSet : _KAFFINITY_EX
   +0x8438 PackageId        : Uint4B
   +0x843c PrcbPad86        : Uint4B
   +0x8440 SharedReadyQueueMask : Uint8B
   +0x8448 SharedReadyQueue : Ptr64 _KSHARED_READY_QUEUE
   +0x8450 SharedQueueScanOwner : Uint4B
   +0x8454 ScanSiblingIndex : Uint4B
   +0x8458 CoreProcessorSet : Uint8B
   +0x8460 ScanSiblingMask  : Uint8B
   +0x8468 LLCMask          : Uint8B
   +0x8470 CacheProcessorMask : [5] Uint8B
   +0x8498 ProcessorProfileControlArea : Ptr64 _PROCESSOR_PROFILE_CONTROL_AREA
   +0x84a0 ProfileEventIndexAddress : Ptr64 Void
   +0x84a8 DpcWatchdogProfile : Ptr64 Ptr64 Void
   +0x84b0 DpcWatchdogProfileCurrentEmptyCapture : Ptr64 Ptr64 Void
   +0x84b8 SchedulerAssist  : Ptr64 Void
   +0x84c0 SynchCounters    : _SYNCH_COUNTERS
   +0x8578 PrcbPad94        : Uint8B
   +0x8580 FsCounters       : _FILESYSTEM_DISK_COUNTERS
   +0x8590 VendorString     : [13] UChar
   +0x859d PrcbPad100       : [3] UChar
   +0x85a0 FeatureBits      : Uint8B
   +0x85a8 UpdateSignature  : _LARGE_INTEGER
   +0x85b0 PteBitCache      : Uint8B
   +0x85b8 PteBitOffset     : Uint4B
   +0x85bc PrcbPad105       : Uint4B
   +0x85c0 Context          : Ptr64 _CONTEXT
   +0x85c8 ContextFlagsInit : Uint4B
   +0x85cc PrcbPad115       : Uint4B
   +0x85d0 ExtendedState    : Ptr64 _XSAVE_AREA
   +0x85d8 IsrStack         : Ptr64 Void
   +0x85e0 EntropyTimingState : _KENTROPY_TIMING_STATE
   +0x8730 PrcbPad110       : Uint8B
   +0x8738 StibpPairingTrace : <anonymous-tag>
   +0x8770 AbSelfIoBoostsList : _SINGLE_LIST_ENTRY
   +0x8778 AbPropagateBoostsList : _SINGLE_LIST_ENTRY
   +0x8780 AbDpc            : _KDPC
   +0x87c0 IoIrpStackProfilerCurrent : _IOP_IRP_STACK_PROFILER
   +0x8814 IoIrpStackProfilerPrevious : _IOP_IRP_STACK_PROFILER
   +0x8868 SecureFault      : _KSECURE_FAULT_INFORMATION
   +0x8878 PrcbPad120       : Uint8B
   +0x8880 LocalSharedReadyQueue : _KSHARED_READY_QUEUE
   +0x8af0 PrcbPad125       : [2] Uint8B
   +0x8b00 TimerExpirationTraceCount : Uint4B
   +0x8b04 PrcbPad127       : Uint4B
   +0x8b08 TimerExpirationTrace : [16] _KTIMER_EXPIRATION_TRACE
   +0x8c08 PrcbPad128       : [7] Uint8B
   +0x8c40 Mailbox          : Ptr64 _REQUEST_MAILBOX
   +0x8c48 PrcbPad130       : [7] Uint8B
   +0x8c80 McheckContext    : [2] _MACHINE_CHECK_CONTEXT
   +0x8d20 PrcbPad134       : [4] Uint8B
   +0x8d40 SelfmapLockHandle : [4] _KLOCK_QUEUE_HANDLE
   +0x8da0 PrcbPad134a      : [4] Uint8B
   +0x8dc0 PrcbPad138       : [128] UChar
   +0x8e40 PrcbPad138a      : [64] UChar
   +0x8e80 KernelDirectoryTableBase : Uint8B
   +0x8e88 RspBaseShadow    : Uint8B
   +0x8e90 UserRspShadow    : Uint8B
   +0x8e98 ShadowFlags      : Uint4B
   +0x8e9c PrcbPad138b      : Uint4B
   +0x8ea0 PrcbPad138c      : Uint8B
   +0x8ea8 PrcbPad138d      : Uint2B
   +0x8eaa VerwSelector     : Uint2B
   +0x8eac DbgMceNestingLevel : Uint4B
   +0x8eb0 DbgMceFlags      : Uint4B
   +0x8eb4 PrcbPad139b      : Uint4B
   +0x8eb8 PrcbPad140       : [505] Uint8B
   +0x9e80 PrcbPad140a      : [8] Uint8B
   +0x9ec0 PrcbPad141       : [504] Uint8B
   +0xae80 PrcbPad141a      : [64] UChar
   +0xaec0 RequestMailbox   : [1] _REQUEST_MAILBOX
   
nt!_KDPC_DATA
   +0x000 DpcList          : _KDPC_LIST
   +0x010 DpcLock          : Uint8B
   +0x018 DpcQueueDepth    : Int4B
   +0x01c DpcCount         : Uint4B
   +0x020 ActiveDpc        : Ptr64 _KDPC
   
 nt!_KDPC_LIST
   +0x000 ListHead         : _SINGLE_LIST_ENTRY
   +0x008 LastEntry        : Ptr64 _SINGLE_LIST_ENTRY
   
nt!_SINGLE_LIST_ENTRY
   +0x000 Next             : Ptr64 _SINGLE_LIST_ENTRY
