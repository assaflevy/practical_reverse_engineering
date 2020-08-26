nt!ExpQueryModuleInformation:
fffff800`7fe255d0 48895c2408      mov     qword ptr [rsp+8],rbx
fffff800`7fe255d5 4889742418      mov     qword ptr [rsp+18h],rsi
fffff800`7fe255da 4889542410      mov     qword ptr [rsp+10h],rdx
fffff800`7fe255df 57              push    rdi
fffff800`7fe255e0 4154            push    r12
fffff800`7fe255e2 4155            push    r13
fffff800`7fe255e4 4156            push    r14
fffff800`7fe255e6 4157            push    r15
fffff800`7fe255e8 4883ec50        sub     rsp,50h
fffff800`7fe255ec 4d8be1          mov     r12,r9
fffff800`7fe255ef 458be8          mov     r13d,r8d
fffff800`7fe255f2 488bf2          mov     rsi,rdx
fffff800`7fe255f5 488d0df44c6000  lea     rcx,[nt!PsLoadedModuleList (fffff800`8042a2f0)]
fffff800`7fe255fc 0f57c0          xorps   xmm0,xmm0
fffff800`7fe255ff 0f11442440      movups  xmmword ptr [rsp+40h],xmm0
fffff800`7fe25604 33d2            xor     edx,edx
fffff800`7fe25606 448bfa          mov     r15d,edx
fffff800`7fe25609 448bd2          mov     r10d,edx
fffff800`7fe2560c 89542424        mov     dword ptr [rsp+24h],edx
fffff800`7fe25610 bf08000000      mov     edi,8
fffff800`7fe25615 4803f7          add     rsi,rdi
fffff800`7fe25618 4c8b35d14c6000  mov     r14,qword ptr [nt!PsLoadedModuleList (fffff800`8042a2f0)]
fffff800`7fe2561f 41b800010000    mov     r8d,100h

nt!ExpQueryModuleInformation+0x55:
fffff800`7fe25625 4c3bf1          cmp     r14,rcx
fffff800`7fe25628 0f840c010000    je      nt!ExpQueryModuleInformation+0x16a (fffff800`7fe2573a)  Branch

nt!ExpQueryModuleInformation+0x5e:
fffff800`7fe2562e 8d8728010000    lea     eax,[rdi+128h]
fffff800`7fe25634 3bc7            cmp     eax,edi
fffff800`7fe25636 0f8252ac1c00    jb      nt!ExpQueryModuleInformation+0x1cacbe (fffff800`7fff028e)  Branch

nt!ExpQueryModuleInformation+0x6c:
fffff800`7fe2563c 8bf8            mov     edi,eax
fffff800`7fe2563e 443be8          cmp     r13d,eax
fffff800`7fe25641 0f82d4000000    jb      nt!ExpQueryModuleInformation+0x14b (fffff800`7fe2571b)  Branch

