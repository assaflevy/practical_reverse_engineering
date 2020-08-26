nt!NtQuerySystemInformation:
fffff800`7fdfba10 4053            push    rbx
fffff800`7fdfba12 4883ec30        sub     rsp,30h
fffff800`7fdfba16 4533d2          xor     r10d,r10d
fffff800`7fdfba19 458bd8          mov     r11d,r8d
fffff800`7fdfba1c 664489542440    mov     word ptr [rsp+40h],r10w
fffff800`7fdfba22 488bda          mov     rbx,rdx
fffff800`7fdfba25 83f94a          cmp     ecx,4Ah
fffff800`7fdfba28 7c24            jl      nt!NtQuerySystemInformation+0x3e (fffff800`7fdfba4e)  Branch

nt!NtQuerySystemInformation+0x1a:
fffff800`7fdfba2a 83f953          cmp     ecx,53h
fffff800`7fdfba2d 7d1f            jge     nt!NtQuerySystemInformation+0x3e (fffff800`7fdfba4e)  Branch

nt!NtQuerySystemInformation+0x1f:
fffff800`7fdfba2f 458bc2          mov     r8d,r10d
fffff800`7fdfba32 4c894c2428      mov     qword ptr [rsp+28h],r9
fffff800`7fdfba37 498bd2          mov     rdx,r10
fffff800`7fdfba3a 4c8bcb          mov     r9,rbx
fffff800`7fdfba3d 44895c2420      mov     dword ptr [rsp+20h],r11d
fffff800`7fdfba42 e849010000      call    nt!ExpQuerySystemInformation (fffff800`7fdfbb90)
fffff800`7fdfba47 4883c430        add     rsp,30h
fffff800`7fdfba4b 5b              pop     rbx
fffff800`7fdfba4c c3              ret

nt!NtQuerySystemInformation+0x3e:
fffff800`7fdfba4e 8d41f8          lea     eax,[rcx-8]
fffff800`7fdfba51 3dcb000000      cmp     eax,0CBh
fffff800`7fdfba56 77d7            ja      nt!NtQuerySystemInformation+0x1f (fffff800`7fdfba2f)  Branch

nt!NtQuerySystemInformation+0x48:
fffff800`7fdfba58 4c8d05a145a0ff  lea     r8,[nt!PopNotifyWork <PERF> (nt+0x0) (fffff800`7f800000)]
fffff800`7fdfba5f 4898            cdqe
fffff800`7fdfba61 410fb68400b0ba5f00 movzx eax,byte ptr [r8+rax+5FBAB0h]
fffff800`7fdfba6a 418b9480a0ba5f00 mov     edx,dword ptr [r8+rax*4+5FBAA0h]
fffff800`7fdfba72 4903d0          add     rdx,r8
fffff800`7fdfba75 ffe2            jmp     rdx
