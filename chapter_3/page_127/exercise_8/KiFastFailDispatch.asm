0: kd> uf KiFastFailDispatch
nt!KiFastFailDispatch:
fffff802`753f0180 4881ecd8010000  sub     rsp,1D8h
fffff802`753f0187 488d842400010000 lea     rax,[rsp+100h]
fffff802`753f018f 0f29742430      movaps  xmmword ptr [rsp+30h],xmm6
fffff802`753f0194 0f297c2440      movaps  xmmword ptr [rsp+40h],xmm7
fffff802`753f0199 440f29442450    movaps  xmmword ptr [rsp+50h],xmm8
fffff802`753f019f 440f294c2460    movaps  xmmword ptr [rsp+60h],xmm9
fffff802`753f01a5 440f29542470    movaps  xmmword ptr [rsp+70h],xmm10
fffff802`753f01ab 440f295880      movaps  xmmword ptr [rax-80h],xmm11
fffff802`753f01b0 440f296090      movaps  xmmword ptr [rax-70h],xmm12
fffff802`753f01b5 440f2968a0      movaps  xmmword ptr [rax-60h],xmm13
fffff802`753f01ba 440f2970b0      movaps  xmmword ptr [rax-50h],xmm14
fffff802`753f01bf 440f2978c0      movaps  xmmword ptr [rax-40h],xmm15
fffff802`753f01c4 488918          mov     qword ptr [rax],rbx
fffff802`753f01c7 48897808        mov     qword ptr [rax+8],rdi
fffff802`753f01cb 48897010        mov     qword ptr [rax+10h],rsi
fffff802`753f01cf 4c896018        mov     qword ptr [rax+18h],r12
fffff802`753f01d3 4c896820        mov     qword ptr [rax+20h],r13
fffff802`753f01d7 4c897028        mov     qword ptr [rax+28h],r14
fffff802`753f01db 4c897830        mov     qword ptr [rax+30h],r15
fffff802`753f01df 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff802`753f01e8 0fba607408      bt      dword ptr [rax+74h],8
fffff802`753f01ed 730e            jae     nt!KiFastFailDispatch+0x7d (fffff802`753f01fd)  Branch

nt!KiFastFailDispatch+0x6f:
fffff802`753f01ef f685f000000001  test    byte ptr [rbp+0F0h],1
fffff802`753f01f6 7405            je      nt!KiFastFailDispatch+0x7d (fffff802`753f01fd)  Branch

nt!KiFastFailDispatch+0x78:
fffff802`753f01f8 e843090000      call    nt!KiUmsExceptionEntry (fffff802`753f0b40)

nt!KiFastFailDispatch+0x7d:
fffff802`753f01fd 488d842438010000 lea     rax,[rsp+138h]
fffff802`753f0205 8908            mov     dword ptr [rax],ecx
fffff802`753f0207 33c9            xor     ecx,ecx
fffff802`753f0209 c7400401000000  mov     dword ptr [rax+4],1
fffff802`753f0210 48894808        mov     qword ptr [rax+8],rcx
fffff802`753f0214 4c894010        mov     qword ptr [rax+10h],r8
fffff802`753f0218 895018          mov     dword ptr [rax+18h],edx
fffff802`753f021b 4c894820        mov     qword ptr [rax+20h],r9
fffff802`753f021f 4c895028        mov     qword ptr [rax+28h],r10
fffff802`753f0223 4c895830        mov     qword ptr [rax+30h],r11
fffff802`753f0227 448a8df0000000  mov     r9b,byte ptr [rbp+0F0h]
fffff802`753f022e 4180e101        and     r9b,1
fffff802`753f0232 4180f900        cmp     r9b,0
fffff802`753f0236 7518            jne     nt!KiFastFailDispatch+0xd0 (fffff802`753f0250)  Branch

nt!KiFastFailDispatch+0xb8:
fffff802`753f0238 488b5020        mov     rdx,qword ptr [rax+20h]
fffff802`753f023c 4d33d2          xor     r10,r10
fffff802`753f023f 4c8bc8          mov     r9,rax
fffff802`753f0242 4c8d4580        lea     r8,[rbp-80h]
fffff802`753f0246 b939010000      mov     ecx,139h
fffff802`753f024b e870fbffff      call    nt!KiBugCheckDispatch (fffff802`753efdc0)