nt!ExpQueryModuleInformation+0x77:
fffff800`7fe25647 498b4630        mov     rax,qword ptr [r14+30h]
fffff800`7fe2564b 48894610        mov     qword ptr [rsi+10h],rax
fffff800`7fe2564f 418b4640        mov     eax,dword ptr [r14+40h]
fffff800`7fe25653 894618          mov     dword ptr [rsi+18h],eax
fffff800`7fe25656 418b4668        mov     eax,dword ptr [r14+68h]
fffff800`7fe2565a 89461c          mov     dword ptr [rsi+1Ch],eax
fffff800`7fe2565d 410fb7466c      movzx   eax,word ptr [r14+6Ch]
fffff800`7fe25662 66894624        mov     word ptr [rsi+24h],ax
fffff800`7fe25666 6644897e20      mov     word ptr [rsi+20h],r15w
fffff800`7fe2566b 66895622        mov     word ptr [rsi+22h],dx
fffff800`7fe2566f 488d5e28        lea     rbx,[rsi+28h]
fffff800`7fe25673 48895c2448      mov     qword ptr [rsp+48h],rbx
fffff800`7fe25678 c744244000000001 mov     dword ptr [rsp+40h],1000000h
fffff800`7fe25680 498d5648        lea     rdx,[r14+48h]
fffff800`7fe25684 4533c0          xor     r8d,r8d
fffff800`7fe25687 488d4c2440      lea     rcx,[rsp+40h]
fffff800`7fe2568c e8ff000000      call    nt!RtlUnicodeStringToAnsiString (fffff800`7fe25790)
fffff800`7fe25691 448bd0          mov     r10d,eax
fffff800`7fe25694 89442424        mov     dword ptr [rsp+24h],eax
fffff800`7fe25698 41b800000080    mov     r8d,80000000h
fffff800`7fe2569e 428d0c00        lea     ecx,[rax+r8]
fffff800`7fe256a2 4185c8          test    r8d,ecx
fffff800`7fe256a5 7507            jne     nt!ExpQueryModuleInformation+0xde (fffff800`7fe256ae)  Branch

nt!ExpQueryModuleInformation+0xd7:
fffff800`7fe256a7 3d05000080      cmp     eax,80000005h
fffff800`7fe256ac 7541            jne     nt!ExpQueryModuleInformation+0x11f (fffff800`7fe256ef)  Branch

nt!ExpQueryModuleInformation+0xde:
fffff800`7fe256ae 0fb74c2440      movzx   ecx,word ptr [rsp+40h]
fffff800`7fe256b3 488b542448      mov     rdx,qword ptr [rsp+48h]
fffff800`7fe256b8 4803ca          add     rcx,rdx
fffff800`7fe256bb 48894c2428      mov     qword ptr [rsp+28h],rcx

nt!ExpQueryModuleInformation+0xf0:
fffff800`7fe256c0 483bca          cmp     rcx,rdx
fffff800`7fe256c3 761d            jbe     nt!ExpQueryModuleInformation+0x112 (fffff800`7fe256e2)  Branch

nt!ExpQueryModuleInformation+0xf5:
fffff800`7fe256c5 48ffc9          dec     rcx
fffff800`7fe256c8 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff800`7fe256cd 0fb601          movzx   eax,byte ptr [rcx]
fffff800`7fe256d0 84c0            test    al,al
fffff800`7fe256d2 740e            je      nt!ExpQueryModuleInformation+0x112 (fffff800`7fe256e2)  Branch

nt!ExpQueryModuleInformation+0x104:
fffff800`7fe256d4 3c5c            cmp     al,5Ch
fffff800`7fe256d6 7402            je      nt!ExpQueryModuleInformation+0x10a (fffff800`7fe256da)  Branch

nt!ExpQueryModuleInformation+0x108:
fffff800`7fe256d8 ebe6            jmp     nt!ExpQueryModuleInformation+0xf0 (fffff800`7fe256c0)  Branch

nt!ExpQueryModuleInformation+0x10a:
fffff800`7fe256da 48ffc1          inc     rcx
fffff800`7fe256dd 48894c2428      mov     qword ptr [rsp+28h],rcx

nt!ExpQueryModuleInformation+0x112:
fffff800`7fe256e2 662b4c2448      sub     cx,word ptr [rsp+48h]
fffff800`7fe256e7 66894e26        mov     word ptr [rsi+26h],cx
fffff800`7fe256eb 33d2            xor     edx,edx
fffff800`7fe256ed eb09            jmp     nt!ExpQueryModuleInformation+0x128 (fffff800`7fe256f8)  Branch

nt!ExpQueryModuleInformation+0x11f:
fffff800`7fe256ef c60300          mov     byte ptr [rbx],0
fffff800`7fe256f2 33d2            xor     edx,edx
fffff800`7fe256f4 66895626        mov     word ptr [rsi+26h],dx

nt!ExpQueryModuleInformation+0x128:
fffff800`7fe256f8 eb02            jmp     nt!ExpQueryModuleInformation+0x12c (fffff800`7fe256fc)  Branch

