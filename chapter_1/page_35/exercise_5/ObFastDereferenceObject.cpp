//nt!ObFastDereferenceObject:
//fffff802`8049de50 4883ec28        sub     rsp, 28h
//fffff802`8049de54 4c8bca          mov     r9, rdx
//fffff802`8049de57 0f0d09          prefetchw[rcx]
//fffff802`8049de5a 488b01          mov     rax, qword ptr[rcx]
//fffff802`8049de5d 4c8bc0          mov     r8, rax
//fffff802`8049de60 4c33c2 xor r8, rdx
//fffff802`8049de63 4983f80f        cmp     r8, 0Fh
//fffff802`8049de67 7310            jae     nt!ObFastDereferenceObject + 0x29 (fffff802`8049de79)  Branch
//
//    nt!ObFastDereferenceObject + 0x19:
//fffff802`8049de69 4c8d4001        lea     r8, [rax + 1]
//fffff802`8049de6d f04c0fb101      lock cmpxchg qword ptr[rcx], r8
//fffff802`8049de72 750f            jne     nt!ObFastDereferenceObject + 0x33 (fffff802`8049de83)  Branch
//
//    nt!ObFastDereferenceObject + 0x24:
//fffff802`8049de74 4883c428        add     rsp, 28h
//fffff802`8049de78 c3              ret
//
//nt!ObFastDereferenceObject + 0x29:
//fffff802`8049de79 498bc9          mov     rcx, r9
//fffff802`8049de7c e8ff300000      call    nt!ObfDereferenceObject(fffff802`804a0f80)
//    fffff802`8049de81 ebf1            jmp     nt!ObFastDereferenceObject + 0x24 (fffff802`8049de74)  Branch
//
//        nt!ObFastDereferenceObject + 0x33:
//fffff802`8049de83 488bd0          mov     rdx, rax
//fffff802`8049de86 4933d1 xor rdx, r9
//fffff802`8049de89 4883fa0f        cmp     rdx, 0Fh
//fffff802`8049de8d 72da            jb      nt!ObFastDereferenceObject + 0x19 (fffff802`8049de69)  Branch
//
//    nt!ObFastDereferenceObject + 0x3f:
//fffff802`8049de8f ebe8            jmp     nt!ObFastDereferenceObject + 0x29 (fffff802`8049de79)  Branch

// Regarding "explain its calling convention", I'll assume that it's a __fastcall() in 32-bits.
// Since I'm looking at x64 there's nothing inordinary with the function's calling convention.
VOID
NTAPI
ObFastDereferenceObject(
    PDWORD64 pRefCount,
    _DEVICE_OBJECT* object
)
{
    // r9 = rdx
    _m_prefetchw(pRefCount);
    DWORD64 refCount = *pRefCount;
    while ((refCount ^ (DWORD64)object) < 15)
    {
        DWORD64 initialRefCount = InterlockedCompareExchange64((long long*)pRefCount, refCount + 1, refCount);
        if (initialRefCount == refCount) // The exchange has occurred as the ref count wasn't changed while `lock compxchg` was executing.
        {
            return;
        }
        refCount = initialRefCount;
    }
    ObfDereferenceObject(object);
    return;
}