nt!KiFastFailDispatch+0xd0:
fffff802`753f0250 c644242000      mov     byte ptr [rsp+20h],0
fffff802`753f0255 4c8d4580        lea     r8,[rbp-80h]
fffff802`753f0259 488bd4          mov     rdx,rsp
fffff802`753f025c 488bc8          mov     rcx,rax
fffff802`753f025f e80ca4e8ff      call    nt!KiDispatchException (fffff802`7527a670)
fffff802`753f0264 488d8c2400010000 lea     rcx,[rsp+100h]
fffff802`753f026c 0f28742430      movaps  xmm6,xmmword ptr [rsp+30h]
fffff802`753f0271 0f287c2440      movaps  xmm7,xmmword ptr [rsp+40h]
fffff802`753f0276 440f28442450    movaps  xmm8,xmmword ptr [rsp+50h]
fffff802`753f027c 440f284c2460    movaps  xmm9,xmmword ptr [rsp+60h]
fffff802`753f0282 440f28542470    movaps  xmm10,xmmword ptr [rsp+70h]
fffff802`753f0288 440f285980      movaps  xmm11,xmmword ptr [rcx-80h]
fffff802`753f028d 440f286190      movaps  xmm12,xmmword ptr [rcx-70h]
fffff802`753f0292 440f2869a0      movaps  xmm13,xmmword ptr [rcx-60h]
fffff802`753f0297 440f2871b0      movaps  xmm14,xmmword ptr [rcx-50h]
fffff802`753f029c 440f2879c0      movaps  xmm15,xmmword ptr [rcx-40h]
fffff802`753f02a1 488b19          mov     rbx,qword ptr [rcx]
fffff802`753f02a4 488b7908        mov     rdi,qword ptr [rcx+8]
fffff802`753f02a8 488b7110        mov     rsi,qword ptr [rcx+10h]
fffff802`753f02ac 4c8b6118        mov     r12,qword ptr [rcx+18h]
fffff802`753f02b0 4c8b6920        mov     r13,qword ptr [rcx+20h]
fffff802`753f02b4 4c8b7128        mov     r14,qword ptr [rcx+28h]
fffff802`753f02b8 4c8b7930        mov     r15,qword ptr [rcx+30h]
fffff802`753f02bc fa              cli
fffff802`753f02bd f685f000000001  test    byte ptr [rbp+0F0h],1
fffff802`753f02c4 0f844a010000    je      nt!KiFastFailDispatch+0x294 (fffff802`753f0414)  Branch

nt!KiFastFailDispatch+0x14a:
fffff802`753f02ca f6057bb29000ff  test    byte ptr [nt!KeSmapEnabled (fffff802`75cfb54c)],0FFh
fffff802`753f02d1 7403            je      nt!KiFastFailDispatch+0x156 (fffff802`753f02d6)  Branch