nt!ExpQueryModuleInformation+0x12c:
fffff800`7fe256fc 4881c628010000  add     rsi,128h
fffff800`7fe25703 488d0de64b6000  lea     rcx,[nt!PsLoadedModuleList (fffff800`8042a2f0)]
fffff800`7fe2570a 41b800010000    mov     r8d,100h
fffff800`7fe25710 41ffc7          inc     r15d
fffff800`7fe25713 4d8b36          mov     r14,qword ptr [r14]
fffff800`7fe25716 e90affffff      jmp     nt!ExpQueryModuleInformation+0x55 (fffff800`7fe25625)  Branch

nt!ExpQueryModuleInformation+0x14b:
fffff800`7fe2571b 4d85e4          test    r12,r12
fffff800`7fe2571e 7404            je      nt!ExpQueryModuleInformation+0x154 (fffff800`7fe25724)  Branch

nt!ExpQueryModuleInformation+0x150:
fffff800`7fe25720 41890424        mov     dword ptr [r12],eax

nt!ExpQueryModuleInformation+0x154:
fffff800`7fe25724 41ba040000c0    mov     r10d,0C0000004h
fffff800`7fe2572a 4489542424      mov     dword ptr [rsp+24h],r10d
fffff800`7fe2572f 41ffc7          inc     r15d
fffff800`7fe25732 4d8b36          mov     r14,qword ptr [r14]
fffff800`7fe25735 e9ebfeffff      jmp     nt!ExpQueryModuleInformation+0x55 (fffff800`7fe25625)  Branch

nt!ExpQueryModuleInformation+0x16a:
fffff800`7fe2573a 4d85e4          test    r12,r12
fffff800`7fe2573d 7404            je      nt!ExpQueryModuleInformation+0x173 (fffff800`7fe25743)  Branch

nt!ExpQueryModuleInformation+0x16f:
fffff800`7fe2573f 41893c24        mov     dword ptr [r12],edi

nt!ExpQueryModuleInformation+0x173:
fffff800`7fe25743 4183fd08        cmp     r13d,8
fffff800`7fe25747 722d            jb      nt!ExpQueryModuleInformation+0x1a6 (fffff800`7fe25776)  Branch

nt!ExpQueryModuleInformation+0x179:
fffff800`7fe25749 488b842488000000 mov     rax,qword ptr [rsp+88h]
fffff800`7fe25751 448938          mov     dword ptr [rax],r15d
fffff800`7fe25754 eb02            jmp     nt!ExpQueryModuleInformation+0x188 (fffff800`7fe25758)  Branch

nt!ExpQueryModuleInformation+0x188:
fffff800`7fe25758 418bc2          mov     eax,r10d

nt!ExpQueryModuleInformation+0x18b:
fffff800`7fe2575b 4c8d5c2450      lea     r11,[rsp+50h]
fffff800`7fe25760 498b5b30        mov     rbx,qword ptr [r11+30h]
fffff800`7fe25764 498b7340        mov     rsi,qword ptr [r11+40h]
fffff800`7fe25768 498be3          mov     rsp,r11
fffff800`7fe2576b 415f            pop     r15
fffff800`7fe2576d 415e            pop     r14
fffff800`7fe2576f 415d            pop     r13
fffff800`7fe25771 415c            pop     r12
fffff800`7fe25773 5f              pop     rdi
fffff800`7fe25774 c3              ret

nt!ExpQueryModuleInformation+0x1a6:
fffff800`7fe25776 41ba040000c0    mov     r10d,0C0000004h
fffff800`7fe2577c ebda            jmp     nt!ExpQueryModuleInformation+0x188 (fffff800`7fe25758)  Branch

nt!ExpQueryModuleInformation+0x1cacbe:
fffff800`7fff028e b8010000c0      mov     eax,0C0000001h
fffff800`7fff0293 e9c354e3ff      jmp     nt!ExpQueryModuleInformation+0x18b (fffff800`7fe2575b)  Branch
