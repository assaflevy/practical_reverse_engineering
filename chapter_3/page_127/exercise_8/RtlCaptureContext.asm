0: kd> uf RtlCaptureContext
nt!RtlCaptureContext:
fffff802`753e5f80 489c            pushfq
fffff802`753e5f82 48894178        mov     qword ptr [rcx+78h],rax
fffff802`753e5f86 48898980000000  mov     qword ptr [rcx+80h],rcx
fffff802`753e5f8d 48899188000000  mov     qword ptr [rcx+88h],rdx
fffff802`753e5f94 4c8981b8000000  mov     qword ptr [rcx+0B8h],r8
fffff802`753e5f9b 4c8989c0000000  mov     qword ptr [rcx+0C0h],r9
fffff802`753e5fa2 4c8991c8000000  mov     qword ptr [rcx+0C8h],r10
fffff802`753e5fa9 4c8999d0000000  mov     qword ptr [rcx+0D0h],r11
fffff802`753e5fb0 0f2981a0010000  movaps  xmmword ptr [rcx+1A0h],xmm0
fffff802`753e5fb7 0f2989b0010000  movaps  xmmword ptr [rcx+1B0h],xmm1
fffff802`753e5fbe 0f2991c0010000  movaps  xmmword ptr [rcx+1C0h],xmm2
fffff802`753e5fc5 0f2999d0010000  movaps  xmmword ptr [rcx+1D0h],xmm3
fffff802`753e5fcc 0f29a1e0010000  movaps  xmmword ptr [rcx+1E0h],xmm4
fffff802`753e5fd3 0f29a9f0010000  movaps  xmmword ptr [rcx+1F0h],xmm5
fffff802`753e5fda 8c4938          mov     word ptr [rcx+38h],cs
fffff802`753e5fdd 8c593a          mov     word ptr [rcx+3Ah],ds
fffff802`753e5fe0 8c413c          mov     word ptr [rcx+3Ch],es
fffff802`753e5fe3 8c5142          mov     word ptr [rcx+42h],ss
fffff802`753e5fe6 8c613e          mov     word ptr [rcx+3Eh],fs
fffff802`753e5fe9 8c6940          mov     word ptr [rcx+40h],gs
fffff802`753e5fec 48899990000000  mov     qword ptr [rcx+90h],rbx
fffff802`753e5ff3 4889a9a0000000  mov     qword ptr [rcx+0A0h],rbp
fffff802`753e5ffa 4889b1a8000000  mov     qword ptr [rcx+0A8h],rsi
fffff802`753e6001 4889b9b0000000  mov     qword ptr [rcx+0B0h],rdi
fffff802`753e6008 4c89a1d8000000  mov     qword ptr [rcx+0D8h],r12
fffff802`753e600f 4c89a9e0000000  mov     qword ptr [rcx+0E0h],r13
fffff802`753e6016 4c89b1e8000000  mov     qword ptr [rcx+0E8h],r14
fffff802`753e601d 4c89b9f0000000  mov     qword ptr [rcx+0F0h],r15
fffff802`753e6024 d9b900010000    fnstcw  word ptr [rcx+100h]
fffff802`753e602a c7810201000000000000 mov dword ptr [rcx+102h],0
fffff802`753e6034 0f29b100020000  movaps  xmmword ptr [rcx+200h],xmm6
fffff802`753e603b 0f29b910020000  movaps  xmmword ptr [rcx+210h],xmm7
fffff802`753e6042 440f298120020000 movaps  xmmword ptr [rcx+220h],xmm8
fffff802`753e604a 440f298930020000 movaps  xmmword ptr [rcx+230h],xmm9
fffff802`753e6052 440f299140020000 movaps  xmmword ptr [rcx+240h],xmm10
fffff802`753e605a 440f299950020000 movaps  xmmword ptr [rcx+250h],xmm11
fffff802`753e6062 440f29a160020000 movaps  xmmword ptr [rcx+260h],xmm12
fffff802`753e606a 440f29a970020000 movaps  xmmword ptr [rcx+270h],xmm13
fffff802`753e6072 440f29b180020000 movaps  xmmword ptr [rcx+280h],xmm14
fffff802`753e607a 440f29b990020000 movaps  xmmword ptr [rcx+290h],xmm15
fffff802`753e6082 0fae9918010000  stmxcsr dword ptr [rcx+118h]
fffff802`753e6089 0fae5934        stmxcsr dword ptr [rcx+34h]
fffff802`753e608d 488d442410      lea     rax,[rsp+10h]
fffff802`753e6092 48898198000000  mov     qword ptr [rcx+98h],rax
fffff802`753e6099 488b442408      mov     rax,qword ptr [rsp+8]
fffff802`753e609e 488981f8000000  mov     qword ptr [rcx+0F8h],rax
fffff802`753e60a5 8b0424          mov     eax,dword ptr [rsp]
fffff802`753e60a8 894144          mov     dword ptr [rcx+44h],eax
fffff802`753e60ab c741300f001000  mov     dword ptr [rcx+30h],10000Fh
fffff802`753e60b2 4883c408        add     rsp,8
fffff802`753e60b6 c3              ret