nt!KiFastFailDispatch+0x153:
fffff802`753f02d3 0f01cb          stac

nt!KiFastFailDispatch+0x156:
fffff802`753f02d6 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff802`753f02df f681c200000003  test    byte ptr [rcx+0C2h],3
fffff802`753f02e6 741b            je      nt!KiFastFailDispatch+0x183 (fffff802`753f0303)  Branch

nt!KiFastFailDispatch+0x168:
fffff802`753f02e8 b901000000      mov     ecx,1
fffff802`753f02ed 440f22c1        mov     cr8,rcx
fffff802`753f02f1 fb              sti
fffff802`753f02f2 e87921ffff      call    nt!KiInitiateUserApc (fffff802`753e2470)
fffff802`753f02f7 fa              cli
fffff802`753f02f8 b900000000      mov     ecx,0
fffff802`753f02fd 440f22c1        mov     cr8,rcx
fffff802`753f0301 ebd3            jmp     nt!KiFastFailDispatch+0x156 (fffff802`753f02d6)  Branch

nt!KiFastFailDispatch+0x183:
fffff802`753f0303 65f604257e02000002 test  byte ptr gs:[27Eh],2
fffff802`753f030c 7407            je      nt!KiFastFailDispatch+0x195 (fffff802`753f0315)  Branch

nt!KiFastFailDispatch+0x18e:
fffff802`753f030e 33c9            xor     ecx,ecx
fffff802`753f0310 e85b18f1ff      call    nt!KiUpdateStibpPairing (fffff802`75301b70)

nt!KiFastFailDispatch+0x195:
fffff802`753f0315 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff802`753f031e f70100000008    test    dword ptr [rcx],8000000h
fffff802`753f0324 7405            je      nt!KiFastFailDispatch+0x1ab (fffff802`753f032b)  Branch

nt!KiFastFailDispatch+0x1a6:
fffff802`753f0326 e875ebfeff      call    nt!KiRestoreSetContextState (fffff802`753deea0)

nt!KiFastFailDispatch+0x1ab:
fffff802`753f032b 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff802`753f0334 f70100000140    test    dword ptr [rcx],40010000h
fffff802`753f033a 7425            je      nt!KiFastFailDispatch+0x1e1 (fffff802`753f0361)  Branch

nt!KiFastFailDispatch+0x1bc:
fffff802`753f033c f6410201        test    byte ptr [rcx+2],1
fffff802`753f0340 740e            je      nt!KiFastFailDispatch+0x1d0 (fffff802`753f0350)  Branch

nt!KiFastFailDispatch+0x1c2:
fffff802`753f0342 e809241300      call    nt!KiCopyCounters (fffff802`75522750)
fffff802`753f0347 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]

nt!KiFastFailDispatch+0x1d0:
fffff802`753f0350 f6410340        test    byte ptr [rcx+3],40h
fffff802`753f0354 740b            je      nt!KiFastFailDispatch+0x1e1 (fffff802`753f0361)  Branch

nt!KiFastFailDispatch+0x1d6:
fffff802`753f0356 488d6580        lea     rsp,[rbp-80h]
fffff802`753f035a b101            mov     cl,1
fffff802`753f035c e89f080000      call    nt!KiUmsExit (fffff802`753f0c00)

nt!KiFastFailDispatch+0x1e1:
fffff802`753f0361 0fae55ac        ldmxcsr dword ptr [rbp-54h]
fffff802`753f0365 6683bd8000000000 cmp     word ptr [rbp+80h],0
fffff802`753f036d 7405            je      nt!KiFastFailDispatch+0x1f4 (fffff802`753f0374)  Branch

nt!KiFastFailDispatch+0x1ef:
fffff802`753f036f e89ce0feff      call    nt!KiRestoreDebugRegisterState (fffff802`753de410)

