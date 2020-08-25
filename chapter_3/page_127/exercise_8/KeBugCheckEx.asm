0: kd> uf KeBugCheckEx
nt!KeBugCheckEx:
fffff802`753ddf40 48894c2408      mov     qword ptr [rsp+8],rcx
fffff802`753ddf45 4889542410      mov     qword ptr [rsp+10h],rdx
fffff802`753ddf4a 4c89442418      mov     qword ptr [rsp+18h],r8
fffff802`753ddf4f 4c894c2420      mov     qword ptr [rsp+20h],r9
fffff802`753ddf54 9c              pushfq
fffff802`753ddf55 4883ec30        sub     rsp,30h
fffff802`753ddf59 fa              cli
fffff802`753ddf5a 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff802`753ddf63 488b89c0850000  mov     rcx,qword ptr [rcx+85C0h]
fffff802`753ddf6a e811800000      call    nt!RtlCaptureContext (fffff802`753e5f80)
fffff802`753ddf6f 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff802`753ddf78 4881c100010000  add     rcx,100h
fffff802`753ddf7f e80c030000      call    nt!KiSaveProcessorControlState (fffff802`753de290)
fffff802`753ddf84 654c8b142520000000 mov   r10,qword ptr gs:[20h]
fffff802`753ddf8d 4d8b92c0850000  mov     r10,qword ptr [r10+85C0h]
fffff802`753ddf94 488b442440      mov     rax,qword ptr [rsp+40h]
fffff802`753ddf99 49898280000000  mov     qword ptr [r10+80h],rax
fffff802`753ddfa0 488b442430      mov     rax,qword ptr [rsp+30h]
fffff802`753ddfa5 49894244        mov     qword ptr [r10+44h],rax
fffff802`753ddfa9 488d0579ffffff  lea     rax,[nt!KiBugCheckReturn+0x5 (fffff802`753ddf29)]
fffff802`753ddfb0 483b442438      cmp     rax,qword ptr [rsp+38h]
fffff802`753ddfb5 750e            jne     nt!KeBugCheckEx+0x85 (fffff802`753ddfc5)  Branch

nt!KeBugCheckEx+0x77:
fffff802`753ddfb7 4c8d442468      lea     r8,[rsp+68h]
fffff802`753ddfbc 4c8d0d5dffffff  lea     r9,[nt!KeBugCheck (fffff802`753ddf20)]
fffff802`753ddfc3 eb0c            jmp     nt!KeBugCheckEx+0x91 (fffff802`753ddfd1)  Branch

nt!KeBugCheckEx+0x85:
fffff802`753ddfc5 4c8d442438      lea     r8,[rsp+38h]
fffff802`753ddfca 4c8d0d6fffffff  lea     r9,[nt!KeBugCheckEx (fffff802`753ddf40)]

nt!KeBugCheckEx+0x91:
fffff802`753ddfd1 4d898298000000  mov     qword ptr [r10+98h],r8
fffff802`753ddfd8 4d898af8000000  mov     qword ptr [r10+0F8h],r9
fffff802`753ddfdf 440f20c0        mov     rax,cr8
fffff802`753ddfe3 6588042518800000 mov     byte ptr gs:[8018h],al
fffff802`753ddfeb 3c02            cmp     al,2
fffff802`753ddfed 7d09            jge     nt!KeBugCheckEx+0xb8 (fffff802`753ddff8)  Branch

nt!KeBugCheckEx+0xaf:
fffff802`753ddfef b902000000      mov     ecx,2
fffff802`753ddff4 440f22c1        mov     cr8,rcx

nt!KeBugCheckEx+0xb8:
fffff802`753ddff8 488b442430      mov     rax,qword ptr [rsp+30h]
fffff802`753ddffd 482500020000    and     rax,200h
fffff802`753de003 7401            je      nt!KeBugCheckEx+0xc6 (fffff802`753de006)  Branch

nt!KeBugCheckEx+0xc5:
fffff802`753de005 fb              sti

nt!KeBugCheckEx+0xc6:
fffff802`753de006 f0ff05db338500  lock inc dword ptr [nt!KiHardwareTrigger (fffff802`75c313e8)]
fffff802`753de00d 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff802`753de012 48c744242800000000 mov   qword ptr [rsp+28h],0
fffff802`753de01b 488d0507ffffff  lea     rax,[nt!KiBugCheckReturn+0x5 (fffff802`753ddf29)]
fffff802`753de022 483b442438      cmp     rax,qword ptr [rsp+38h]
fffff802`753de027 741f            je      nt!KeBugCheckEx+0x108 (fffff802`753de048)  Branch

nt!KeBugCheckEx+0xe9:
fffff802`753de029 488b442460      mov     rax,qword ptr [rsp+60h]
fffff802`753de02e 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`753de033 4c8b4c2458      mov     r9,qword ptr [rsp+58h]
fffff802`753de038 4c8b442450      mov     r8,qword ptr [rsp+50h]
fffff802`753de03d 488b542448      mov     rdx,qword ptr [rsp+48h]
fffff802`753de042 e8b9f31300      call    nt!KeBugCheck2 (fffff802`7551d400)
fffff802`753de047 90              nop

nt!KeBugCheckEx+0x108:
fffff802`753de048 48c744242000000000 mov   qword ptr [rsp+20h],0
fffff802`753de051 4533c9          xor     r9d,r9d
fffff802`753de054 4533c0          xor     r8d,r8d
fffff802`753de057 33d2            xor     edx,edx
fffff802`753de059 e8a2f31300      call    nt!KeBugCheck2 (fffff802`7551d400)
fffff802`753de05e 90              nop
fffff802`753de05f c3              ret
