nt!ExpQuerySystemInformation:
fffff807`4bdfbb90 4053                 push    rbx
fffff807`4bdfbb92 56                   push    rsi
fffff807`4bdfbb93 57                   push    rdi
fffff807`4bdfbb94 4154                 push    r12
fffff807`4bdfbb96 4155                 push    r13
fffff807`4bdfbb98 4156                 push    r14
fffff807`4bdfbb9a 4157                 push    r15
fffff807`4bdfbb9c 4881ec80060000       sub     rsp, 680h
fffff807`4bdfbba3 488b0586666100       mov     rax, qword ptr [nt!_security_cookie (fffff807`4c412230)]
fffff807`4bdfbbaa 4833c4               xor     rax, rsp
fffff807`4bdfbbad 4889842470060000     mov     qword ptr [rsp+670h], rax
fffff807`4bdfbbb5 498bd9               mov     rbx, r9
fffff807`4bdfbbb8 448944244c           mov     dword ptr [rsp+4Ch], r8d
fffff807`4bdfbbbd 4889542458           mov     qword ptr [rsp+58h], rdx
fffff807`4bdfbbc2 4863f1               movsxd  rsi, ecx
fffff807`4bdfbbc5 448bbc24e0060000     mov     r15d, dword ptr [rsp+6E0h]
fffff807`4bdfbbcd 4c8bb424e8060000     mov     r14, qword ptr [rsp+6E8h]
fffff807`4bdfbbd5 4c89742468           mov     qword ptr [rsp+68h], r14
fffff807`4bdfbbda 33ff                 xor     edi, edi
fffff807`4bdfbbdc 897c2464             mov     dword ptr [rsp+64h], edi
fffff807`4bdfbbe0 4889bc2460010000     mov     qword ptr [rsp+160h], rdi
fffff807`4bdfbbe8 89bc2420010000       mov     dword ptr [rsp+120h], edi
fffff807`4bdfbbef 89bc2424010000       mov     dword ptr [rsp+124h], edi
fffff807`4bdfbbf6 897c2444             mov     dword ptr [rsp+44h], edi
fffff807`4bdfbbfa 897c2474             mov     dword ptr [rsp+74h], edi
fffff807`4bdfbbfe 66897c2448           mov     word ptr [rsp+48h], di
fffff807`4bdfbc03 66897c2454           mov     word ptr [rsp+54h], di
fffff807`4bdfbc08 0f57c0               xorps   xmm0, xmm0
fffff807`4bdfbc0b 0f11842488010000     movups  xmmword ptr [rsp+188h], xmm0
fffff807`4bdfbc13 4889bc2410010000     mov     qword ptr [rsp+110h], rdi
fffff807`4bdfbc1b 897c243c             mov     dword ptr [rsp+3Ch], edi
fffff807`4bdfbc1f 89bc242c010000       mov     dword ptr [rsp+12Ch], edi
fffff807`4bdfbc26 4889bc2438010000     mov     qword ptr [rsp+138h], rdi
fffff807`4bdfbc2e 4889bc2430010000     mov     qword ptr [rsp+130h], rdi
fffff807`4bdfbc36 89bc2418010000       mov     dword ptr [rsp+118h], edi
fffff807`4bdfbc3d 33d2                 xor     edx, edx
fffff807`4bdfbc3f 41b880000000         mov     r8d, 80h
fffff807`4bdfbc45 488d8c24f0050000     lea     rcx, [rsp+5F0h]
fffff807`4bdfbc4d e8ee53dfff           call    nt!memset (fffff807`4bbf1040)
fffff807`4bdfbc52 897c2430             mov     dword ptr [rsp+30h], edi
fffff807`4bdfbc56 65488b042588010000   mov     rax, qword ptr gs:[188h]
fffff807`4bdfbc5f 0fb68032020000       movzx   eax, byte ptr [rax+232h]
fffff807`4bdfbc66 88442438             mov     byte ptr [rsp+38h], al
fffff807`4bdfbc6a 84c0                 test    al, al
fffff807`4bdfbc6c 0f84a5070000         je      nt!ExpQuerySystemInformation+0x887 (fffff807`4bdfc417)
fffff807`4bdfbc72 83fe49               cmp     esi, 49h
fffff807`4bdfbc75 0f8c65010000         jl      nt!ExpQuerySystemInformation+0x250 (fffff807`4bdfbde0)
fffff807`4bdfbc7b 83fe58               cmp     esi, 58h
fffff807`4bdfbc7e 0f8d5c010000         jge     nt!ExpQuerySystemInformation+0x250 (fffff807`4bdfbde0)
fffff807`4bdfbc84 41b804000000         mov     r8d, 4
fffff807`4bdfbc8a c744244001000000     mov     dword ptr [rsp+40h], 1
fffff807`4bdfbc92 498bd7               mov     rdx, r15
fffff807`4bdfbc95 488bcb               mov     rcx, rbx
fffff807`4bdfbc98 e8c31c0000           call    nt!ProbeForWrite (fffff807`4bdfd960)
fffff807`4bdfbc9d 4d85f6               test    r14, r14
fffff807`4bdfbca0 741d                 je      nt!ExpQuerySystemInformation+0x12f (fffff807`4bdfbcbf)
fffff807`4bdfbca2 498bce               mov     rcx, r14
fffff807`4bdfbca5 48ba0000ffffff7f0000 mov     rdx, 7FFFFFFF0000h
fffff807`4bdfbcaf 4c3bf2               cmp     r14, rdx
fffff807`4bdfbcb2 7306                 jae     nt!ExpQuerySystemInformation+0x12a (fffff807`4bdfbcba)
fffff807`4bdfbcb4 8b01                 mov     eax, dword ptr [rcx]
fffff807`4bdfbcb6 8901                 mov     dword ptr [rcx], eax
fffff807`4bdfbcb8 eb05                 jmp     nt!ExpQuerySystemInformation+0x12f (fffff807`4bdfbcbf)
fffff807`4bdfbcba 488bca               mov     rcx, rdx
fffff807`4bdfbcbd ebf5                 jmp     nt!ExpQuerySystemInformation+0x124 (fffff807`4bdfbcb4)
fffff807`4bdfbcbf 488d153a43a0ff       lea     rdx, [nt!PopNotifyWork <PERF> (nt+0x0) (fffff807`4b800000)]
fffff807`4bdfbcc6 eb05                 jmp     nt!ExpQuerySystemInformation+0x13d (fffff807`4bdfbccd)
fffff807`4bdfbcc8 e96a1c0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfbccd 897c2434             mov     dword ptr [rsp+34h], edi
fffff807`4bdfbcd1 41bdffff0000         mov     r13d, 0FFFFh
fffff807`4bdfbcd7 4489ac242c010000     mov     dword ptr [rsp+12Ch], r13d
fffff807`4bdfbcdf 448bcf               mov     r9d, edi
fffff807`4bdfbce2 897c2470             mov     dword ptr [rsp+70h], edi
fffff807`4bdfbce6 440fb7e7             movzx   r12d, di
fffff807`4bdfbcea 66897c2454           mov     word ptr [rsp+54h], di
fffff807`4bdfbcef 66897c2448           mov     word ptr [rsp+48h], di
fffff807`4bdfbcf4 4889bc2440010000     mov     qword ptr [rsp+140h], rdi
fffff807`4bdfbcfc 4889bc24c8010000     mov     qword ptr [rsp+1C8h], rdi
fffff807`4bdfbd04 4889bc2478010000     mov     qword ptr [rsp+178h], rdi
fffff807`4bdfbd0c b809000000           mov     eax, 9
fffff807`4bdfbd11 89442450             mov     dword ptr [rsp+50h], eax
fffff807`4bdfbd15 89842418010000       mov     dword ptr [rsp+118h], eax
fffff807`4bdfbd1c 83fe4a               cmp     esi, 4Ah
fffff807`4bdfbd1f 0f8c93000000         jl      nt!ExpQuerySystemInformation+0x228 (fffff807`4bdfbdb8)
fffff807`4bdfbd25 83fe53               cmp     esi, 53h
fffff807`4bdfbd28 0f8d8a000000         jge     nt!ExpQuerySystemInformation+0x228 (fffff807`4bdfbdb8)
fffff807`4bdfbd2e 440fb7442448         movzx   r8d, word ptr [rsp+48h]
fffff807`4bdfbd34 4c8bd7               mov     r10, rdi
fffff807`4bdfbd37 8b542450             mov     edx, dword ptr [rsp+50h]
fffff807`4bdfbd3b 83fe4f               cmp     esi, 4Fh
fffff807`4bdfbd3e 7532                 jne     nt!ExpQuerySystemInformation+0x1e2 (fffff807`4bdfbd72)
fffff807`4bdfbd40 488d442434           lea     rax, [rsp+34h]
fffff807`4bdfbd45 4889442420           mov     qword ptr [rsp+20h], rax
fffff807`4bdfbd4a 440fb64c2438         movzx   r9d, byte ptr [rsp+38h]
fffff807`4bdfbd50 458bc7               mov     r8d, r15d
fffff807`4bdfbd53 488bd3               mov     rdx, rbx
fffff807`4bdfbd56 e8751c0000           call    nt!PfQuerySuperfetchInformation (fffff807`4bdfd9d0)
fffff807`4bdfbd5b 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfbd5f 4d85f6               test    r14, r14
fffff807`4bdfbd62 0f85e5000000         jne     nt!ExpQuerySystemInformation+0x2bd (fffff807`4bdfbe4d)
fffff807`4bdfbd68 8b442430             mov     eax, dword ptr [rsp+30h]
fffff807`4bdfbd6c e9c61b0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfbd71 cc                   int     3
fffff807`4bdfbd72 81fed5000000         cmp     esi, 0D5h
fffff807`4bdfbd78 0f87ae9c1e00         ja      nt!ExpQuerySystemInformation+0x1e9e9c (fffff807`4bfe5a2c)
fffff807`4bdfbd7e 4c8d1d7b42a0ff       lea     r11, [nt!PopNotifyWork <PERF> (nt+0x0) (fffff807`4b800000)]
fffff807`4bdfbd85 410fb68433a8d65f00   movzx   eax, byte ptr [r11+rsi+5FD6A8h]
fffff807`4bdfbd8e 418b8c8378d45f00     mov     ecx, dword ptr [r11+rax*4+5FD478h]
fffff807`4bdfbd96 4903cb               add     rcx, r11
fffff807`4bdfbd99 ffe1                 jmp     rcx
fffff807`4bdfbd9b cc                   int     3
fffff807`4bdfbd9c cc                   int     3
fffff807`4bdfbd9d cc                   int     3
fffff807`4bdfbd9e cc                   int     3
fffff807`4bdfbd9f 4183ff40             cmp     r15d, 40h
fffff807`4bdfbda3 0f85d4811e00         jne     nt!ExpQuerySystemInformation+0x1e83ed (fffff807`4bfe3f7d)
fffff807`4bdfbda9 488bcb               mov     rcx, rbx
fffff807`4bdfbdac e8cfdad2ff           call    nt!ExpGetSystemBasicInformation (fffff807`4bb29880)
fffff807`4bdfbdb1 44897c2434           mov     dword ptr [rsp+34h], r15d
fffff807`4bdfbdb6 eba3                 jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfbdb8 8d46fe               lea     eax, [rsi-2]
fffff807`4bdfbdbb 3db3000000           cmp     eax, 0B3h
fffff807`4bdfbdc0 0f8768ffffff         ja      nt!ExpQuerySystemInformation+0x19e (fffff807`4bdfbd2e)
fffff807`4bdfbdc6 4898                 cdqe    
fffff807`4bdfbdc8 0fb68402a4d75f00     movzx   eax, byte ptr [rdx+rax+5FD7A4h]
fffff807`4bdfbdd0 8b8c8280d75f00       mov     ecx, dword ptr [rdx+rax*4+5FD780h]
fffff807`4bdfbdd7 4803ca               add     rcx, rdx
fffff807`4bdfbdda ffe1                 jmp     rcx
fffff807`4bdfbddc cc                   int     3
fffff807`4bdfbddd cc                   int     3
fffff807`4bdfbdde cc                   int     3
fffff807`4bdfbddf cc                   int     3
fffff807`4bdfbde0 8d46fb               lea     eax, [rsi-5]
fffff807`4bdfbde3 3dce000000           cmp     eax, 0CEh
fffff807`4bdfbde8 0f8796feffff         ja      nt!ExpQuerySystemInformation+0xf4 (fffff807`4bdfbc84)
fffff807`4bdfbdee 4898                 cdqe    
fffff807`4bdfbdf0 488d150942a0ff       lea     rdx, [nt!PopNotifyWork <PERF> (nt+0x0) (fffff807`4b800000)]
fffff807`4bdfbdf7 0fb6840268d85f00     movzx   eax, byte ptr [rdx+rax+5FD868h]
fffff807`4bdfbdff 8b8c8258d85f00       mov     ecx, dword ptr [rdx+rax*4+5FD858h]
fffff807`4bdfbe06 4803ca               add     rcx, rdx
fffff807`4bdfbe09 ffe1                 jmp     rcx
fffff807`4bdfbe0b cc                   int     3
fffff807`4bdfbe0c cc                   int     3
fffff807`4bdfbe0d cc                   int     3
fffff807`4bdfbe0e cc                   int     3
fffff807`4bdfbe0f b801000000           mov     eax, 1
fffff807`4bdfbe14 89442440             mov     dword ptr [rsp+40h], eax
fffff807`4bdfbe18 448bc0               mov     r8d, eax
fffff807`4bdfbe1b e972feffff           jmp     nt!ExpQuerySystemInformation+0x102 (fffff807`4bdfbc92)
fffff807`4bdfbe20 837c244c08           cmp     dword ptr [rsp+4Ch], 8
fffff807`4bdfbe25 0f85ee8e1e00         jne     nt!ExpQuerySystemInformation+0x1e9189 (fffff807`4bfe4d19)
fffff807`4bdfbe2b 488b442458           mov     rax, qword ptr [rsp+58h]
fffff807`4bdfbe30 4c8b10               mov     r10, qword ptr [rax]
fffff807`4bdfbe33 4c899424c8010000     mov     qword ptr [rsp+1C8h], r10
fffff807`4bdfbe3b eb05                 jmp     nt!ExpQuerySystemInformation+0x2b2 (fffff807`4bdfbe42)
fffff807`4bdfbe3d e9f51a0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfbe42 440fb7442448         movzx   r8d, word ptr [rsp+48h]
fffff807`4bdfbe48 e9eafeffff           jmp     nt!ExpQuerySystemInformation+0x1a7 (fffff807`4bdfbd37)
fffff807`4bdfbe4d 8b442434             mov     eax, dword ptr [rsp+34h]
fffff807`4bdfbe51 418906               mov     dword ptr [r14], eax
fffff807`4bdfbe54 e90fffffff           jmp     nt!ExpQuerySystemInformation+0x1d8 (fffff807`4bdfbd68)
fffff807`4bdfbe59 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfbe5d e906ffffff           jmp     nt!ExpQuerySystemInformation+0x1d8 (fffff807`4bdfbd68)
fffff807`4bdfbe62 4183ff0c             cmp     r15d, 0Ch
fffff807`4bdfbe66 0f8245811e00         jb      nt!ExpQuerySystemInformation+0x1e8421 (fffff807`4bfe3fb1)
fffff807`4bdfbe6c 488bcb               mov     rcx, rbx
fffff807`4bdfbe6f e8d499c0ff           call    nt!ExpGetSystemProcessorInformation (fffff807`4ba05848)
fffff807`4bdfbe74 c74424340c000000     mov     dword ptr [rsp+34h], 0Ch
fffff807`4bdfbe7c e9dafeffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfbe81 b820000000           mov     eax, 20h
fffff807`4bdfbe86 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfbe8a 443bf8               cmp     r15d, eax
fffff807`4bdfbe8d 0f8587921e00         jne     nt!ExpQuerySystemInformation+0x1e958a (fffff807`4bfe511a)
fffff807`4bdfbe93 488bd3               mov     rdx, rbx
fffff807`4bdfbe96 e885bb0e00           call    nt!ExHandleSPCall2 (fffff807`4bee7a20)
fffff807`4bdfbe9b e9bbfeffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfbea0 418bd7               mov     edx, r15d
fffff807`4bdfbea3 488bcb               mov     rcx, rbx
fffff807`4bdfbea6 e869320c00           call    nt!WbDispatchOperation (fffff807`4bebf114)
fffff807`4bdfbeab e9abfeffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfbeb0 4d85d2               test    r10, r10
fffff807`4bdfbeb3 0f85480a0000         jne     nt!ExpQuerySystemInformation+0xd71 (fffff807`4bdfc901)
fffff807`4bdfbeb9 488bbc2410010000     mov     rdi, qword ptr [rsp+110h]
fffff807`4bdfbec1 4c8bcf               mov     r9, rdi
fffff807`4bdfbec4 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfbec9 418bd7               mov     edx, r15d
fffff807`4bdfbecc 488bcb               mov     rcx, rbx
fffff807`4bdfbecf e84cd30e00           call    nt!PsWow64GetSupportedArchitectures (fffff807`4bee9220)
fffff807`4bdfbed4 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfbed8 4885ff               test    rdi, rdi
fffff807`4bdfbedb 0f847efeffff         je      nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfbee1 488bcf               mov     rcx, rdi
fffff807`4bdfbee4 e8975ac0ff           call    nt!HalPutDmaAdapter (fffff807`4ba01980)
fffff807`4bdfbee9 e971feffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfbeee 4183ff38             cmp     r15d, 38h
fffff807`4bdfbef2 0f85ed801e00         jne     nt!ExpQuerySystemInformation+0x1e8455 (fffff807`4bfe3fe5)
fffff807`4bdfbef8 65488b042588010000   mov     rax, qword ptr gs:[188h]
fffff807`4bdfbf01 488b88b8000000       mov     rcx, qword ptr [rax+0B8h]
fffff807`4bdfbf08 e82f8dceff           call    nt!MmGetProcessPartitionId (fffff807`4bae4c3c)
fffff807`4bdfbf0d 440fb7c0             movzx   r8d, ax
fffff807`4bdfbf11 488b0df0246500       mov     rcx, qword ptr [nt!MiState+0x1d48 (fffff807`4c44e408)]
fffff807`4bdfbf18 4a8b14c1             mov     rdx, qword ptr [rcx+r8*8]
fffff807`4bdfbf1c 488b8a101b0000       mov     rcx, qword ptr [rdx+1B10h]
fffff807`4bdfbf23 48c1e10c             shl     rcx, 0Ch
fffff807`4bdfbf27 48898c24f0050000     mov     qword ptr [rsp+5F0h], rcx
fffff807`4bdfbf2f 410fb7c8             movzx   ecx, r8w
fffff807`4bdfbf33 e8e48cceff           call    nt!MmGetAvailablePages (fffff807`4bae4c1c)
fffff807`4bdfbf38 48c1e00c             shl     rax, 0Ch
fffff807`4bdfbf3c 48898424f8050000     mov     qword ptr [rsp+5F8h], rax
fffff807`4bdfbf44 e8bf8aceff           call    nt!MmGetResidentAvailablePages (fffff807`4bae4a08)
fffff807`4bdfbf49 48c1e00c             shl     rax, 0Ch
fffff807`4bdfbf4d 4889842400060000     mov     qword ptr [rsp+600h], rax
fffff807`4bdfbf55 e8a28cceff           call    nt!MmGetTotalCommittedPages (fffff807`4bae4bfc)
fffff807`4bdfbf5a 48c1e00c             shl     rax, 0Ch
fffff807`4bdfbf5e 4889842408060000     mov     qword ptr [rsp+608h], rax
fffff807`4bdfbf66 e8718cceff           call    nt!MmGetTotalCommitLimit (fffff807`4bae4bdc)
fffff807`4bdfbf6b 48c1e00c             shl     rax, 0Ch
fffff807`4bdfbf6f 4889842418060000     mov     qword ptr [rsp+618h], rax
fffff807`4bdfbf77 e8408cceff           call    nt!MmGetPeakCommitment (fffff807`4bae4bbc)
fffff807`4bdfbf7c 48c1e00c             shl     rax, 0Ch
fffff807`4bdfbf80 4889842420060000     mov     qword ptr [rsp+620h], rax
fffff807`4bdfbf88 e86b8aceff           call    nt!MmGetSharedCommit (fffff807`4bae49f8)
fffff807`4bdfbf8d 48c1e00c             shl     rax, 0Ch
fffff807`4bdfbf91 4889842410060000     mov     qword ptr [rsp+610h], rax
fffff807`4bdfbf99 488b8424f8050000     mov     rax, qword ptr [rsp+5F8h]
fffff807`4bdfbfa1 48398424f0050000     cmp     qword ptr [rsp+5F0h], rax
fffff807`4bdfbfa9 0f8250801e00         jb      nt!ExpQuerySystemInformation+0x1e846f (fffff807`4bfe3fff)
fffff807`4bdfbfaf 488b842408060000     mov     rax, qword ptr [rsp+608h]
fffff807`4bdfbfb7 4839842418060000     cmp     qword ptr [rsp+618h], rax
fffff807`4bdfbfbf 0f8247801e00         jb      nt!ExpQuerySystemInformation+0x1e847c (fffff807`4bfe400c)
fffff807`4bdfbfc5 4839842420060000     cmp     qword ptr [rsp+620h], rax
fffff807`4bdfbfcd 0f8246801e00         jb      nt!ExpQuerySystemInformation+0x1e8489 (fffff807`4bfe4019)
fffff807`4bdfbfd3 0f288424f0050000     movaps  xmm0, xmmword ptr [rsp+5F0h]
fffff807`4bdfbfdb 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfbfde 0f288c2400060000     movaps  xmm1, xmmword ptr [rsp+600h]
fffff807`4bdfbfe6 0f114b10             movups  xmmword ptr [rbx+10h], xmm1
fffff807`4bdfbfea 0f28842410060000     movaps  xmm0, xmmword ptr [rsp+610h]
fffff807`4bdfbff2 0f114320             movups  xmmword ptr [rbx+20h], xmm0
fffff807`4bdfbff6 f20f108c2420060000   movsd   xmm1, mmword ptr [rsp+620h]
fffff807`4bdfbfff f20f114b30           movsd   mmword ptr [rbx+30h], xmm1
fffff807`4bdfc004 eb05                 jmp     nt!ExpQuerySystemInformation+0x47b (fffff807`4bdfc00b)
fffff807`4bdfc006 e92c190000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc00b c744243438000000     mov     dword ptr [rsp+34h], 38h
fffff807`4bdfc013 e947fdffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc018 458be5               mov     r12d, r13d
fffff807`4bdfc01b 6644896c2454         mov     word ptr [rsp+54h], r13w
fffff807`4bdfc021 418bcd               mov     ecx, r13d
fffff807`4bdfc024 e867a5c0ff           call    nt!KeQueryActiveProcessorCountEx (fffff807`4ba06590)
fffff807`4bdfc029 448bc8               mov     r9d, eax
fffff807`4bdfc02c 89442470             mov     dword ptr [rsp+70h], eax
fffff807`4bdfc030 e9f9fcffff           jmp     nt!ExpQuerySystemInformation+0x19e (fffff807`4bdfbd2e)
fffff807`4bdfc035 4181ff38010000       cmp     r15d, 138h
fffff807`4bdfc03c 0f8226801e00         jb      nt!ExpQuerySystemInformation+0x1e84d8 (fffff807`4bfe4068)
fffff807`4bdfc042 4181ff58010000       cmp     r15d, 158h
fffff807`4bdfc049 0f8733801e00         ja      nt!ExpQuerySystemInformation+0x1e84f2 (fffff807`4bfe4082)
fffff807`4bdfc04f 458bc7               mov     r8d, r15d
fffff807`4bdfc052 488bd3               mov     rdx, rbx
fffff807`4bdfc055 418bc9               mov     ecx, r9d
fffff807`4bdfc058 e823c40900           call    nt!ExpQuerySystemPerformanceInformation (fffff807`4be98480)
fffff807`4bdfc05d eb05                 jmp     nt!ExpQuerySystemInformation+0x4d4 (fffff807`4bdfc064)
fffff807`4bdfc05f e9d3180000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc064 44897c2434           mov     dword ptr [rsp+34h], r15d
fffff807`4bdfc069 e9f1fcffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc06e 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfc073 418bd7               mov     edx, r15d
fffff807`4bdfc076 488bcb               mov     rcx, rbx
fffff807`4bdfc079 e822fa1600           call    nt!ExpQueryChannelInformation (fffff807`4bf6baa0)
fffff807`4bdfc07e e9d8fcffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc083 837c244c02           cmp     dword ptr [rsp+4Ch], 2
fffff807`4bdfc088 0f828b8c1e00         jb      nt!ExpQuerySystemInformation+0x1e9189 (fffff807`4bfe4d19)
fffff807`4bdfc08e 488b442458           mov     rax, qword ptr [rsp+58h]
fffff807`4bdfc093 440fb720             movzx   r12d, word ptr [rax]
fffff807`4bdfc097 664489642454         mov     word ptr [rsp+54h], r12w
fffff807`4bdfc09d eb05                 jmp     nt!ExpQuerySystemInformation+0x514 (fffff807`4bdfc0a4)
fffff807`4bdfc09f e993180000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc0a4 e8f74bc5ff           call    nt!KeQueryActiveGroupCount (fffff807`4ba50ca0)
fffff807`4bdfc0a9 66443be0             cmp     r12w, ax
fffff807`4bdfc0ad 0f83668c1e00         jae     nt!ExpQuerySystemInformation+0x1e9189 (fffff807`4bfe4d19)
fffff807`4bdfc0b3 410fb7cc             movzx   ecx, r12w
fffff807`4bdfc0b7 e8d4a4c0ff           call    nt!KeQueryActiveProcessorCountEx (fffff807`4ba06590)
fffff807`4bdfc0bc 448bc8               mov     r9d, eax
fffff807`4bdfc0bf 89442470             mov     dword ptr [rsp+70h], eax
fffff807`4bdfc0c3 e966fcffff           jmp     nt!ExpQuerySystemInformation+0x19e (fffff807`4bdfbd2e)
fffff807`4bdfc0c8 837c244c04           cmp     dword ptr [rsp+4Ch], 4
fffff807`4bdfc0cd 0f82468c1e00         jb      nt!ExpQuerySystemInformation+0x1e9189 (fffff807`4bfe4d19)
fffff807`4bdfc0d3 488b442458           mov     rax, qword ptr [rsp+58h]
fffff807`4bdfc0d8 448b28               mov     r13d, dword ptr [rax]
fffff807`4bdfc0db 4489ac242c010000     mov     dword ptr [rsp+12Ch], r13d
fffff807`4bdfc0e3 e946fcffff           jmp     nt!ExpQuerySystemInformation+0x19e (fffff807`4bdfbd2e)
fffff807`4bdfc0e8 e94a180000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc0ed 44897c2434           mov     dword ptr [rsp+34h], r15d
fffff807`4bdfc0f2 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfc0f7 4c8bc3               mov     r8, rbx
fffff807`4bdfc0fa 418bd5               mov     edx, r13d
fffff807`4bdfc0fd 33c9                 xor     ecx, ecx
fffff807`4bdfc0ff e85c98c0ff           call    nt!KeQueryLogicalProcessorRelationship (fffff807`4ba05960)
fffff807`4bdfc104 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfc108 e952fcffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc10d e925180000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc112 4183ff30             cmp     r15d, 30h
fffff807`4bdfc116 0f87ff801e00         ja      nt!ExpQuerySystemInformation+0x1e868b (fffff807`4bfe421b)
fffff807`4bdfc11c 4c8d842410060000     lea     r8, [rsp+610h]
fffff807`4bdfc124 488d9424f0050000     lea     rdx, [rsp+5F0h]
fffff807`4bdfc12c 488d8c24f8050000     lea     rcx, [rsp+5F8h]
fffff807`4bdfc134 e8f70fd4ff           call    nt!KeQueryBootTimeValues (fffff807`4bb3d130)
fffff807`4bdfc139 488b0550d16100       mov     rax, qword ptr [nt!ExpTimeZoneBias (fffff807`4c419290)]
fffff807`4bdfc140 4889842400060000     mov     qword ptr [rsp+600h], rax
fffff807`4bdfc148 8b05deee7200         mov     eax, dword ptr [nt!ExpCurrentTimeZoneId (fffff807`4c52b02c)]
fffff807`4bdfc14e 89842408060000       mov     dword ptr [rsp+608h], eax
fffff807`4bdfc155 48b8b003000080f7ffff mov     rax, 0FFFFF780000003B0h
fffff807`4bdfc15f 488b00               mov     rax, qword ptr [rax]
fffff807`4bdfc162 4889842418060000     mov     qword ptr [rsp+618h], rax
fffff807`4bdfc16a 4d8bc7               mov     r8, r15
fffff807`4bdfc16d 488d9424f0050000     lea     rdx, [rsp+5F0h]
fffff807`4bdfc175 488bcb               mov     rcx, rbx
fffff807`4bdfc178 e8034cdfff           call    nt!memcpy (fffff807`4bbf0d80)
fffff807`4bdfc17d e9e2feffff           jmp     nt!ExpQuerySystemInformation+0x4d4 (fffff807`4bdfc064)
fffff807`4bdfc182 e9b0170000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc187 0fb64c2438           movzx   ecx, byte ptr [rsp+38h]
fffff807`4bdfc18c e887b60300           call    nt!ExIsRestrictedCaller (fffff807`4be37818)
fffff807`4bdfc191 85c0                 test    eax, eax
fffff807`4bdfc193 0f853a8e1e00         jne     nt!ExpQuerySystemInformation+0x1e9443 (fffff807`4bfe4fd3)
fffff807`4bdfc199 65488b042588010000   mov     rax, qword ptr gs:[188h]
fffff807`4bdfc1a2 66ff88e4010000       dec     word ptr [rax+1E4h]
fffff807`4bdfc1a9 b201                 mov     dl, 1
fffff807`4bdfc1ab 488d0dcee06200       lea     rcx, [nt!PsLoadedModuleResource (fffff807`4c42a280)]
fffff807`4bdfc1b2 e8696fc2ff           call    nt!ExAcquireResourceExclusiveLite (fffff807`4ba23120)
fffff807`4bdfc1b7 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfc1bc 458bc7               mov     r8d, r15d
fffff807`4bdfc1bf 488bd3               mov     rdx, rbx
fffff807`4bdfc1c2 e809940200           call    nt!ExpQueryModuleInformation (fffff807`4be255d0)
fffff807`4bdfc1c7 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfc1cb 488d0daee06200       lea     rcx, [nt!PsLoadedModuleResource (fffff807`4c42a280)]
fffff807`4bdfc1d2 e89967c2ff           call    nt!ExReleaseResourceLite (fffff807`4ba22970)
fffff807`4bdfc1d7 e85467c2ff           call    nt!KeLeaveCriticalRegion (fffff807`4ba22930)
fffff807`4bdfc1dc e97efbffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc1e1 b930000000           mov     ecx, 30h
fffff807`4bdfc1e6 b848000000           mov     eax, 48h
fffff807`4bdfc1eb 83fe08               cmp     esi, 8
fffff807`4bdfc1ee 0f45c8               cmovne  ecx, eax
fffff807`4bdfc1f1 894c244c             mov     dword ptr [rsp+4Ch], ecx
fffff807`4bdfc1f5 4585ff               test    r15d, r15d
fffff807`4bdfc1f8 0f848f7e1e00         je      nt!ExpQuerySystemInformation+0x1e84fd (fffff807`4bfe408d)
fffff807`4bdfc1fe 33d2                 xor     edx, edx
fffff807`4bdfc200 418bc7               mov     eax, r15d
fffff807`4bdfc203 f7f1                 div     eax, ecx
fffff807`4bdfc205 85d2                 test    edx, edx
fffff807`4bdfc207 0f85807e1e00         jne     nt!ExpQuerySystemInformation+0x1e84fd (fffff807`4bfe408d)
fffff807`4bdfc20d 897c2450             mov     dword ptr [rsp+50h], edi
fffff807`4bdfc211 448bef               mov     r13d, edi
fffff807`4bdfc214 897c2444             mov     dword ptr [rsp+44h], edi
fffff807`4bdfc218 48899c2400010000     mov     qword ptr [rsp+100h], rbx
fffff807`4bdfc220 453be9               cmp     r13d, r9d
fffff807`4bdfc223 0f8316010000         jae     nt!ExpQuerySystemInformation+0x7af (fffff807`4bdfc33f)
fffff807`4bdfc229 66448964243c         mov     word ptr [rsp+3Ch], r12w
fffff807`4bdfc22f 44886c243e           mov     byte ptr [rsp+3Eh], r13b
fffff807`4bdfc234 c644243f00           mov     byte ptr [rsp+3Fh], 0
fffff807`4bdfc239 488d4c243c           lea     rcx, [rsp+3Ch]
fffff807`4bdfc23e e80db5c0ff           call    nt!KeGetProcessorIndexFromNumber (fffff807`4ba07750)
fffff807`4bdfc243 8bc8                 mov     ecx, eax
fffff807`4bdfc245 488d05b43da0ff       lea     rax, [nt!PopNotifyWork <PERF> (nt+0x0) (fffff807`4b800000)]
fffff807`4bdfc24c 488b84c880cccf00     mov     rax, qword ptr [rax+rcx*8+0CFCC80h]
fffff807`4bdfc254 4889442458           mov     qword ptr [rsp+58h], rax
fffff807`4bdfc259 8b4c244c             mov     ecx, dword ptr [rsp+4Ch]
fffff807`4bdfc25d 8b442450             mov     eax, dword ptr [rsp+50h]
fffff807`4bdfc261 03c8                 add     ecx, eax
fffff807`4bdfc263 443bf9               cmp     r15d, ecx
fffff807`4bdfc266 0f82d7000000         jb      nt!ExpQuerySystemInformation+0x7b3 (fffff807`4bdfc343)
fffff807`4bdfc26c 894c2450             mov     dword ptr [rsp+50h], ecx
fffff807`4bdfc270 4c8d8424f0050000     lea     r8, [rsp+5F0h]
fffff807`4bdfc278 33d2                 xor     edx, edx
fffff807`4bdfc27a 488d4c243c           lea     rcx, [rsp+3Ch]
fffff807`4bdfc27f e88cb3c0ff           call    nt!PoGetIdleTimes (fffff807`4ba07610)
fffff807`4bdfc284 90                   nop     
fffff807`4bdfc285 488b542458           mov     rdx, qword ptr [rsp+58h]
fffff807`4bdfc28a 8b8a887e0000         mov     ecx, dword ptr [rdx+7E88h]
fffff807`4bdfc290 8b0582f16f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfc296 480fafc8             imul    rcx, rax
fffff807`4bdfc29a 48894b10             mov     qword ptr [rbx+10h], rcx
fffff807`4bdfc29e 8b8c24f4050000       mov     ecx, dword ptr [rsp+5F4h]
fffff807`4bdfc2a5 8b056df16f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfc2ab 480fafc8             imul    rcx, rax
fffff807`4bdfc2af 48894b08             mov     qword ptr [rbx+8], rcx
fffff807`4bdfc2b3 8b8a8c7e0000         mov     ecx, dword ptr [rdx+7E8Ch]
fffff807`4bdfc2b9 8b0559f16f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfc2bf 480fafc8             imul    rcx, rax
fffff807`4bdfc2c3 48894b18             mov     qword ptr [rbx+18h], rcx
fffff807`4bdfc2c7 8b8a907e0000         mov     ecx, dword ptr [rdx+7E90h]
fffff807`4bdfc2cd 8b0545f16f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfc2d3 480fafc8             imul    rcx, rax
fffff807`4bdfc2d7 48894b20             mov     qword ptr [rbx+20h], rcx
fffff807`4bdfc2db 8b8c24f0050000       mov     ecx, dword ptr [rsp+5F0h]
fffff807`4bdfc2e2 8b0530f16f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfc2e8 480fafc8             imul    rcx, rax
fffff807`4bdfc2ec 48890b               mov     qword ptr [rbx], rcx
fffff807`4bdfc2ef 8b82807e0000         mov     eax, dword ptr [rdx+7E80h]
fffff807`4bdfc2f5 894328               mov     dword ptr [rbx+28h], eax
fffff807`4bdfc2f8 81fe8d000000         cmp     esi, 8Dh
fffff807`4bdfc2fe 751f                 jne     nt!ExpQuerySystemInformation+0x78f (fffff807`4bdfc31f)
fffff807`4bdfc300 8b8aac7e0000         mov     ecx, dword ptr [rdx+7EACh]
fffff807`4bdfc306 8b050cf16f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfc30c 480fafc8             imul    rcx, rax
fffff807`4bdfc310 48894b30             mov     qword ptr [rbx+30h], rcx
fffff807`4bdfc314 897b2c               mov     dword ptr [rbx+2Ch], edi
fffff807`4bdfc317 48897b38             mov     qword ptr [rbx+38h], rdi
fffff807`4bdfc31b 48897b40             mov     qword ptr [rbx+40h], rdi
fffff807`4bdfc31f eb05                 jmp     nt!ExpQuerySystemInformation+0x796 (fffff807`4bdfc326)
fffff807`4bdfc321 e911160000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc326 8b4c244c             mov     ecx, dword ptr [rsp+4Ch]
fffff807`4bdfc32a 4803d9               add     rbx, rcx
fffff807`4bdfc32d 41ffc5               inc     r13d
fffff807`4bdfc330 44896c2444           mov     dword ptr [rsp+44h], r13d
fffff807`4bdfc335 448b4c2470           mov     r9d, dword ptr [rsp+70h]
fffff807`4bdfc33a e9d9feffff           jmp     nt!ExpQuerySystemInformation+0x688 (fffff807`4bdfc218)
fffff807`4bdfc33f 8b442450             mov     eax, dword ptr [rsp+50h]
fffff807`4bdfc343 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfc347 e913faffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc34c 89742420             mov     dword ptr [rsp+20h], esi
fffff807`4bdfc350 4533c9               xor     r9d, r9d
fffff807`4bdfc353 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfc358 418bd7               mov     edx, r15d
fffff807`4bdfc35b 488bcb               mov     rcx, rbx
fffff807`4bdfc35e e8bdb6ffff           call    nt!ExpGetProcessInformation (fffff807`4bdf7a20)
fffff807`4bdfc363 e9f3f9ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc368 4181ffb0010000       cmp     r15d, 1B0h
fffff807`4bdfc36f 0f82e1861e00         jb      nt!ExpQuerySystemInformation+0x1e8ec6 (fffff807`4bfe4a56)
fffff807`4bdfc375 b101                 mov     cl, 1
fffff807`4bdfc377 e80cd40300           call    nt!ExAcquireTimeRefreshLock (fffff807`4be39788)
fffff807`4bdfc37c 90                   nop     
fffff807`4bdfc37d 488d0d0c0e7300       lea     rcx, [nt!ExpTimeZoneInformation (fffff807`4c52d190)]
fffff807`4bdfc384 b803000000           mov     eax, 3
fffff807`4bdfc389 0f1001               movups  xmm0, xmmword ptr [rcx]
fffff807`4bdfc38c 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfc38f 0f104910             movups  xmm1, xmmword ptr [rcx+10h]
fffff807`4bdfc393 0f114b10             movups  xmmword ptr [rbx+10h], xmm1
fffff807`4bdfc397 0f104120             movups  xmm0, xmmword ptr [rcx+20h]
fffff807`4bdfc39b 0f114320             movups  xmmword ptr [rbx+20h], xmm0
fffff807`4bdfc39f 0f104930             movups  xmm1, xmmword ptr [rcx+30h]
fffff807`4bdfc3a3 0f114b30             movups  xmmword ptr [rbx+30h], xmm1
fffff807`4bdfc3a7 0f104140             movups  xmm0, xmmword ptr [rcx+40h]
fffff807`4bdfc3ab 0f114340             movups  xmmword ptr [rbx+40h], xmm0
fffff807`4bdfc3af 0f104950             movups  xmm1, xmmword ptr [rcx+50h]
fffff807`4bdfc3b3 0f114b50             movups  xmmword ptr [rbx+50h], xmm1
fffff807`4bdfc3b7 0f104160             movups  xmm0, xmmword ptr [rcx+60h]
fffff807`4bdfc3bb 0f114360             movups  xmmword ptr [rbx+60h], xmm0
fffff807`4bdfc3bf 488d9b80000000       lea     rbx, [rbx+80h]
fffff807`4bdfc3c6 0f104970             movups  xmm1, xmmword ptr [rcx+70h]
fffff807`4bdfc3ca 0f114bf0             movups  xmmword ptr [rbx-10h], xmm1
fffff807`4bdfc3ce 488d8980000000       lea     rcx, [rcx+80h]
fffff807`4bdfc3d5 4883e801             sub     rax, 1
fffff807`4bdfc3d9 75ae                 jne     nt!ExpQuerySystemInformation+0x7f9 (fffff807`4bdfc389)
fffff807`4bdfc3db 0f1001               movups  xmm0, xmmword ptr [rcx]
fffff807`4bdfc3de 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfc3e1 0f104910             movups  xmm1, xmmword ptr [rcx+10h]
fffff807`4bdfc3e5 0f114b10             movups  xmmword ptr [rbx+10h], xmm1
fffff807`4bdfc3e9 0f104120             movups  xmm0, xmmword ptr [rcx+20h]
fffff807`4bdfc3ed 0f114320             movups  xmmword ptr [rbx+20h], xmm0
fffff807`4bdfc3f1 eb0e                 jmp     nt!ExpQuerySystemInformation+0x871 (fffff807`4bdfc401)
fffff807`4bdfc3f3 8bd8                 mov     ebx, eax
fffff807`4bdfc3f5 e86ad30300           call    nt!ExReleaseTimeRefreshLock (fffff807`4be39764)
fffff807`4bdfc3fa 8bc3                 mov     eax, ebx
fffff807`4bdfc3fc e936150000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc401 e85ed30300           call    nt!ExReleaseTimeRefreshLock (fffff807`4be39764)
fffff807`4bdfc406 c7442434b0010000     mov     dword ptr [rsp+34h], 1B0h
fffff807`4bdfc40e 897c2430             mov     dword ptr [rsp+30h], edi
fffff807`4bdfc412 e948f9ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc417 488d15e23ba0ff       lea     rdx, [nt!PopNotifyWork <PERF> (nt+0x0) (fffff807`4b800000)]
fffff807`4bdfc41e c744244001000000     mov     dword ptr [rsp+40h], 1
fffff807`4bdfc426 e9a2f8ffff           jmp     nt!ExpQuerySystemInformation+0x13d (fffff807`4bdfbccd)
fffff807`4bdfc42b 488d442434           lea     rax, [rsp+34h]
fffff807`4bdfc430 4889442420           mov     qword ptr [rsp+20h], rax
fffff807`4bdfc435 458bc7               mov     r8d, r15d
fffff807`4bdfc438 488bd3               mov     rdx, rbx
fffff807`4bdfc43b 48c7c1ffffffff       mov     rcx, 0FFFFFFFFFFFFFFFFh
fffff807`4bdfc442 e8c905c3ff           call    nt!MmQueryMemoryListInformation (fffff807`4ba2ca10)
fffff807`4bdfc447 e90ff9ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc44c 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfc451 418bd7               mov     edx, r15d
fffff807`4bdfc454 488bcb               mov     rcx, rbx
fffff807`4bdfc457 e824221000           call    nt!SeCodeIntegrityQueryInformation (fffff807`4befe680)
fffff807`4bdfc45c e9faf8ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc461 4183ff40             cmp     r15d, 40h
fffff807`4bdfc465 0f852c7b1e00         jne     nt!ExpQuerySystemInformation+0x1e8407 (fffff807`4bfe3f97)
fffff807`4bdfc46b 488bcb               mov     rcx, rbx
fffff807`4bdfc46e e871d2d2ff           call    nt!ExpGetSystemEmulationBasicInformation (fffff807`4bb296e4)
fffff807`4bdfc473 44897c2434           mov     dword ptr [rsp+34h], r15d
fffff807`4bdfc478 e9def8ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc47d c7442430bb0000c0     mov     dword ptr [rsp+30h], 0C00000BBh
fffff807`4bdfc485 e9d5f8ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc48a 488d442434           lea     rax, [rsp+34h]
fffff807`4bdfc48f 4889442428           mov     qword ptr [rsp+28h], rax
fffff807`4bdfc494 44897c2420           mov     dword ptr [rsp+20h], r15d
fffff807`4bdfc499 4c8bcb               mov     r9, rbx
fffff807`4bdfc49c 448b44244c           mov     r8d, dword ptr [rsp+4Ch]
fffff807`4bdfc4a1 488b542458           mov     rdx, qword ptr [rsp+58h]
fffff807`4bdfc4a6 8bce                 mov     ecx, esi
fffff807`4bdfc4a8 e84381ffff           call    nt!SeCodeIntegrityQueryPolicyInformation (fffff807`4bdf45f0)
fffff807`4bdfc4ad e9a9f8ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc4b2 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfc4b7 418bd7               mov     edx, r15d
fffff807`4bdfc4ba 488bcb               mov     rcx, rbx
fffff807`4bdfc4bd e84e8dfeff           call    nt!ExpQueryNumaProcessorMap (fffff807`4bde5210)
fffff807`4bdfc4c2 e994f8ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc4c7 c744243408000000     mov     dword ptr [rsp+34h], 8
fffff807`4bdfc4cf 4183ff08             cmp     r15d, 8
fffff807`4bdfc4d3 0f828a941e00         jb      nt!ExpQuerySystemInformation+0x1e9dd3 (fffff807`4bfe5963)
fffff807`4bdfc4d9 488b0568176500       mov     rax, qword ptr [nt!MiState+0x1588 (fffff807`4c44dc48)]
fffff807`4bdfc4e0 33c9                 xor     ecx, ecx
fffff807`4bdfc4e2 48890b               mov     qword ptr [rbx], rcx
fffff807`4bdfc4e5 488903               mov     qword ptr [rbx], rax
fffff807`4bdfc4e8 e972f8ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc4ed 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfc4f1 4c8b742468           mov     r14, qword ptr [rsp+68h]
fffff807`4bdfc4f6 e964f8ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc4fb 4183ff20             cmp     r15d, 20h
fffff807`4bdfc4ff 0f82d68f1e00         jb      nt!ExpQuerySystemInformation+0x1e994b (fffff807`4bfe54db)
fffff807`4bdfc505 488bcb               mov     rcx, rbx
fffff807`4bdfc508 e8c3211000           call    nt!ExpGetSystemFlushInformation (fffff807`4befe6d0)
fffff807`4bdfc50d 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfc511 b820000000           mov     eax, 20h
fffff807`4bdfc516 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfc51a e940f8ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc51f 4183ff40             cmp     r15d, 40h
fffff807`4bdfc523 0f8296811e00         jb      nt!ExpQuerySystemInformation+0x1e8b2f (fffff807`4bfe46bf)
fffff807`4bdfc529 b802000000           mov     eax, 2
fffff807`4bdfc52e 83fe77               cmp     esi, 77h
fffff807`4bdfc531 0f84f3040000         je      nt!ExpQuerySystemInformation+0xe9a (fffff807`4bdfca2a)
fffff807`4bdfc537 83fe78               cmp     esi, 78h
fffff807`4bdfc53a 0f8499811e00         je      nt!ExpQuerySystemInformation+0x1e8b49 (fffff807`4bfe46d9)
fffff807`4bdfc540 488d9424f0050000     lea     rdx, [rsp+5F0h]
fffff807`4bdfc548 8bc8                 mov     ecx, eax
fffff807`4bdfc54a e81d46d4ff           call    nt!MmQuerySystemWorkingSetInformation (fffff807`4bb40b6c)
fffff807`4bdfc54f 90                   nop     
fffff807`4bdfc550 488b8424f0050000     mov     rax, qword ptr [rsp+5F0h]
fffff807`4bdfc558 488903               mov     qword ptr [rbx], rax
fffff807`4bdfc55b 488b8424f8050000     mov     rax, qword ptr [rsp+5F8h]
fffff807`4bdfc563 48894308             mov     qword ptr [rbx+8], rax
fffff807`4bdfc567 8b842400060000       mov     eax, dword ptr [rsp+600h]
fffff807`4bdfc56e 894310               mov     dword ptr [rbx+10h], eax
fffff807`4bdfc571 eb05                 jmp     nt!ExpQuerySystemInformation+0x9e8 (fffff807`4bdfc578)
fffff807`4bdfc573 e9bf130000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc578 c744244440000000     mov     dword ptr [rsp+44h], 40h
fffff807`4bdfc580 488b842408060000     mov     rax, qword ptr [rsp+608h]
fffff807`4bdfc588 48894318             mov     qword ptr [rbx+18h], rax
fffff807`4bdfc58c 488b842410060000     mov     rax, qword ptr [rsp+610h]
fffff807`4bdfc594 48894320             mov     qword ptr [rbx+20h], rax
fffff807`4bdfc598 488b842418060000     mov     rax, qword ptr [rsp+618h]
fffff807`4bdfc5a0 48894328             mov     qword ptr [rbx+28h], rax
fffff807`4bdfc5a4 488b842420060000     mov     rax, qword ptr [rsp+620h]
fffff807`4bdfc5ac 48894330             mov     qword ptr [rbx+30h], rax
fffff807`4bdfc5b0 8b842428060000       mov     eax, dword ptr [rsp+628h]
fffff807`4bdfc5b7 894338               mov     dword ptr [rbx+38h], eax
fffff807`4bdfc5ba 8b84242c060000       mov     eax, dword ptr [rsp+62Ch]
fffff807`4bdfc5c1 89433c               mov     dword ptr [rbx+3Ch], eax
fffff807`4bdfc5c4 eb05                 jmp     nt!ExpQuerySystemInformation+0xa3b (fffff807`4bdfc5cb)
fffff807`4bdfc5c6 e96c130000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc5cb c744243440000000     mov     dword ptr [rsp+34h], 40h
fffff807`4bdfc5d3 e987f7ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc5d8 4181ffac000000       cmp     r15d, 0ACh
fffff807`4bdfc5df 0f8257841e00         jb      nt!ExpQuerySystemInformation+0x1e8eac (fffff807`4bfe4a3c)
fffff807`4bdfc5e5 b101                 mov     cl, 1
fffff807`4bdfc5e7 e89cd10300           call    nt!ExAcquireTimeRefreshLock (fffff807`4be39788)
fffff807`4bdfc5ec 90                   nop     
fffff807`4bdfc5ed 488d0d9c0b7300       lea     rcx, [nt!ExpTimeZoneInformation (fffff807`4c52d190)]
fffff807`4bdfc5f4 0f1001               movups  xmm0, xmmword ptr [rcx]
fffff807`4bdfc5f7 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfc5fa 0f104910             movups  xmm1, xmmword ptr [rcx+10h]
fffff807`4bdfc5fe 0f114b10             movups  xmmword ptr [rbx+10h], xmm1
fffff807`4bdfc602 0f104120             movups  xmm0, xmmword ptr [rcx+20h]
fffff807`4bdfc606 0f114320             movups  xmmword ptr [rbx+20h], xmm0
fffff807`4bdfc60a 0f104930             movups  xmm1, xmmword ptr [rcx+30h]
fffff807`4bdfc60e 0f114b30             movups  xmmword ptr [rbx+30h], xmm1
fffff807`4bdfc612 0f104140             movups  xmm0, xmmword ptr [rcx+40h]
fffff807`4bdfc616 0f114340             movups  xmmword ptr [rbx+40h], xmm0
fffff807`4bdfc61a 0f104950             movups  xmm1, xmmword ptr [rcx+50h]
fffff807`4bdfc61e 0f114b50             movups  xmmword ptr [rbx+50h], xmm1
fffff807`4bdfc622 0f104160             movups  xmm0, xmmword ptr [rcx+60h]
fffff807`4bdfc626 0f114360             movups  xmmword ptr [rbx+60h], xmm0
fffff807`4bdfc62a 0f104970             movups  xmm1, xmmword ptr [rcx+70h]
fffff807`4bdfc62e 0f114b70             movups  xmmword ptr [rbx+70h], xmm1
fffff807`4bdfc632 0f108180000000       movups  xmm0, xmmword ptr [rcx+80h]
fffff807`4bdfc639 0f118380000000       movups  xmmword ptr [rbx+80h], xmm0
fffff807`4bdfc640 0f108990000000       movups  xmm1, xmmword ptr [rcx+90h]
fffff807`4bdfc647 0f118b90000000       movups  xmmword ptr [rbx+90h], xmm1
fffff807`4bdfc64e 488b81a0000000       mov     rax, qword ptr [rcx+0A0h]
fffff807`4bdfc655 488983a0000000       mov     qword ptr [rbx+0A0h], rax
fffff807`4bdfc65c 8b81a8000000         mov     eax, dword ptr [rcx+0A8h]
fffff807`4bdfc662 8983a8000000         mov     dword ptr [rbx+0A8h], eax
fffff807`4bdfc668 eb0e                 jmp     nt!ExpQuerySystemInformation+0xae8 (fffff807`4bdfc678)
fffff807`4bdfc66a 8bd8                 mov     ebx, eax
fffff807`4bdfc66c e8f3d00300           call    nt!ExReleaseTimeRefreshLock (fffff807`4be39764)
fffff807`4bdfc671 8bc3                 mov     eax, ebx
fffff807`4bdfc673 e9bf120000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc678 e8e7d00300           call    nt!ExReleaseTimeRefreshLock (fffff807`4be39764)
fffff807`4bdfc67d c7442434ac000000     mov     dword ptr [rsp+34h], 0ACh
fffff807`4bdfc685 897c2430             mov     dword ptr [rsp+30h], edi
fffff807`4bdfc689 e9d1f6ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc68e 4183ff08             cmp     r15d, 8
fffff807`4bdfc692 0f85ee831e00         jne     nt!ExpQuerySystemInformation+0x1e8ef6 (fffff807`4bfe4a86)
fffff807`4bdfc698 48b8000000000080ffff mov     rax, 0FFFF800000000000h
fffff807`4bdfc6a2 488903               mov     qword ptr [rbx], rax
fffff807`4bdfc6a5 eb05                 jmp     nt!ExpQuerySystemInformation+0xb1c (fffff807`4bdfc6ac)
fffff807`4bdfc6a7 e98b120000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc6ac c744243408000000     mov     dword ptr [rsp+34h], 8
fffff807`4bdfc6b4 e9a6f6ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc6b9 65488b042588010000   mov     rax, qword ptr gs:[188h]
fffff807`4bdfc6c2 0fb68832020000       movzx   ecx, byte ptr [rax+232h]
fffff807`4bdfc6c9 884c2428             mov     byte ptr [rsp+28h], cl
fffff807`4bdfc6cd 488d442434           lea     rax, [rsp+34h]
fffff807`4bdfc6d2 4889442420           mov     qword ptr [rsp+20h], rax
fffff807`4bdfc6d7 458bcf               mov     r9d, r15d
fffff807`4bdfc6da 4c8bc3               mov     r8, rbx
fffff807`4bdfc6dd 8b54244c             mov     edx, dword ptr [rsp+4Ch]
fffff807`4bdfc6e1 488b4c2458           mov     rcx, qword ptr [rsp+58h]
fffff807`4bdfc6e6 e8c1690f00           call    nt!CmQueryFeatureConfigurationSections (fffff807`4bef30ac)
fffff807`4bdfc6eb e96bf6ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc6f0 4183ff20             cmp     r15d, 20h
fffff807`4bdfc6f4 0f8546791e00         jne     nt!ExpQuerySystemInformation+0x1e84b0 (fffff807`4bfe4040)
fffff807`4bdfc6fa 65488b042588010000   mov     rax, qword ptr gs:[188h]
fffff807`4bdfc703 488b88b8000000       mov     rcx, qword ptr [rax+0B8h]
fffff807`4bdfc70a e82d85ceff           call    nt!MmGetProcessPartitionId (fffff807`4bae4c3c)
fffff807`4bdfc70f 0fb7c8               movzx   ecx, ax
fffff807`4bdfc712 e80585ceff           call    nt!MmGetAvailablePages (fffff807`4bae4c1c)
fffff807`4bdfc717 48898424f0050000     mov     qword ptr [rsp+5F0h], rax
fffff807`4bdfc71f e8d884ceff           call    nt!MmGetTotalCommittedPages (fffff807`4bae4bfc)
fffff807`4bdfc724 48898424f8050000     mov     qword ptr [rsp+5F8h], rax
fffff807`4bdfc72c e8ab84ceff           call    nt!MmGetTotalCommitLimit (fffff807`4bae4bdc)
fffff807`4bdfc731 4889842400060000     mov     qword ptr [rsp+600h], rax
fffff807`4bdfc739 e87e84ceff           call    nt!MmGetPeakCommitment (fffff807`4bae4bbc)
fffff807`4bdfc73e 4889842408060000     mov     qword ptr [rsp+608h], rax
fffff807`4bdfc746 488b8424f8050000     mov     rax, qword ptr [rsp+5F8h]
fffff807`4bdfc74e 4839842408060000     cmp     qword ptr [rsp+608h], rax
fffff807`4bdfc756 0f82ff781e00         jb      nt!ExpQuerySystemInformation+0x1e84cb (fffff807`4bfe405b)
fffff807`4bdfc75c 0f288424f0050000     movaps  xmm0, xmmword ptr [rsp+5F0h]
fffff807`4bdfc764 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfc767 0f288c2400060000     movaps  xmm1, xmmword ptr [rsp+600h]
fffff807`4bdfc76f 0f114b10             movups  xmmword ptr [rbx+10h], xmm1
fffff807`4bdfc773 eb05                 jmp     nt!ExpQuerySystemInformation+0xbea (fffff807`4bdfc77a)
fffff807`4bdfc775 e9bd110000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc77a b820000000           mov     eax, 20h
fffff807`4bdfc77f 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfc783 e9d7f5ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc788 488d442434           lea     rax, [rsp+34h]
fffff807`4bdfc78d 4889442420           mov     qword ptr [rsp+20h], rax
fffff807`4bdfc792 440fb64c2438         movzx   r9d, byte ptr [rsp+38h]
fffff807`4bdfc798 458bc7               mov     r8d, r15d
fffff807`4bdfc79b 488bd3               mov     rdx, rbx
fffff807`4bdfc79e e851321000           call    nt!PfSnQueryPrefetcherInformation (fffff807`4beff9f4)
fffff807`4bdfc7a3 e9b3f5ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc7a8 438d0449             lea     eax, [r9+r9*2]
fffff807`4bdfc7ac c1e004               shl     eax, 4
fffff807`4bdfc7af 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfc7b3 443bf8               cmp     r15d, eax
fffff807`4bdfc7b6 0f823b7a1e00         jb      nt!ExpQuerySystemInformation+0x1e8667 (fffff807`4bfe41f7)
fffff807`4bdfc7bc 897c2444             mov     dword ptr [rsp+44h], edi
fffff807`4bdfc7c0 48899c2400010000     mov     qword ptr [rsp+100h], rbx
fffff807`4bdfc7c8 413bf9               cmp     edi, r9d
fffff807`4bdfc7cb 0f838ef5ffff         jae     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc7d1 66448964243c         mov     word ptr [rsp+3Ch], r12w
fffff807`4bdfc7d7 40887c243e           mov     byte ptr [rsp+3Eh], dil
fffff807`4bdfc7dc c644243f00           mov     byte ptr [rsp+3Fh], 0
fffff807`4bdfc7e1 4533c0               xor     r8d, r8d
fffff807`4bdfc7e4 488d9424f0050000     lea     rdx, [rsp+5F0h]
fffff807`4bdfc7ec 488d4c243c           lea     rcx, [rsp+3Ch]
fffff807`4bdfc7f1 e81aaec0ff           call    nt!PoGetIdleTimes (fffff807`4ba07610)
fffff807`4bdfc7f6 90                   nop     
fffff807`4bdfc7f7 0f288424f0050000     movaps  xmm0, xmmword ptr [rsp+5F0h]
fffff807`4bdfc7ff 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfc802 0f288c2400060000     movaps  xmm1, xmmword ptr [rsp+600h]
fffff807`4bdfc80a 0f114b10             movups  xmmword ptr [rbx+10h], xmm1
fffff807`4bdfc80e 0f28842410060000     movaps  xmm0, xmmword ptr [rsp+610h]
fffff807`4bdfc816 0f114320             movups  xmmword ptr [rbx+20h], xmm0
fffff807`4bdfc81a eb05                 jmp     nt!ExpQuerySystemInformation+0xc91 (fffff807`4bdfc821)
fffff807`4bdfc81c e916110000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc821 4883c330             add     rbx, 30h
fffff807`4bdfc825 ffc7                 inc     edi
fffff807`4bdfc827 448b4c2470           mov     r9d, dword ptr [rsp+70h]
fffff807`4bdfc82c eb8e                 jmp     nt!ExpQuerySystemInformation+0xc2c (fffff807`4bdfc7bc)
fffff807`4bdfc82e 438d0449             lea     eax, [r9+r9*2]
fffff807`4bdfc832 c1e003               shl     eax, 3
fffff807`4bdfc835 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfc839 443bf8               cmp     r15d, eax
fffff807`4bdfc83c 0f82e4811e00         jb      nt!ExpQuerySystemInformation+0x1e8e96 (fffff807`4bfe4a26)
fffff807`4bdfc842 8bf7                 mov     esi, edi
fffff807`4bdfc844 897c2444             mov     dword ptr [rsp+44h], edi
fffff807`4bdfc848 48899c2400010000     mov     qword ptr [rsp+100h], rbx
fffff807`4bdfc850 413bf1               cmp     esi, r9d
fffff807`4bdfc853 0f832cfeffff         jae     nt!ExpQuerySystemInformation+0xaf5 (fffff807`4bdfc685)
fffff807`4bdfc859 66448964243c         mov     word ptr [rsp+3Ch], r12w
fffff807`4bdfc85f 408874243e           mov     byte ptr [rsp+3Eh], sil
fffff807`4bdfc864 c644243f00           mov     byte ptr [rsp+3Fh], 0
fffff807`4bdfc869 488d4c243c           lea     rcx, [rsp+3Ch]
fffff807`4bdfc86e e8ddaec0ff           call    nt!KeGetProcessorIndexFromNumber (fffff807`4ba07750)
fffff807`4bdfc873 8bc8                 mov     ecx, eax
fffff807`4bdfc875 488d058437a0ff       lea     rax, [nt!PopNotifyWork <PERF> (nt+0x0) (fffff807`4b800000)]
fffff807`4bdfc87c 488b94c880cccf00     mov     rdx, qword ptr [rax+rcx*8+0CFCC80h]
fffff807`4bdfc884 8b823c2d0000         mov     eax, dword ptr [rdx+2D3Ch]
fffff807`4bdfc88a 8984249c010000       mov     dword ptr [rsp+19Ch], eax
fffff807`4bdfc891 8903                 mov     dword ptr [rbx], eax
fffff807`4bdfc893 8b82dc300000         mov     eax, dword ptr [rdx+30DCh]
fffff807`4bdfc899 894304               mov     dword ptr [rbx+4], eax
fffff807`4bdfc89c 8b821c310000         mov     eax, dword ptr [rdx+311Ch]
fffff807`4bdfc8a2 894308               mov     dword ptr [rbx+8], eax
fffff807`4bdfc8a5 8b05bdeb6f00         mov     eax, dword ptr [nt!KeTimeIncrement (fffff807`4c4fb468)]
fffff807`4bdfc8ab 89430c               mov     dword ptr [rbx+0Ch], eax
fffff807`4bdfc8ae 897b10               mov     dword ptr [rbx+10h], edi
fffff807`4bdfc8b1 897b14               mov     dword ptr [rbx+14h], edi
fffff807`4bdfc8b4 eb05                 jmp     nt!ExpQuerySystemInformation+0xd2b (fffff807`4bdfc8bb)
fffff807`4bdfc8b6 e97c100000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc8bb 4883c318             add     rbx, 18h
fffff807`4bdfc8bf ffc6                 inc     esi
fffff807`4bdfc8c1 89742444             mov     dword ptr [rsp+44h], esi
fffff807`4bdfc8c5 448b4c2470           mov     r9d, dword ptr [rsp+70h]
fffff807`4bdfc8ca e979ffffff           jmp     nt!ExpQuerySystemInformation+0xcb8 (fffff807`4bdfc848)
fffff807`4bdfc8cf 4183ff02             cmp     r15d, 2
fffff807`4bdfc8d3 0f82597f1e00         jb      nt!ExpQuerySystemInformation+0x1e8ca2 (fffff807`4bfe4832)
fffff807`4bdfc8d9 0fb605a8576300       movzx   eax, byte ptr [nt!KdDebuggerEnabled (fffff807`4c432088)]
fffff807`4bdfc8e0 8803                 mov     byte ptr [rbx], al
fffff807`4bdfc8e2 0fb60567666400       movzx   eax, byte ptr [nt!KdDebuggerNotPresent (fffff807`4c442f50)]
fffff807`4bdfc8e9 884301               mov     byte ptr [rbx+1], al
fffff807`4bdfc8ec eb05                 jmp     nt!ExpQuerySystemInformation+0xd63 (fffff807`4bdfc8f3)
fffff807`4bdfc8ee e944100000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc8f3 b802000000           mov     eax, 2
fffff807`4bdfc8f8 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfc8fc e95ef4ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc901 4c8b0508eb6f00       mov     r8, qword ptr [nt!PsProcessType (fffff807`4c4fb410)]
fffff807`4bdfc908 4889bc2480010000     mov     qword ptr [rsp+180h], rdi
fffff807`4bdfc910 48897c2428           mov     qword ptr [rsp+28h], rdi
fffff807`4bdfc915 488d842480010000     lea     rax, [rsp+180h]
fffff807`4bdfc91d 4889442420           mov     qword ptr [rsp+20h], rax
fffff807`4bdfc922 440fb64c2438         movzx   r9d, byte ptr [rsp+38h]
fffff807`4bdfc928 ba00100000           mov     edx, 1000h
fffff807`4bdfc92d 498bca               mov     rcx, r10
fffff807`4bdfc930 e80bcaffff           call    nt!ObReferenceObjectByHandle (fffff807`4bdf9340)
fffff807`4bdfc935 488bbc2480010000     mov     rdi, qword ptr [rsp+180h]
fffff807`4bdfc93d 4889bc2410010000     mov     qword ptr [rsp+110h], rdi
fffff807`4bdfc945 85c0                 test    eax, eax
fffff807`4bdfc947 0f8974f5ffff         jns     nt!ExpQuerySystemInformation+0x331 (fffff807`4bdfbec1)
fffff807`4bdfc94d e9e50f0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc952 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfc957 458bc7               mov     r8d, r15d
fffff807`4bdfc95a 488bd3               mov     rdx, rbx
fffff807`4bdfc95d 8bce                 mov     ecx, esi
fffff807`4bdfc95f e8f0191100           call    nt!SeSecureBootQueryInformation (fffff807`4bf0e354)
fffff807`4bdfc964 e9f2f3ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfc969 b820000000           mov     eax, 20h
fffff807`4bdfc96e 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfc972 4183ff14             cmp     r15d, 14h
fffff807`4bdfc976 0f822c851e00         jb      nt!ExpQuerySystemInformation+0x1e9318 (fffff807`4bfe4ea8)
fffff807`4bdfc97c 0f10053dcd6100       movups  xmm0, xmmword ptr [nt!ExpBootEnvironmentInformation (fffff807`4c4196c0)]
fffff807`4bdfc983 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfc986 8b0544cd6100         mov     eax, dword ptr [nt!ExpBootEnvironmentInformation+0x10 (fffff807`4c4196d0)]
fffff807`4bdfc98c 894310               mov     dword ptr [rbx+10h], eax
fffff807`4bdfc98f eb05                 jmp     nt!ExpQuerySystemInformation+0xe06 (fffff807`4bdfc996)
fffff807`4bdfc991 e9a10f0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc996 443b7c2434           cmp     r15d, dword ptr [rsp+34h]
fffff807`4bdfc99b 0f8278801e00         jb      nt!ExpQuerySystemInformation+0x1e8e89 (fffff807`4bfe4a19)
fffff807`4bdfc9a1 488b0530cd6100       mov     rax, qword ptr [nt!ExpBootEnvironmentInformation+0x18 (fffff807`4c4196d8)]
fffff807`4bdfc9a8 48894318             mov     qword ptr [rbx+18h], rax
fffff807`4bdfc9ac e9aef3ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfc9b1 e9810f0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfc9b6 4183ff0c             cmp     r15d, 0Ch
fffff807`4bdfc9ba 0f85ad000000         jne     nt!ExpQuerySystemInformation+0xedd (fffff807`4bdfca6d)
fffff807`4bdfc9c0 b101                 mov     cl, 1
fffff807`4bdfc9c2 e8c1cd0300           call    nt!ExAcquireTimeRefreshLock (fffff807`4be39788)
fffff807`4bdfc9c7 488b3db2ef6f00       mov     rdi, qword ptr [nt!KeTimeAdjustmentFrequency (fffff807`4c4fb980)]
fffff807`4bdfc9ce 0fb63546d66f00       movzx   esi, byte ptr [nt!KeTimeSynchronization (fffff807`4c4fa01b)]
fffff807`4bdfc9d5 e88acd0300           call    nt!ExReleaseTimeRefreshLock (fffff807`4be39764)
fffff807`4bdfc9da 90                   nop     
fffff807`4bdfc9db 4183ff18             cmp     r15d, 18h
fffff807`4bdfc9df 742a                 je      nt!ExpQuerySystemInformation+0xe7b (fffff807`4bdfca0b)
fffff807`4bdfc9e1 8b0531ea6f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfc9e7 48b90003000080f7ffff mov     rcx, 0FFFFF78000000300h
fffff807`4bdfc9f1 480faf01             imul    rax, qword ptr [rcx]
fffff807`4bdfc9f5 33d2                 xor     edx, edx
fffff807`4bdfc9f7 48f7f7               div     rax, rdi
fffff807`4bdfc9fa 8903                 mov     dword ptr [rbx], eax
fffff807`4bdfc9fc 8b0516ea6f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfca02 894304               mov     dword ptr [rbx+4], eax
fffff807`4bdfca05 40887308             mov     byte ptr [rbx+8], sil
fffff807`4bdfca09 eb15                 jmp     nt!ExpQuerySystemInformation+0xe90 (fffff807`4bdfca20)
fffff807`4bdfca0b 48893b               mov     qword ptr [rbx], rdi
fffff807`4bdfca0e 48a10003000080f7ffff mov     rax, qword ptr [FFFFF78000000300h]
fffff807`4bdfca18 48894308             mov     qword ptr [rbx+8], rax
fffff807`4bdfca1c 40887310             mov     byte ptr [rbx+10h], sil
fffff807`4bdfca20 e93ff6ffff           jmp     nt!ExpQuerySystemInformation+0x4d4 (fffff807`4bdfc064)
fffff807`4bdfca25 e90d0f0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfca2a b803000000           mov     eax, 3
fffff807`4bdfca2f e90cfbffff           jmp     nt!ExpQuerySystemInformation+0x9b0 (fffff807`4bdfc540)
fffff807`4bdfca34 4183ff0c             cmp     r15d, 0Ch
fffff807`4bdfca38 0f828d751e00         jb      nt!ExpQuerySystemInformation+0x1e843b (fffff807`4bfe3fcb)
fffff807`4bdfca3e 488bcb               mov     rcx, rbx
fffff807`4bdfca41 e8e6fbd4ff           call    nt!ExpGetSystemEmulationProcessorInformation (fffff807`4bb4c62c)
fffff807`4bdfca46 c74424340c000000     mov     dword ptr [rsp+34h], 0Ch
fffff807`4bdfca4e e908f3ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfca53 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfca58 458bc7               mov     r8d, r15d
fffff807`4bdfca5b 488bd3               mov     rdx, rbx
fffff807`4bdfca5e b963000000           mov     ecx, 63h
fffff807`4bdfca63 e8347a1000           call    nt!IoQuerySystemDeviceName (fffff807`4bf0449c)
fffff807`4bdfca68 e9eef2ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfca6d 4183ff18             cmp     r15d, 18h
fffff807`4bdfca71 0f8449ffffff         je      nt!ExpQuerySystemInformation+0xe30 (fffff807`4bdfc9c0)
fffff807`4bdfca77 e9ba771e00           jmp     nt!ExpQuerySystemInformation+0x1e86a6 (fffff807`4bfe4236)
fffff807`4bdfca7c 4183ff08             cmp     r15d, 8
fffff807`4bdfca80 0f857b771e00         jne     nt!ExpQuerySystemInformation+0x1e8671 (fffff807`4bfe4201)
fffff807`4bdfca86 488b05fbc76100       mov     rax, qword ptr [nt!ExLeapSecondData (fffff807`4c419288)]
fffff807`4bdfca8d 803800               cmp     byte ptr [rax], 0
fffff807`4bdfca90 7404                 je      nt!ExpQuerySystemInformation+0xf06 (fffff807`4bdfca96)
fffff807`4bdfca92 b001                 mov     al, 1
fffff807`4bdfca94 eb02                 jmp     nt!ExpQuerySystemInformation+0xf08 (fffff807`4bdfca98)
fffff807`4bdfca96 32c0                 xor     al, al
fffff807`4bdfca98 8803                 mov     byte ptr [rbx], al
fffff807`4bdfca9a 897b04               mov     dword ptr [rbx+4], edi
fffff807`4bdfca9d e90afcffff           jmp     nt!ExpQuerySystemInformation+0xb1c (fffff807`4bdfc6ac)
fffff807`4bdfcaa2 e9900e0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcaa7 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfcaac 458bc7               mov     r8d, r15d
fffff807`4bdfcaaf 488bd3               mov     rdx, rbx
fffff807`4bdfcab2 410fb7cc             movzx   ecx, r12w
fffff807`4bdfcab6 e86d121000           call    nt!KeBuildLogicalProcessorSystemInformation (fffff807`4befdd28)
fffff807`4bdfcabb 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfcabf e99bf2ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfcac4 e96e0e0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcac9 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfcace 458bc7               mov     r8d, r15d
fffff807`4bdfcad1 0fb6542438           movzx   edx, byte ptr [rsp+38h]
fffff807`4bdfcad6 488bcb               mov     rcx, rbx
fffff807`4bdfcad9 e81e1d1000           call    nt!ExpGetSystemFirmwareTableInformation (fffff807`4befe7fc)
fffff807`4bdfcade e978f2ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfcae3 4183ff04             cmp     r15d, 4
fffff807`4bdfcae7 0f8236811e00         jb      nt!ExpQuerySystemInformation+0x1e9093 (fffff807`4bfe4c23)
fffff807`4bdfcaed e87ee1cdff           call    nt!KeGetRecommendedSharedDataAlignment (fffff807`4badac70)
fffff807`4bdfcaf2 8903                 mov     dword ptr [rbx], eax
fffff807`4bdfcaf4 eb05                 jmp     nt!ExpQuerySystemInformation+0xf6b (fffff807`4bdfcafb)
fffff807`4bdfcaf6 e93c0e0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcafb c744243404000000     mov     dword ptr [rsp+34h], 4
fffff807`4bdfcb03 e957f2ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfcb08 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfcb0d 458bc7               mov     r8d, r15d
fffff807`4bdfcb10 488bd3               mov     rdx, rbx
fffff807`4bdfcb13 b962000000           mov     ecx, 62h
fffff807`4bdfcb18 e87f791000           call    nt!IoQuerySystemDeviceName (fffff807`4bf0449c)
fffff807`4bdfcb1d e939f2ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfcb22 428d04cd00000000     lea     eax, [r9*8]
fffff807`4bdfcb2a 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfcb2e 4183ff08             cmp     r15d, 8
fffff807`4bdfcb32 0f821d831e00         jb      nt!ExpQuerySystemInformation+0x1e92c5 (fffff807`4bfe4e55)
fffff807`4bdfcb38 443bf8               cmp     r15d, eax
fffff807`4bdfcb3b 0f8221831e00         jb      nt!ExpQuerySystemInformation+0x1e92d2 (fffff807`4bfe4e62)
fffff807`4bdfcb41 48899c2400010000     mov     qword ptr [rsp+100h], rbx
fffff807`4bdfcb49 897c2444             mov     dword ptr [rsp+44h], edi
fffff807`4bdfcb4d 413bf9               cmp     edi, r9d
fffff807`4bdfcb50 0f8309f2ffff         jae     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfcb56 66448964243c         mov     word ptr [rsp+3Ch], r12w
fffff807`4bdfcb5c 40887c243e           mov     byte ptr [rsp+3Eh], dil
fffff807`4bdfcb61 c644243f00           mov     byte ptr [rsp+3Fh], 0
fffff807`4bdfcb66 488d4c243c           lea     rcx, [rsp+3Ch]
fffff807`4bdfcb6b e8e0abc0ff           call    nt!KeGetProcessorIndexFromNumber (fffff807`4ba07750)
fffff807`4bdfcb70 8bc8                 mov     ecx, eax
fffff807`4bdfcb72 488d058734a0ff       lea     rax, [nt!PopNotifyWork <PERF> (nt+0x0) (fffff807`4b800000)]
fffff807`4bdfcb79 488b84c880cccf00     mov     rax, qword ptr [rax+rcx*8+0CFCC80h]
fffff807`4bdfcb81 488b80387f0000       mov     rax, qword ptr [rax+7F38h]
fffff807`4bdfcb88 48898424d8050000     mov     qword ptr [rsp+5D8h], rax
fffff807`4bdfcb90 488903               mov     qword ptr [rbx], rax
fffff807`4bdfcb93 4883c308             add     rbx, 8
fffff807`4bdfcb97 48899c2400010000     mov     qword ptr [rsp+100h], rbx
fffff807`4bdfcb9f eb05                 jmp     nt!ExpQuerySystemInformation+0x1016 (fffff807`4bdfcba6)
fffff807`4bdfcba1 e9910d0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcba6 ffc7                 inc     edi
fffff807`4bdfcba8 448b4c2470           mov     r9d, dword ptr [rsp+70h]
fffff807`4bdfcbad eb9a                 jmp     nt!ExpQuerySystemInformation+0xfb9 (fffff807`4bdfcb49)
fffff807`4bdfcbaf 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfcbb4 458bc7               mov     r8d, r15d
fffff807`4bdfcbb7 488bd3               mov     rdx, rbx
fffff807`4bdfcbba e869401100           call    nt!IoQueryLowPriorityIoInformation (fffff807`4bf10c28)
fffff807`4bdfcbbf e997f1ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfcbc4 4183ff03             cmp     r15d, 3
fffff807`4bdfcbc8 0f82c17c1e00         jb      nt!ExpQuerySystemInformation+0x1e8cff (fffff807`4bfe488f)
fffff807`4bdfcbce 803d4327610000       cmp     byte ptr [nt!KdpBootedNodebug (fffff807`4c40f318)], 0
fffff807`4bdfcbd5 741b                 je      nt!ExpQuerySystemInformation+0x1062 (fffff807`4bdfcbf2)
fffff807`4bdfcbd7 32c0                 xor     al, al
fffff807`4bdfcbd9 8803                 mov     byte ptr [rbx], al
fffff807`4bdfcbdb 0fb605a6546300       movzx   eax, byte ptr [nt!KdDebuggerEnabled (fffff807`4c432088)]
fffff807`4bdfcbe2 884301               mov     byte ptr [rbx+1], al
fffff807`4bdfcbe5 803d6463640000       cmp     byte ptr [nt!KdDebuggerNotPresent (fffff807`4c442f50)], 0
fffff807`4bdfcbec 7408                 je      nt!ExpQuerySystemInformation+0x1066 (fffff807`4bdfcbf6)
fffff807`4bdfcbee 32c0                 xor     al, al
fffff807`4bdfcbf0 eb06                 jmp     nt!ExpQuerySystemInformation+0x1068 (fffff807`4bdfcbf8)
fffff807`4bdfcbf2 b001                 mov     al, 1
fffff807`4bdfcbf4 ebe3                 jmp     nt!ExpQuerySystemInformation+0x1049 (fffff807`4bdfcbd9)
fffff807`4bdfcbf6 b001                 mov     al, 1
fffff807`4bdfcbf8 884302               mov     byte ptr [rbx+2], al
fffff807`4bdfcbfb eb05                 jmp     nt!ExpQuerySystemInformation+0x1072 (fffff807`4bdfcc02)
fffff807`4bdfcbfd e9350d0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcc02 b803000000           mov     eax, 3
fffff807`4bdfcc07 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfcc0b e94ff1ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfcc10 438d0489             lea     eax, [r9+r9*4]
fffff807`4bdfcc14 c1e004               shl     eax, 4
fffff807`4bdfcc17 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfcc1b 443bf8               cmp     r15d, eax
fffff807`4bdfcc1e 0f82d3751e00         jb      nt!ExpQuerySystemInformation+0x1e8667 (fffff807`4bfe41f7)
fffff807`4bdfcc24 48899c2400010000     mov     qword ptr [rsp+100h], rbx
fffff807`4bdfcc2c 41bd01000000         mov     r13d, 1
fffff807`4bdfcc32 897c2444             mov     dword ptr [rsp+44h], edi
fffff807`4bdfcc36 413bf9               cmp     edi, r9d
fffff807`4bdfcc39 0f8320f1ffff         jae     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfcc3f 66448964243c         mov     word ptr [rsp+3Ch], r12w
fffff807`4bdfcc45 40887c243e           mov     byte ptr [rsp+3Eh], dil
fffff807`4bdfcc4a c644243f00           mov     byte ptr [rsp+3Fh], 0
fffff807`4bdfcc4f 488d4c243c           lea     rcx, [rsp+3Ch]
fffff807`4bdfcc54 e8f7aac0ff           call    nt!KeGetProcessorIndexFromNumber (fffff807`4ba07750)
fffff807`4bdfcc59 8bc8                 mov     ecx, eax
fffff807`4bdfcc5b 488d059e33a0ff       lea     rax, [nt!PopNotifyWork <PERF> (nt+0x0) (fffff807`4b800000)]
fffff807`4bdfcc62 488bb4c880cccf00     mov     rsi, qword ptr [rax+rcx*8+0CFCC80h]
fffff807`4bdfcc6a 4c8d8c2460010000     lea     r9, [rsp+160h]
fffff807`4bdfcc72 4533c0               xor     r8d, r8d
fffff807`4bdfcc75 488d9424f0050000     lea     rdx, [rsp+5F0h]
fffff807`4bdfcc7d 488d4c243c           lea     rcx, [rsp+3Ch]
fffff807`4bdfcc82 e88564d4ff           call    nt!PoGetPerfStateAndParkingInfo (fffff807`4bb4310c)
fffff807`4bdfcc87 90                   nop     
fffff807`4bdfcc88 33d2                 xor     edx, edx
fffff807`4bdfcc8a 448d4250             lea     r8d, [rdx+50h]
fffff807`4bdfcc8e 488bcb               mov     rcx, rbx
fffff807`4bdfcc91 e8aa43dfff           call    nt!memset (fffff807`4bbf1040)
fffff807`4bdfcc96 8b8e887e0000         mov     ecx, dword ptr [rsi+7E88h]
fffff807`4bdfcc9c 038e847e0000         add     ecx, dword ptr [rsi+7E84h]
fffff807`4bdfcca2 8b0570e76f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfcca8 480fafc8             imul    rcx, rax
fffff807`4bdfccac 48894b28             mov     qword ptr [rbx+28h], rcx
fffff807`4bdfccb0 488b4618             mov     rax, qword ptr [rsi+18h]
fffff807`4bdfccb4 8b888c020000         mov     ecx, dword ptr [rax+28Ch]
fffff807`4bdfccba 8b0558e76f00         mov     eax, dword ptr [nt!KeMaximumIncrement (fffff807`4c4fb418)]
fffff807`4bdfccc0 480fafc8             imul    rcx, rax
fffff807`4bdfccc4 48894b30             mov     qword ptr [rbx+30h], rcx
fffff807`4bdfccc8 80bc240c06000000     cmp     byte ptr [rsp+60Ch], 0
fffff807`4bdfccd0 7424                 je      nt!ExpQuerySystemInformation+0x1166 (fffff807`4bdfccf6)
fffff807`4bdfccd2 0fb68424f8050000     movzx   eax, byte ptr [rsp+5F8h]
fffff807`4bdfccda 8803                 mov     byte ptr [rbx], al
fffff807`4bdfccdc 0fb68424fc050000     movzx   eax, byte ptr [rsp+5FCh]
fffff807`4bdfcce4 884307               mov     byte ptr [rbx+7], al
fffff807`4bdfcce7 0fb6842400060000     movzx   eax, byte ptr [rsp+600h]
fffff807`4bdfccef 884308               mov     byte ptr [rbx+8], al
fffff807`4bdfccf2 44896b0c             mov     dword ptr [rbx+0Ch], r13d
fffff807`4bdfccf6 488b842460010000     mov     rax, qword ptr [rsp+160h]
fffff807`4bdfccfe 48894348             mov     qword ptr [rbx+48h], rax
fffff807`4bdfcd02 4883c350             add     rbx, 50h
fffff807`4bdfcd06 48899c2400010000     mov     qword ptr [rsp+100h], rbx
fffff807`4bdfcd0e eb05                 jmp     nt!ExpQuerySystemInformation+0x1185 (fffff807`4bdfcd15)
fffff807`4bdfcd10 e9220c0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcd15 ffc7                 inc     edi
fffff807`4bdfcd17 448b4c2470           mov     r9d, dword ptr [rsp+70h]
fffff807`4bdfcd1c e911ffffff           jmp     nt!ExpQuerySystemInformation+0x10a2 (fffff807`4bdfcc32)
fffff807`4bdfcd21 b801000000           mov     eax, 1
fffff807`4bdfcd26 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfcd2a 443bf8               cmp     r15d, eax
fffff807`4bdfcd2d 0f82c3871e00         jb      nt!ExpQuerySystemInformation+0x1e9966 (fffff807`4bfe54f6)
fffff807`4bdfcd33 e8b828c3ff           call    nt!PoEnergyEstimationEnabled (fffff807`4ba2f5f0)
fffff807`4bdfcd38 8803                 mov     byte ptr [rbx], al
fffff807`4bdfcd3a e920f0ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfcd3f e9f30b0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcd44 4183ff30             cmp     r15d, 30h
fffff807`4bdfcd48 0f826c020000         jb      nt!ExpQuerySystemInformation+0x142a (fffff807`4bdfcfba)
fffff807`4bdfcd4e 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfcd53 418bd7               mov     edx, r15d
fffff807`4bdfcd56 488bcb               mov     rcx, rbx
fffff807`4bdfcd59 e8e2e60e00           call    nt!ExGetPoolTagInfo (fffff807`4beeb440)
fffff807`4bdfcd5e e9f8efffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfcd63 4183ff10             cmp     r15d, 10h
fffff807`4bdfcd67 0f8276791e00         jb      nt!ExpQuerySystemInformation+0x1e8b53 (fffff807`4bfe46e3)
fffff807`4bdfcd6d 8b03                 mov     eax, dword ptr [rbx]
fffff807`4bdfcd6f 89442474             mov     dword ptr [rsp+74h], eax
fffff807`4bdfcd73 488b4b08             mov     rcx, qword ptr [rbx+8]
fffff807`4bdfcd77 48898c2468010000     mov     qword ptr [rsp+168h], rcx
fffff807`4bdfcd7f 8b5304               mov     edx, dword ptr [rbx+4]
fffff807`4bdfcd82 8994241c010000       mov     dword ptr [rsp+11Ch], edx
fffff807`4bdfcd89 eb05                 jmp     nt!ExpQuerySystemInformation+0x1200 (fffff807`4bdfcd90)
fffff807`4bdfcd8b e9a70b0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcd90 f6c107               test    cl, 7
fffff807`4bdfcd93 0f85757a1e00         jne     nt!ExpQuerySystemInformation+0x1e8c7e (fffff807`4bfe480e)
fffff807`4bdfcd99 4c8d4c2474           lea     r9, [rsp+74h]
fffff807`4bdfcd9e 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfcda3 e8b4110e00           call    nt!ExGetSessionPoolTagInformation (fffff807`4beddf5c)
fffff807`4bdfcda8 e9aeefffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfcdad b820000000           mov     eax, 20h
fffff807`4bdfcdb2 b928000000           mov     ecx, 28h
fffff807`4bdfcdb7 83fe12               cmp     esi, 12h
fffff807`4bdfcdba 0f45c1               cmovne  eax, ecx
fffff807`4bdfcdbd 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfcdc1 443bf8               cmp     r15d, eax
fffff807`4bdfcdc4 0f82df781e00         jb      nt!ExpQuerySystemInformation+0x1e8b19 (fffff807`4bfe46a9)
fffff807`4bdfcdca 897c2434             mov     dword ptr [rsp+34h], edi
fffff807`4bdfcdce 81fe90000000         cmp     esi, 90h
fffff807`4bdfcdd4 400f94c7             sete    dil
fffff807`4bdfcdd8 488d442434           lea     rax, [rsp+34h]
fffff807`4bdfcddd 4889442420           mov     qword ptr [rsp+20h], rax
fffff807`4bdfcde2 448bcf               mov     r9d, edi
fffff807`4bdfcde5 458bc7               mov     r8d, r15d
fffff807`4bdfcde8 488bd3               mov     rdx, rbx
fffff807`4bdfcdeb e838920400           call    nt!MmGetPageFileInformation (fffff807`4be46028)
fffff807`4bdfcdf0 e966efffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfcdf5 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfcdfa 418bd7               mov     edx, r15d
fffff807`4bdfcdfd 488bcb               mov     rcx, rbx
fffff807`4bdfce00 e86b711600           call    nt!SeQueryHSTIResults (fffff807`4bf63f70)
fffff807`4bdfce05 e951efffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfce0a 4183ff10             cmp     r15d, 10h
fffff807`4bdfce0e 0f82047a1e00         jb      nt!ExpQuerySystemInformation+0x1e8c88 (fffff807`4bfe4818)
fffff807`4bdfce14 c744243410000000     mov     dword ptr [rsp+34h], 10h
fffff807`4bdfce1c 8bd7                 mov     edx, edi
fffff807`4bdfce1e 448bc7               mov     r8d, edi
fffff807`4bdfce21 8bcf                 mov     ecx, edi
fffff807`4bdfce23 894c2444             mov     dword ptr [rsp+44h], ecx
fffff807`4bdfce27 413bc9               cmp     ecx, r9d
fffff807`4bdfce2a 731b                 jae     nt!ExpQuerySystemInformation+0x12b7 (fffff807`4bdfce47)
fffff807`4bdfce2c 8bc1                 mov     eax, ecx
fffff807`4bdfce2e 498b84c380cccf00     mov     rax, qword ptr [r11+rax*8+0CFCC80h]
fffff807`4bdfce36 039038830000         add     edx, dword ptr [rax+8338h]
fffff807`4bdfce3c 440380b07e0000       add     r8d, dword ptr [rax+7EB0h]
fffff807`4bdfce43 ffc1                 inc     ecx
fffff807`4bdfce45 ebe0                 jmp     nt!ExpQuerySystemInformation+0x1297 (fffff807`4bdfce27)
fffff807`4bdfce47 894c2444             mov     dword ptr [rsp+44h], ecx
fffff807`4bdfce4b 8913                 mov     dword ptr [rbx], edx
fffff807`4bdfce4d 44894304             mov     dword ptr [rbx+4], r8d
fffff807`4bdfce51 897b08               mov     dword ptr [rbx+8], edi
fffff807`4bdfce54 897b0c               mov     dword ptr [rbx+0Ch], edi
fffff807`4bdfce57 e903efffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfce5c e9d60a0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfce61 4183ff10             cmp     r15d, 10h
fffff807`4bdfce65 0f82497b1e00         jb      nt!ExpQuerySystemInformation+0x1e8e24 (fffff807`4bfe49b4)
fffff807`4bdfce6b 488bcb               mov     rcx, rbx
fffff807`4bdfce6e e8990c1700           call    nt!CmQueryRegistryQuotaInformation (fffff807`4bf6db0c)
fffff807`4bdfce73 c744243410000000     mov     dword ptr [rsp+34h], 10h
fffff807`4bdfce7b e9dbeeffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfce80 4183ff18             cmp     r15d, 18h
fffff807`4bdfce84 0f859c711e00         jne     nt!ExpQuerySystemInformation+0x1e8496 (fffff807`4bfe4026)
fffff807`4bdfce8a 65488b042588010000   mov     rax, qword ptr gs:[188h]
fffff807`4bdfce93 488b88b8000000       mov     rcx, qword ptr [rax+0B8h]
fffff807`4bdfce9a e89d7dceff           call    nt!MmGetProcessPartitionId (fffff807`4bae4c3c)
fffff807`4bdfce9f 440fb7c0             movzx   r8d, ax
fffff807`4bdfcea3 488b0d5e156500       mov     rcx, qword ptr [nt!MiState+0x1d48 (fffff807`4c44e408)]
fffff807`4bdfceaa 4a8b14c1             mov     rdx, qword ptr [rcx+r8*8]
fffff807`4bdfceae 488b8a101b0000       mov     rcx, qword ptr [rdx+1B10h]
fffff807`4bdfceb5 48c1e10c             shl     rcx, 0Ch
fffff807`4bdfceb9 48898c24f0050000     mov     qword ptr [rsp+5F0h], rcx
fffff807`4bdfcec1 410fb7c8             movzx   ecx, r8w
fffff807`4bdfcec5 e89239d5ff           call    nt!MmGetLowestPhysicalPage (fffff807`4bb5085c)
fffff807`4bdfceca 48c1e00c             shl     rax, 0Ch
fffff807`4bdfcece 48898424f8050000     mov     qword ptr [rsp+5F8h], rax
fffff807`4bdfced6 e881fac2ff           call    nt!MmGetHighestPhysicalPage (fffff807`4ba2c95c)
fffff807`4bdfcedb 48c1e00c             shl     rax, 0Ch
fffff807`4bdfcedf 4805ff0f0000         add     rax, 0FFFh
fffff807`4bdfcee5 4889842400060000     mov     qword ptr [rsp+600h], rax
fffff807`4bdfceed 0f288424f0050000     movaps  xmm0, xmmword ptr [rsp+5F0h]
fffff807`4bdfcef5 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfcef8 f20f108c2400060000   movsd   xmm1, mmword ptr [rsp+600h]
fffff807`4bdfcf01 f20f114b10           movsd   mmword ptr [rbx+10h], xmm1
fffff807`4bdfcf06 eb05                 jmp     nt!ExpQuerySystemInformation+0x137d (fffff807`4bdfcf0d)
fffff807`4bdfcf08 e92a0a0000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcf0d c744243418000000     mov     dword ptr [rsp+34h], 18h
fffff807`4bdfcf15 e945eeffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfcf1a 0fb6742438           movzx   esi, byte ptr [rsp+38h]
fffff807`4bdfcf1f 400fb6ce             movzx   ecx, sil
fffff807`4bdfcf23 e8f0a80300           call    nt!ExIsRestrictedCaller (fffff807`4be37818)
fffff807`4bdfcf28 85c0                 test    eax, eax
fffff807`4bdfcf2a 0f85a3801e00         jne     nt!ExpQuerySystemInformation+0x1e9443 (fffff807`4bfe4fd3)
fffff807`4bdfcf30 400fb6d6             movzx   edx, sil
fffff807`4bdfcf34 488b0dedf77200       mov     rcx, qword ptr [nt!SeLoadDriverPrivilege (fffff807`4c52c728)]
fffff807`4bdfcf3b e800780700           call    nt!SeSinglePrivilegeCheck (fffff807`4be74740)
fffff807`4bdfcf40 84c0                 test    al, al
fffff807`4bdfcf42 7404                 je      nt!ExpQuerySystemInformation+0x13b8 (fffff807`4bdfcf48)
fffff807`4bdfcf44 897c2440             mov     dword ptr [rsp+40h], edi
fffff807`4bdfcf48 65488b042588010000   mov     rax, qword ptr gs:[188h]
fffff807`4bdfcf51 66ff88e4010000       dec     word ptr [rax+1E4h]
fffff807`4bdfcf58 b201                 mov     dl, 1
fffff807`4bdfcf5a 488d0d1fd36200       lea     rcx, [nt!PsLoadedModuleResource (fffff807`4c42a280)]
fffff807`4bdfcf61 e8ba61c2ff           call    nt!ExAcquireResourceExclusiveLite (fffff807`4ba23120)
fffff807`4bdfcf66 488d442434           lea     rax, [rsp+34h]
fffff807`4bdfcf6b 4889442420           mov     qword ptr [rsp+20h], rax
fffff807`4bdfcf70 448b4c2440           mov     r9d, dword ptr [rsp+40h]
fffff807`4bdfcf75 458bc7               mov     r8d, r15d
fffff807`4bdfcf78 488bd3               mov     rdx, rbx
fffff807`4bdfcf7b e85c591a00           call    nt!ExpQueryModuleInformationEx (fffff807`4bfa28dc)
fffff807`4bdfcf80 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfcf84 488d0df5d26200       lea     rcx, [nt!PsLoadedModuleResource (fffff807`4c42a280)]
fffff807`4bdfcf8b e8e059c2ff           call    nt!ExReleaseResourceLite (fffff807`4ba22970)
fffff807`4bdfcf90 e89b59c2ff           call    nt!KeLeaveCriticalRegion (fffff807`4ba22930)
fffff807`4bdfcf95 e9c5edffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfcf9a 488d442434           lea     rax, [rsp+34h]
fffff807`4bdfcf9f 4889442420           mov     qword ptr [rsp+20h], rax
fffff807`4bdfcfa4 440fb64c2438         movzx   r9d, byte ptr [rsp+38h]
fffff807`4bdfcfaa 458bc7               mov     r8d, r15d
fffff807`4bdfcfad 488bd3               mov     rdx, rbx
fffff807`4bdfcfb0 e8972f1000           call    nt!SmQueryStoreInformation (fffff807`4befff4c)
fffff807`4bdfcfb5 e9a1edffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfcfba 4d85f6               test    r14, r14
fffff807`4bdfcfbd 740f                 je      nt!ExpQuerySystemInformation+0x143e (fffff807`4bdfcfce)
fffff807`4bdfcfbf b930000000           mov     ecx, 30h
fffff807`4bdfcfc4 41890e               mov     dword ptr [r14], ecx
fffff807`4bdfcfc7 eb05                 jmp     nt!ExpQuerySystemInformation+0x143e (fffff807`4bdfcfce)
fffff807`4bdfcfc9 e969090000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcfce b8040000c0           mov     eax, 0C0000004h
fffff807`4bdfcfd3 e95f090000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfcfd8 4183ff04             cmp     r15d, 4
fffff807`4bdfcfdc 0f855b7c1e00         jne     nt!ExpQuerySystemInformation+0x1e90ad (fffff807`4bfe4c3d)
fffff807`4bdfcfe2 48b8e002000080f7ffff mov     rax, 0FFFFF780000002E0h
fffff807`4bdfcfec 8338ff               cmp     dword ptr [rax], 0FFFFFFFFh
fffff807`4bdfcfef 751c                 jne     nt!ExpQuerySystemInformation+0x147d (fffff807`4bdfd00d)
fffff807`4bdfcff1 33c0                 xor     eax, eax
fffff807`4bdfcff3 a3e002000080f7ffff   mov     dword ptr [FFFFF780000002E0h], eax
fffff807`4bdfcffc e8df8d1100           call    nt!ExpReadComPlusPackage (fffff807`4bf15de0)
fffff807`4bdfd001 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfd005 85c0                 test    eax, eax
fffff807`4bdfd007 0f882a090000         js      nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfd00d a1e002000080f7ffff   mov     eax, dword ptr [FFFFF780000002E0h]
fffff807`4bdfd016 8903                 mov     dword ptr [rbx], eax
fffff807`4bdfd018 e9defaffff           jmp     nt!ExpQuerySystemInformation+0xf6b (fffff807`4bdfcafb)
fffff807`4bdfd01d e915090000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfd022 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfd027 458bc7               mov     r8d, r15d
fffff807`4bdfd02a 488bd3               mov     rdx, rbx
fffff807`4bdfd02d b9c8000000           mov     ecx, 0C8h
fffff807`4bdfd032 e865741000           call    nt!IoQuerySystemDeviceName (fffff807`4bf0449c)
fffff807`4bdfd037 e91fedffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfd03c 488b05253a6000       mov     rax, qword ptr [nt!HalDispatchTable+0x8 (fffff807`4c400a68)]
fffff807`4bdfd043 4c8d4c2464           lea     r9, [rsp+64h]
fffff807`4bdfd048 4533c0               xor     r8d, r8d
fffff807`4bdfd04b 33d2                 xor     edx, edx
fffff807`4bdfd04d 8d4a17               lea     ecx, [rdx+17h]
fffff807`4bdfd050 e88b9adeff           call    nt!guard_dispatch_icall (fffff807`4bbe6ae0)
fffff807`4bdfd055 448be0               mov     r12d, eax
fffff807`4bdfd058 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfd05c b8040000c0           mov     eax, 0C0000004h
fffff807`4bdfd061 443be0               cmp     r12d, eax
fffff807`4bdfd064 0f8513f4ffff         jne     nt!ExpQuerySystemInformation+0x8ed (fffff807`4bdfc47d)
fffff807`4bdfd06a 8b542464             mov     edx, dword ptr [rsp+64h]
fffff807`4bdfd06e 443bfa               cmp     r15d, edx
fffff807`4bdfd071 0f8200020000         jb      nt!ExpQuerySystemInformation+0x16e7 (fffff807`4bdfd277)
fffff807`4bdfd077 4885db               test    rbx, rbx
fffff807`4bdfd07a 0f84f7010000         je      nt!ExpQuerySystemInformation+0x16e7 (fffff807`4bdfd277)
fffff807`4bdfd080 0fb6742438           movzx   esi, byte ptr [rsp+38h]
fffff807`4bdfd085 4084f6               test    sil, sil
fffff807`4bdfd088 0f85c47e1e00         jne     nt!ExpQuerySystemInformation+0x1e93c2 (fffff807`4bfe4f52)
fffff807`4bdfd08e 488bfb               mov     rdi, rbx
fffff807`4bdfd091 48895c2458           mov     qword ptr [rsp+58h], rbx
fffff807`4bdfd096 488b05cb396000       mov     rax, qword ptr [nt!HalDispatchTable+0x8 (fffff807`4c400a68)]
fffff807`4bdfd09d 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfd0a2 4c8bc7               mov     r8, rdi
fffff807`4bdfd0a5 b917000000           mov     ecx, 17h
fffff807`4bdfd0aa e8319adeff           call    nt!guard_dispatch_icall (fffff807`4bbe6ae0)
fffff807`4bdfd0af 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfd0b3 4084f6               test    sil, sil
fffff807`4bdfd0b6 0f84a3ecffff         je      nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd0bc e9c47e1e00           jmp     nt!ExpQuerySystemInformation+0x1e93f5 (fffff807`4bfe4f85)
fffff807`4bdfd0c1 0fb70522c66100       movzx   eax, word ptr [nt!ExpManufacturingInformation+0xa (fffff807`4c4196ea)]
fffff807`4bdfd0c8 83c018               add     eax, 18h
fffff807`4bdfd0cb 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfd0cf 443bf8               cmp     r15d, eax
fffff807`4bdfd0d2 0f8338020000         jae     nt!ExpQuerySystemInformation+0x1780 (fffff807`4bdfd310)
fffff807`4bdfd0d8 b8040000c0           mov     eax, 0C0000004h
fffff807`4bdfd0dd e979ecffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfd0e2 8b44244c             mov     eax, dword ptr [rsp+4Ch]
fffff807`4bdfd0e6 85c0                 test    eax, eax
fffff807`4bdfd0e8 0f85196e1e00         jne     nt!ExpQuerySystemInformation+0x1e8377 (fffff807`4bfe3f07)
fffff807`4bdfd0ee 4889bc2440010000     mov     qword ptr [rsp+140h], rdi
fffff807`4bdfd0f6 e933ecffff           jmp     nt!ExpQuerySystemInformation+0x19e (fffff807`4bdfbd2e)
fffff807`4bdfd0fb b820000000           mov     eax, 20h
fffff807`4bdfd100 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfd104 443bf8               cmp     r15d, eax
fffff807`4bdfd107 0f85f67f1e00         jne     nt!ExpQuerySystemInformation+0x1e9573 (fffff807`4bfe5103)
fffff807`4bdfd10d 488d9424f0050000     lea     rdx, [rsp+5F0h]
fffff807`4bdfd115 33c9                 xor     ecx, ecx
fffff807`4bdfd117 e870334000           call    nt!BgkQueryBootGraphicsInformation (fffff807`4c20048c)
fffff807`4bdfd11c 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfd120 85c0                 test    eax, eax
fffff807`4bdfd122 0f8837ecffff         js      nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd128 807c243800           cmp     byte ptr [rsp+38h], 0
fffff807`4bdfd12d 0f85da7f1e00         jne     nt!ExpQuerySystemInformation+0x1e957d (fffff807`4bfe510d)
fffff807`4bdfd133 448b442434           mov     r8d, dword ptr [rsp+34h]
fffff807`4bdfd138 488d9424f0050000     lea     rdx, [rsp+5F0h]
fffff807`4bdfd140 488bcb               mov     rcx, rbx
fffff807`4bdfd143 e8383cdfff           call    nt!memcpy (fffff807`4bbf0d80)
fffff807`4bdfd148 e912ecffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd14d 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfd151 4c8b742468           mov     r14, qword ptr [rsp+68h]
fffff807`4bdfd156 e904ecffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd15b c744243410000000     mov     dword ptr [rsp+34h], 10h
fffff807`4bdfd163 4183ff10             cmp     r15d, 10h
fffff807`4bdfd167 0f853e841e00         jne     nt!ExpQuerySystemInformation+0x1e9a1b (fffff807`4bfe55ab)
fffff807`4bdfd16d 0fb60d0cc66100       movzx   ecx, byte ptr [nt!ExpFirmwarePageProtectionSupported (fffff807`4c419780)]
fffff807`4bdfd174 c0e104               shl     cl, 4
fffff807`4bdfd177 328c24f0050000       xor     cl, byte ptr [rsp+5F0h]
fffff807`4bdfd17e 4122cf               and     cl, r15b
fffff807`4bdfd181 328c24f0050000       xor     cl, byte ptr [rsp+5F0h]
fffff807`4bdfd188 888c24f0050000       mov     byte ptr [rsp+5F0h], cl
fffff807`4bdfd18f e82839d5ff           call    nt!VslIsSecureKernelRunning (fffff807`4bb50abc)
fffff807`4bdfd194 84c0                 test    al, al
fffff807`4bdfd196 0f8529841e00         jne     nt!ExpQuerySystemInformation+0x1e9a35 (fffff807`4bfe55c5)
fffff807`4bdfd19c 0f288424f0050000     movaps  xmm0, xmmword ptr [rsp+5F0h]
fffff807`4bdfd1a4 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfd1a7 e9b3ebffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd1ac e986070000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfd1b1 837c244c02           cmp     dword ptr [rsp+4Ch], 2
fffff807`4bdfd1b6 0f825d7b1e00         jb      nt!ExpQuerySystemInformation+0x1e9189 (fffff807`4bfe4d19)
fffff807`4bdfd1bc 488b442458           mov     rax, qword ptr [rsp+58h]
fffff807`4bdfd1c1 440fb700             movzx   r8d, word ptr [rax]
fffff807`4bdfd1c5 664489442448         mov     word ptr [rsp+48h], r8w
fffff807`4bdfd1cb eb05                 jmp     nt!ExpQuerySystemInformation+0x1642 (fffff807`4bdfd1d2)
fffff807`4bdfd1cd e965070000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfd1d2 66443b0526ce6f00     cmp     r8w, word ptr [nt!KeNumberNodes (fffff807`4c4fa000)]
fffff807`4bdfd1da 0f8254ebffff         jb      nt!ExpQuerySystemInformation+0x1a4 (fffff807`4bdfbd34)
fffff807`4bdfd1e0 e9347b1e00           jmp     nt!ExpQuerySystemInformation+0x1e9189 (fffff807`4bfe4d19)
fffff807`4bdfd1e5 4183ff04             cmp     r15d, 4
fffff807`4bdfd1e9 0f85ef721e00         jne     nt!ExpQuerySystemInformation+0x1e894e (fffff807`4bfe44de)
fffff807`4bdfd1ef 8b050bef6400         mov     eax, dword ptr [nt!NtGlobalFlag (fffff807`4c44c100)]
fffff807`4bdfd1f5 8903                 mov     dword ptr [rbx], eax
fffff807`4bdfd1f7 e9fff8ffff           jmp     nt!ExpQuerySystemInformation+0xf6b (fffff807`4bdfcafb)
fffff807`4bdfd1fc e936070000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfd201 4183ff04             cmp     r15d, 4
fffff807`4bdfd205 0f859b7a1e00         jne     nt!ExpQuerySystemInformation+0x1e9116 (fffff807`4bfe4ca6)
fffff807`4bdfd20b 8b05ff4d6100         mov     eax, dword ptr [nt!ObpObjectSecurityMode (fffff807`4c412010)]
fffff807`4bdfd211 8903                 mov     dword ptr [rbx], eax
fffff807`4bdfd213 e9e3f8ffff           jmp     nt!ExpQuerySystemInformation+0xf6b (fffff807`4bdfcafb)
fffff807`4bdfd218 e91a070000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfd21d 0fb705dccd6f00       movzx   eax, word ptr [nt!KeNumberNodes (fffff807`4c4fa000)]
fffff807`4bdfd224 c1e002               shl     eax, 2
fffff807`4bdfd227 89442434             mov     dword ptr [rsp+34h], eax
fffff807`4bdfd22b 443bf8               cmp     r15d, eax
fffff807`4bdfd22e 0f82ef7a1e00         jb      nt!ExpQuerySystemInformation+0x1e9193 (fffff807`4bfe4d23)
fffff807`4bdfd234 897c2444             mov     dword ptr [rsp+44h], edi
fffff807`4bdfd238 448bcf               mov     r9d, edi
fffff807`4bdfd23b 0fb70dbecd6f00       movzx   ecx, word ptr [nt!KeNumberNodes (fffff807`4c4fa000)]
fffff807`4bdfd242 443bc9               cmp     r9d, ecx
fffff807`4bdfd245 7326                 jae     nt!ExpQuerySystemInformation+0x16dd (fffff807`4bdfd26d)
fffff807`4bdfd247 410fb7c0             movzx   eax, r8w
fffff807`4bdfd24b 0fafc8               imul    ecx, eax
fffff807`4bdfd24e 03cf                 add     ecx, edi
fffff807`4bdfd250 488b0511ce6f00       mov     rax, qword ptr [nt!KeNodeDistance (fffff807`4c4fa068)]
fffff807`4bdfd257 8b1488               mov     edx, dword ptr [rax+rcx*4]
fffff807`4bdfd25a 418bc1               mov     eax, r9d
fffff807`4bdfd25d 891483               mov     dword ptr [rbx+rax*4], edx
fffff807`4bdfd260 41ffc1               inc     r9d
fffff807`4bdfd263 418bf9               mov     edi, r9d
fffff807`4bdfd266 44894c2444           mov     dword ptr [rsp+44h], r9d
fffff807`4bdfd26b ebce                 jmp     nt!ExpQuerySystemInformation+0x16ab (fffff807`4bdfd23b)
fffff807`4bdfd26d e9edeaffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd272 e9c0060000           jmp     nt!ExpQuerySystemInformation+0x1da7 (fffff807`4bdfd937)
fffff807`4bdfd277 89542434             mov     dword ptr [rsp+34h], edx
fffff807`4bdfd27b e9dfeaffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd280 c744243480000000     mov     dword ptr [rsp+34h], 80h
fffff807`4bdfd288 4181ff80000000       cmp     r15d, 80h
fffff807`4bdfd28f 0f858f7e1e00         jne     nt!ExpQuerySystemInformation+0x1e9594 (fffff807`4bfe5124)
fffff807`4bdfd295 488d9424f0050000     lea     rdx, [rsp+5F0h]
fffff807`4bdfd29d 418d4f83             lea     ecx, [r15-7Dh]
fffff807`4bdfd2a1 e8e6314000           call    nt!BgkQueryBootGraphicsInformation (fffff807`4c20048c)
fffff807`4bdfd2a6 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfd2aa 85c0                 test    eax, eax
fffff807`4bdfd2ac 0f88adeaffff         js      nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd2b2 448b442434           mov     r8d, dword ptr [rsp+34h]
fffff807`4bdfd2b7 488d9424f0050000     lea     rdx, [rsp+5F0h]
fffff807`4bdfd2bf 488bcb               mov     rcx, rbx
fffff807`4bdfd2c2 e8b93adfff           call    nt!memcpy (fffff807`4bbf0d80)
fffff807`4bdfd2c7 e993eaffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd2cc 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfd2d0 4c8b742468           mov     r14, qword ptr [rsp+68h]
fffff807`4bdfd2d5 e985eaffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd2da 4d85d2               test    r10, r10
fffff807`4bdfd2dd 0f85f4831e00         jne     nt!ExpQuerySystemInformation+0x1e9b47 (fffff807`4bfe56d7)
fffff807`4bdfd2e3 488bbc2410010000     mov     rdi, qword ptr [rsp+110h]
fffff807`4bdfd2eb 4c8bcf               mov     r9, rdi
fffff807`4bdfd2ee 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfd2f3 418bd7               mov     edx, r15d
fffff807`4bdfd2f6 488bcb               mov     rcx, rbx
fffff807`4bdfd2f9 e85a961b00           call    nt!KeQueryCpuSetInformation (fffff807`4bfb6958)
fffff807`4bdfd2fe 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfd302 4885ff               test    rdi, rdi
fffff807`4bdfd305 0f8454eaffff         je      nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd30b e918841e00           jmp     nt!ExpQuerySystemInformation+0x1e9b98 (fffff807`4bfe5728)
fffff807`4bdfd310 488d4b18             lea     rcx, [rbx+18h]
fffff807`4bdfd314 0f57c0               xorps   xmm0, xmm0
fffff807`4bdfd317 33c0                 xor     eax, eax
fffff807`4bdfd319 0f1103               movups  xmmword ptr [rbx], xmm0
fffff807`4bdfd31c 48894310             mov     qword ptr [rbx+10h], rax
fffff807`4bdfd320 8b05bac36100         mov     eax, dword ptr [nt!ExpManufacturingInformation (fffff807`4c4196e0)]
fffff807`4bdfd326 8903                 mov     dword ptr [rbx], eax
fffff807`4bdfd328 0fb705b9c36100       movzx   eax, word ptr [nt!ExpManufacturingInformation+0x8 (fffff807`4c4196e8)]
fffff807`4bdfd32f 66894308             mov     word ptr [rbx+8], ax
fffff807`4bdfd333 0fb705b0c36100       movzx   eax, word ptr [nt!ExpManufacturingInformation+0xa (fffff807`4c4196ea)]
fffff807`4bdfd33a 6689430a             mov     word ptr [rbx+0Ah], ax
fffff807`4bdfd33e 66833da2c3610000     cmp     word ptr [nt!ExpManufacturingInformation+0x8 (fffff807`4c4196e8)], 0
fffff807`4bdfd346 7618                 jbe     nt!ExpQuerySystemInformation+0x17d0 (fffff807`4bdfd360)
fffff807`4bdfd348 48894b10             mov     qword ptr [rbx+10h], rcx
fffff807`4bdfd34c 440fb70596c36100     movzx   r8d, word ptr [nt!ExpManufacturingInformation+0xa (fffff807`4c4196ea)]
fffff807`4bdfd354 488b1595c36100       mov     rdx, qword ptr [nt!ExpManufacturingInformation+0x10 (fffff807`4c4196f0)]
fffff807`4bdfd35b e8203adfff           call    nt!memcpy (fffff807`4bbf0d80)
fffff807`4bdfd360 e9fae9ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd365 89442430             mov     dword ptr [rsp+30h], eax
fffff807`4bdfd369 4c8b742468           mov     r14, qword ptr [rsp+68h]
fffff807`4bdfd36e e9ece9ffff           jmp     nt!ExpQuerySystemInformation+0x1cf (fffff807`4bdfbd5f)
fffff807`4bdfd373 4c8d442434           lea     r8, [rsp+34h]
fffff807`4bdfd378 418bd7               mov     edx, r15d
fffff807`4bdfd37b 488bcb               mov     rcx, rbx
fffff807`4bdfd37e e87da91b00           call    nt!ExpQueryMemoryTopologyInformation (fffff807`4bfb7d00)
fffff807`4bdfd383 e9d3e9ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfd388 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfd38d 458bc7               mov     r8d, r15d
fffff807`4bdfd390 488bd3               mov     rdx, rbx
fffff807`4bdfd393 e8ac551c00           call    nt!IoQueryVhdBootInformation (fffff807`4bfc2944)
fffff807`4bdfd398 e9bee9ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfd39d 488d442434           lea     rax, [rsp+34h]
fffff807`4bdfd3a2 4889442420           mov     qword ptr [rsp+20h], rax
fffff807`4bdfd3a7 458bcf               mov     r9d, r15d
fffff807`4bdfd3aa 4c8bc3               mov     r8, rbx
fffff807`4bdfd3ad 8b54244c             mov     edx, dword ptr [rsp+4Ch]
fffff807`4bdfd3b1 488b4c2458           mov     rcx, qword ptr [rsp+58h]
fffff807`4bdfd3b6 e809171c00           call    nt!ExpQueryInterruptSteeringInformation (fffff807`4bfbeac4)
fffff807`4bdfd3bb e99be9ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfd3c0 0fb6742438           movzx   esi, byte ptr [rsp+38h]
fffff807`4bdfd3c5 400fb6d6             movzx   edx, sil
fffff807`4bdfd3c9 488b0dc0f27200       mov     rcx, qword ptr [nt!SeTcbPrivilege (fffff807`4c52c690)]
fffff807`4bdfd3d0 e86b730700           call    nt!SeSinglePrivilegeCheck (fffff807`4be74740)
fffff807`4bdfd3d5 84c0                 test    al, al
fffff807`4bdfd3d7 0f8489831e00         je      nt!ExpQuerySystemInformation+0x1e9bd6 (fffff807`4bfe5766)
fffff807`4bdfd3dd 440fb6c6             movzx   r8d, sil
fffff807`4bdfd3e1 418bd7               mov     edx, r15d
fffff807`4bdfd3e4 488bcb               mov     rcx, rbx
fffff807`4bdfd3e7 e858201c00           call    nt!ExpGetSystemPlatformBinary (fffff807`4bfbf444)
fffff807`4bdfd3ec e96ae9ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfd3f1 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfd3f6 440fb6442438         movzx   r8d, byte ptr [rsp+38h]
fffff807`4bdfd3fc 418bd7               mov     edx, r15d
fffff807`4bdfd3ff 488bcb               mov     rcx, rbx
fffff807`4bdfd402 e8354f1c00           call    nt!HvlQueryEnlightenmentInfo (fffff807`4bfc233c)
fffff807`4bdfd407 e94fe9ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfd40c 4c8d4c2434           lea     r9, [rsp+34h]
fffff807`4bdfd411 440fb6442438         movzx   r8d, byte ptr [rsp+38h]
fffff807`4bdfd417 418bd7               mov     edx, r15d
fffff807`4bdfd41a 488bcb               mov     rcx, rbx
fffff807`4bdfd41d e872badbff           call    nt!PsQueryCpuQuotaInformation (fffff807`4bbb8e94)
fffff807`4bdfd422 e934e9ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfd427 c744243448040000     mov     dword ptr [rsp+34h], 448h
fffff807`4bdfd42f 4181ff48040000       cmp     r15d, 448h
fffff807`4bdfd436 0f858d7b1e00         jne     nt!ExpQuerySystemInformation+0x1e9439 (fffff807`4bfe4fc9)
fffff807`4bdfd43c 807c243800           cmp     byte ptr [rsp+38h], 0
fffff807`4bdfd441 0f858c7b1e00         jne     nt!ExpQuerySystemInformation+0x1e9443 (fffff807`4bfe4fd3)
fffff807`4bdfd447 488bcb               mov     rcx, rbx
fffff807`4bdfd44a e8251d1900           call    nt!ExQueryBootEntropyInformation (fffff807`4bf8f174)
fffff807`4bdfd44f e907e9ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
fffff807`4bdfd454 4183ff08             cmp     r15d, 8
fffff807`4bdfd458 0f8201841e00         jb      nt!ExpQuerySystemInformation+0x1e9ccf (fffff807`4bfe585f)
fffff807`4bdfd45e 488bcb               mov     rcx, rbx
fffff807`4bdfd461 e882441c00           call    nt!ExpGetSystemWriteConstraintInformation (fffff807`4bfc18e8)
fffff807`4bdfd466 c744243408000000     mov     dword ptr [rsp+34h], 8
fffff807`4bdfd46e e9e8e8ffff           jmp     nt!ExpQuerySystemInformation+0x1cb (fffff807`4bdfbd5b)