nt!KiFastFailDispatch+0x1f4:
fffff802`753f0374 0f2845f0        movaps  xmm0,xmmword ptr [rbp-10h]
fffff802`753f0378 0f284d00        movaps  xmm1,xmmword ptr [rbp]
fffff802`753f037c 0f285510        movaps  xmm2,xmmword ptr [rbp+10h]
fffff802`753f0380 0f285d20        movaps  xmm3,xmmword ptr [rbp+20h]
fffff802`753f0384 0f286530        movaps  xmm4,xmmword ptr [rbp+30h]
fffff802`753f0388 0f286d40        movaps  xmm5,xmmword ptr [rbp+40h]
fffff802`753f038c 4c8b5de0        mov     r11,qword ptr [rbp-20h]
fffff802`753f0390 4c8b55d8        mov     r10,qword ptr [rbp-28h]
fffff802`753f0394 4c8b4dd0        mov     r9,qword ptr [rbp-30h]
fffff802`753f0398 4c8b45c8        mov     r8,qword ptr [rbp-38h]
fffff802`753f039c 65c604255308000000 mov   byte ptr gs:[853h],0
fffff802`753f03a5 650fb604257d020000 movzx eax,byte ptr gs:[27Dh]
fffff802`753f03ae 653804257a020000 cmp     byte ptr gs:[27Ah],al
fffff802`753f03b6 7411            je      nt!KiFastFailDispatch+0x249 (fffff802`753f03c9)  Branch

nt!KiFastFailDispatch+0x238:
fffff802`753f03b8 658804257a020000 mov     byte ptr gs:[27Ah],al
fffff802`753f03c0 b948000000      mov     ecx,48h
fffff802`753f03c5 33d2            xor     edx,edx
fffff802`753f03c7 0f30            wrmsr

nt!KiFastFailDispatch+0x249:
fffff802`753f03c9 66650fba34257802000002 btr word ptr gs:[278h],2
fffff802`753f03d4 730e            jae     nt!KiFastFailDispatch+0x264 (fffff802`753f03e4)  Branch

nt!KiFastFailDispatch+0x256:
fffff802`753f03d6 b801000000      mov     eax,1
fffff802`753f03db 33d2            xor     edx,edx
fffff802`753f03dd b949000000      mov     ecx,49h
fffff802`753f03e2 0f30            wrmsr

nt!KiFastFailDispatch+0x264:
fffff802`753f03e4 488b55c0        mov     rdx,qword ptr [rbp-40h]
fffff802`753f03e8 488b4db8        mov     rcx,qword ptr [rbp-48h]
fffff802`753f03ec 488b45b0        mov     rax,qword ptr [rbp-50h]
fffff802`753f03f0 488be5          mov     rsp,rbp
fffff802`753f03f3 488badd8000000  mov     rbp,qword ptr [rbp+0D8h]
fffff802`753f03fa 4881c4e8000000  add     rsp,0E8h
fffff802`753f0401 f6053814a10001  test    byte ptr [nt!KiKvaShadow (fffff802`75e01840)],1
fffff802`753f0408 7405            je      nt!KiFastFailDispatch+0x28f (fffff802`753f040f)  Branch

nt!KiFastFailDispatch+0x28a:
fffff802`753f040a e971376300      jmp     nt!KiKernelExit (fffff802`75a23b80)  Branch

nt!KiFastFailDispatch+0x28f:
fffff802`753f040f 0f01f8          swapgs
fffff802`753f0412 48cf            iretq

nt!KiFastFailDispatch+0x294:
fffff802`753f0414 0fae55ac        ldmxcsr dword ptr [rbp-54h]
fffff802`753f0418 0f2845f0        movaps  xmm0,xmmword ptr [rbp-10h]
fffff802`753f041c 0f284d00        movaps  xmm1,xmmword ptr [rbp]
fffff802`753f0420 0f285510        movaps  xmm2,xmmword ptr [rbp+10h]
fffff802`753f0424 0f285d20        movaps  xmm3,xmmword ptr [rbp+20h]
fffff802`753f0428 0f286530        movaps  xmm4,xmmword ptr [rbp+30h]
fffff802`753f042c 0f286d40        movaps  xmm5,xmmword ptr [rbp+40h]
fffff802`753f0430 4c8b5de0        mov     r11,qword ptr [rbp-20h]
fffff802`753f0434 4c8b55d8        mov     r10,qword ptr [rbp-28h]
fffff802`753f0438 4c8b4dd0        mov     r9,qword ptr [rbp-30h]
fffff802`753f043c 4c8b45c8        mov     r8,qword ptr [rbp-38h]
fffff802`753f0440 488b55c0        mov     rdx,qword ptr [rbp-40h]
fffff802`753f0444 488b4db8        mov     rcx,qword ptr [rbp-48h]
fffff802`753f0448 488b45b0        mov     rax,qword ptr [rbp-50h]
fffff802`753f044c 488be5          mov     rsp,rbp
fffff802`753f044f 488badd8000000  mov     rbp,qword ptr [rbp+0D8h]
fffff802`753f0456 4881c4e8000000  add     rsp,0E8h
fffff802`753f045d 48cf            iretq

nt!KiKernelExit:
fffff802`75a23b80 50              push    rax
fffff802`75a23b81 52              push    rdx
fffff802`75a23b82 488d442438      lea     rax,[rsp+38h]
fffff802`75a23b87 65488b142538000000 mov   rdx,qword ptr gs:[38h]
fffff802`75a23b90 488da200420000  lea     rsp,[rdx+4200h]
fffff802`75a23b97 65488b142588010000 mov   rdx,qword ptr gs:[188h]
fffff802`75a23ba0 488b9220020000  mov     rdx,qword ptr [rdx+220h]
fffff802`75a23ba7 488b9288030000  mov     rdx,qword ptr [rdx+388h]
fffff802`75a23bae ff70f8          push    qword ptr [rax-8]
fffff802`75a23bb1 ff70f0          push    qword ptr [rax-10h]
fffff802`75a23bb4 ff70e8          push    qword ptr [rax-18h]
fffff802`75a23bb7 ff70e0          push    qword ptr [rax-20h]
fffff802`75a23bba ff70d8          push    qword ptr [rax-28h]
fffff802`75a23bbd 654889242510900000 mov   qword ptr gs:[9010h],rsp
fffff802`75a23bc6 488be2          mov     rsp,rdx
fffff802`75a23bc9 488b50c8        mov     rdx,qword ptr [rax-38h]
fffff802`75a23bcd 488b40d0        mov     rax,qword ptr [rax-30h]
fffff802`75a23bd1 65f704251890000002000000 test dword ptr gs:[9018h],2
fffff802`75a23bdd 7527            jne     nt!KiKernelExit+0x86 (fffff802`75a23c06)  Branch

nt!KiKernelExit+0x5f:
fffff802`75a23bdf 0fbae400        bt      esp,0
fffff802`75a23be3 731e            jae     nt!KiKernelExit+0x83 (fffff802`75a23c03)  Branch

nt!KiKernelExit+0x65:
fffff802`75a23be5 65f704251890000001000000 test dword ptr gs:[9018h],1
fffff802`75a23bf1 7507            jne     nt!KiKernelExit+0x7a (fffff802`75a23bfa)  Branch

nt!KiKernelExit+0x73:
fffff802`75a23bf3 480fbaec3f      bts     rsp,3Fh
fffff802`75a23bf8 eb09            jmp     nt!KiKernelExit+0x83 (fffff802`75a23c03)  Branch

nt!KiKernelExit+0x7a:
fffff802`75a23bfa 6583242518900000fe and   dword ptr gs:[9018h],0FFFFFFFEh

nt!KiKernelExit+0x83:
fffff802`75a23c03 0f22dc          mov     cr3,rsp

nt!KiKernelExit+0x86:
fffff802`75a23c06 65488b242510900000 mov   rsp,qword ptr gs:[9010h]
fffff802`75a23c0f 65f704251890000002000000 test dword ptr gs:[9018h],2
fffff802`75a23c1b 7505            jne     nt!KiKernelExit+0xa2 (fffff802`75a23c22)  Branch

nt!KiKernelExit+0x9d:
fffff802`75a23c1d 0f006c2420      verw    word ptr [rsp+20h]

nt!KiKernelExit+0xa2:
fffff802`75a23c22 0f01f8          swapgs
fffff802`75a23c25 48cf            iretq
