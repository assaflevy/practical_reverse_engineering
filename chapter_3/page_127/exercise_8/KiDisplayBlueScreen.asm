0: kd> uf KiDisplayBlueScreen 
nt!KiDisplayBlueScreen:
fffff802`7551e9f0 488bc4          mov     rax,rsp
fffff802`7551e9f3 48895808        mov     qword ptr [rax+8],rbx
fffff802`7551e9f7 48897010        mov     qword ptr [rax+10h],rsi
fffff802`7551e9fb 48897818        mov     qword ptr [rax+18h],rdi
fffff802`7551e9ff 55              push    rbp
fffff802`7551ea00 4154            push    r12
fffff802`7551ea02 4155            push    r13
fffff802`7551ea04 4156            push    r14
fffff802`7551ea06 4157            push    r15
fffff802`7551ea08 488da858feffff  lea     rbp,[rax-1A8h]
fffff802`7551ea0f 4881ec80020000  sub     rsp,280h
fffff802`7551ea16 488b0513386f00  mov     rax,qword ptr [nt!_security_cookie (fffff802`75c12230)]
fffff802`7551ea1d 4833c4          xor     rax,rsp
fffff802`7551ea20 48898570010000  mov     qword ptr [rbp+170h],rax
fffff802`7551ea27 33d2            xor     edx,edx
fffff802`7551ea29 448be1          mov     r12d,ecx
fffff802`7551ea2c 488d4c2460      lea     rcx,[rsp+60h]
fffff802`7551ea31 448d4260        lea     r8d,[rdx+60h]
fffff802`7551ea35 e80626edff      call    nt!memset (fffff802`753f1040)
fffff802`7551ea3a 8b0580297100    mov     eax,dword ptr [nt!KiBugCheckData (fffff802`75c313c0)]
fffff802`7551ea40 4533ed          xor     r13d,r13d
fffff802`7551ea43 33d2            xor     edx,edx
fffff802`7551ea45 4c896c2448      mov     qword ptr [rsp+48h],r13
fffff802`7551ea4a 0f57c0          xorps   xmm0,xmm0
fffff802`7551ea4d 89442444        mov     dword ptr [rsp+44h],eax
fffff802`7551ea51 4533c9          xor     r9d,r9d
fffff802`7551ea54 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff802`7551ea59 458d7d01        lea     r15d,[r13+1]
fffff802`7551ea5d 4533c0          xor     r8d,r8d
fffff802`7551ea60 8d4a0e          lea     ecx,[rdx+0Eh]
fffff802`7551ea63 44887c2440      mov     byte ptr [rsp+40h],r15b
fffff802`7551ea68 0f11442450      movups  xmmword ptr [rsp+50h],xmm0
fffff802`7551ea6d e8de5be7ff      call    nt!HeadlessDispatch (fffff802`75394650)
fffff802`7551ea72 4533c9          xor     r9d,r9d
fffff802`7551ea75 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff802`7551ea7a 458bc7          mov     r8d,r15d
fffff802`7551ea7d 488d542440      lea     rdx,[rsp+40h]
fffff802`7551ea82 418bcf          mov     ecx,r15d
fffff802`7551ea85 e8c65be7ff      call    nt!HeadlessDispatch (fffff802`75394650)
fffff802`7551ea8a 458d7504        lea     r14d,[r13+4]
fffff802`7551ea8e 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff802`7551ea93 458bc6          mov     r8d,r14d
fffff802`7551ea96 488d542444      lea     rdx,[rsp+44h]
fffff802`7551ea9b 4533c9          xor     r9d,r9d
fffff802`7551ea9e 418d4d14        lea     ecx,[r13+14h]
fffff802`7551eaa2 e8a95be7ff      call    nt!HeadlessDispatch (fffff802`75394650)
fffff802`7551eaa7 418d4e7d        lea     ecx,[r14+7Dh]
fffff802`7551eaab e890a3feff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)
fffff802`7551eab0 488b1db9b17d00  mov     rbx,qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)]
fffff802`7551eab7 488d350a297100  lea     rsi,[nt!KiBugCheckData+0x8 (fffff802`75c313c8)]
fffff802`7551eabe 4885db          test    rbx,rbx
fffff802`7551eac1 751c            jne     nt!KiDisplayBlueScreen+0xef (fffff802`7551eadf)  Branch

nt!KiDisplayBlueScreen+0xd3:
fffff802`7551eac3 4533c9          xor     r9d,r9d
fffff802`7551eac6 458bc6          mov     r8d,r14d
fffff802`7551eac9 488bd6          mov     rdx,rsi
fffff802`7551eacc 33c9            xor     ecx,ecx
fffff802`7551eace e8b1020000      call    nt!KiDumpParameterImages (fffff802`7551ed84)
fffff802`7551ead3 488b1d96b17d00  mov     rbx,qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)]
fffff802`7551eada 4885db          test    rbx,rbx
fffff802`7551eadd 7423            je      nt!KiDisplayBlueScreen+0x112 (fffff802`7551eb02)  Branch

nt!KiDisplayBlueScreen+0xef:
fffff802`7551eadf 41b81e000000    mov     r8d,1Eh
fffff802`7551eae5 66443903        cmp     word ptr [rbx],r8w
fffff802`7551eae9 7517            jne     nt!KiDisplayBlueScreen+0x112 (fffff802`7551eb02)  Branch

nt!KiDisplayBlueScreen+0xfb:
fffff802`7551eaeb 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff802`7551eaef 488d15aa4db1ff  lea     rdx,[nt!`string' (fffff802`750338a0)]
fffff802`7551eaf6 e8a5cde9ff      call    nt!memcmp (fffff802`753bb8a0)
fffff802`7551eafb 85c0            test    eax,eax
fffff802`7551eafd 7503            jne     nt!KiDisplayBlueScreen+0x112 (fffff802`7551eb02)  Branch

nt!KiDisplayBlueScreen+0x10f:
fffff802`7551eaff 498bdd          mov     rbx,r13

nt!KiDisplayBlueScreen+0x112:
fffff802`7551eb02 488d4570        lea     rax,[rbp+70h]
fffff802`7551eb06 498bd6          mov     rdx,r14
fffff802`7551eb09 4889442478      mov     qword ptr [rsp+78h],rax
fffff802`7551eb0e 488d4dd0        lea     rcx,[rbp-30h]
fffff802`7551eb12 b800010000      mov     eax,100h
fffff802`7551eb17 41b926000000    mov     r9d,26h
fffff802`7551eb1d 6689442472      mov     word ptr [rsp+72h],ax
fffff802`7551eb22 488d4580        lea     rax,[rbp-80h]

nt!KiDisplayBlueScreen+0x136:
fffff802`7551eb26 48894808        mov     qword ptr [rax+8],rcx
fffff802`7551eb2a 4903c9          add     rcx,r9
fffff802`7551eb2d c70024002600    mov     dword ptr [rax],260024h
fffff802`7551eb33 488d4010        lea     rax,[rax+10h]
fffff802`7551eb37 492bd7          sub     rdx,r15
fffff802`7551eb3a 75ea            jne     nt!KiDisplayBlueScreen+0x136 (fffff802`7551eb26)  Branch

nt!KiDisplayBlueScreen+0x14c:
fffff802`7551eb3c 8b0d7e287100    mov     ecx,dword ptr [nt!KiBugCheckData (fffff802`75c313c0)]
fffff802`7551eb42 488d542450      lea     rdx,[rsp+50h]
fffff802`7551eb47 e8a8f8ffff      call    nt!KeGetBugMessageText (fffff802`7551e3f4)
fffff802`7551eb4c 84c0            test    al,al
fffff802`7551eb4e 7542            jne     nt!KiDisplayBlueScreen+0x1a2 (fffff802`7551eb92)  Branch

nt!KiDisplayBlueScreen+0x160:
fffff802`7551eb50 8b056a287100    mov     eax,dword ptr [nt!KiBugCheckData (fffff802`75c313c0)]
fffff802`7551eb56 4c8d442448      lea     r8,[rsp+48h]
fffff802`7551eb5b 89442430        mov     dword ptr [rsp+30h],eax
fffff802`7551eb5f 488d4dc0        lea     rcx,[rbp-40h]
fffff802`7551eb63 4533c9          xor     r9d,r9d
fffff802`7551eb66 488d05d342edff  lea     rax,[nt! ?? ::FNODOBFM::`string' (fffff802`753f2e40)]
fffff802`7551eb6d 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`7551eb72 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff802`7551eb77 418d510b        lea     edx,[r9+0Bh]
fffff802`7551eb7b e814e4f9ff      call    nt!RtlStringCbPrintfExA (fffff802`754bcf94)
fffff802`7551eb80 0fb74c2448      movzx   ecx,word ptr [rsp+48h]
fffff802`7551eb85 488d45c0        lea     rax,[rbp-40h]
fffff802`7551eb89 662bc8          sub     cx,ax
fffff802`7551eb8c 488d55c0        lea     rdx,[rbp-40h]
fffff802`7551eb90 eb0a            jmp     nt!KiDisplayBlueScreen+0x1ac (fffff802`7551eb9c)  Branch

nt!KiDisplayBlueScreen+0x1a2:
fffff802`7551eb92 488b542458      mov     rdx,qword ptr [rsp+58h]
fffff802`7551eb97 0fb74c2450      movzx   ecx,word ptr [rsp+50h]

nt!KiDisplayBlueScreen+0x1ac:
fffff802`7551eb9c 0fb7442472      movzx   eax,word ptr [rsp+72h]
fffff802`7551eba1 450fb7c5        movzx   r8d,r13w
fffff802`7551eba5 488b7c2478      mov     rdi,qword ptr [rsp+78h]
fffff802`7551ebaa 66d1e8          shr     ax,1
fffff802`7551ebad 66412bc7        sub     ax,r15w
fffff802`7551ebb1 663bc8          cmp     cx,ax
fffff802`7551ebb4 660f43c8        cmovae  cx,ax
fffff802`7551ebb8 66443be9        cmp     r13w,cx
fffff802`7551ebbc 731e            jae     nt!KiDisplayBlueScreen+0x1ec (fffff802`7551ebdc)  Branch

nt!KiDisplayBlueScreen+0x1ce:
fffff802`7551ebbe 4c8bcf          mov     r9,rdi
fffff802`7551ebc1 440fb7d1        movzx   r10d,cx
fffff802`7551ebc5 440fb7c1        movzx   r8d,cx

nt!KiDisplayBlueScreen+0x1d9:
fffff802`7551ebc9 0fbe02          movsx   eax,byte ptr [rdx]
fffff802`7551ebcc 4903d7          add     rdx,r15
fffff802`7551ebcf 66418901        mov     word ptr [r9],ax
fffff802`7551ebd3 4d8d4902        lea     r9,[r9+2]
fffff802`7551ebd7 4d2bd7          sub     r10,r15
fffff802`7551ebda 75ed            jne     nt!KiDisplayBlueScreen+0x1d9 (fffff802`7551ebc9)  Branch

nt!KiDisplayBlueScreen+0x1ec:
fffff802`7551ebdc 410fb7c0        movzx   eax,r8w
fffff802`7551ebe0 664503c0        add     r8w,r8w
fffff802`7551ebe4 664489442470    mov     word ptr [rsp+70h],r8w
fffff802`7551ebea 6644892c47      mov     word ptr [rdi+rax*2],r13w
fffff802`7551ebef e8bc69feff      call    nt!InbvAcquireDisplayOwnership (fffff802`755055b0)
fffff802`7551ebf4 b982000000      mov     ecx,82h
fffff802`7551ebf9 e842a2feff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)
fffff802`7551ebfe 448b3dbb277100  mov     r15d,dword ptr [nt!KiBugCheckData (fffff802`75c313c0)]
fffff802`7551ec05 0f57c0          xorps   xmm0,xmm0
fffff802`7551ec08 660f7f442460    movdqa  xmmword ptr [rsp+60h],xmm0
fffff802`7551ec0e e8957de6ff      call    nt!BgpFwAcquireLock (fffff802`753869a8)
fffff802`7551ec13 8b0557466f00    mov     eax,dword ptr [nt!BgInternal+0x70 (fffff802`75c13270)]
fffff802`7551ec19 a802            test    al,2
fffff802`7551ec1b 741d            je      nt!KiDisplayBlueScreen+0x24a (fffff802`7551ec3a)  Branch

nt!KiDisplayBlueScreen+0x22d:
fffff802`7551ec1d 4c8d4c2460      lea     r9,[rsp+60h]
fffff802`7551ec22 4489642420      mov     dword ptr [rsp+20h],r12d
fffff802`7551ec27 4c8bc3          mov     r8,rbx
fffff802`7551ec2a 488bd6          mov     rdx,rsi
fffff802`7551ec2d 418bcf          mov     ecx,r15d
fffff802`7551ec30 e88f090b00      call    nt!BgpFwDisplayBugCheckScreen (fffff802`755cf5c4)
fffff802`7551ec35 488b7c2478      mov     rdi,qword ptr [rsp+78h]

nt!KiDisplayBlueScreen+0x24a:
fffff802`7551ec3a e8197de6ff      call    nt!BgpFwReleaseLock (fffff802`75386958)
fffff802`7551ec3f b980000000      mov     ecx,80h
fffff802`7551ec44 e8f7a1feff      call    nt!IoSaveBugCheckProgress (fffff802`75508e40)
fffff802`7551ec49 4c8b7c2460      mov     r15,qword ptr [rsp+60h]
fffff802`7551ec4e 41bc06000000    mov     r12d,6
fffff802`7551ec54 4d85ff          test    r15,r15
fffff802`7551ec57 7442            je      nt!KiDisplayBlueScreen+0x2ab (fffff802`7551ec9b)  Branch

nt!KiDisplayBlueScreen+0x269:
fffff802`7551ec59 488b5c2468      mov     rbx,qword ptr [rsp+68h]
fffff802`7551ec5e 4885db          test    rbx,rbx
fffff802`7551ec61 7438            je      nt!KiDisplayBlueScreen+0x2ab (fffff802`7551ec9b)  Branch

nt!KiDisplayBlueScreen+0x273:
fffff802`7551ec63 488d35c641edff  lea     rsi,[nt! ?? ::FNODOBFM::`string' (fffff802`753f2e30)]
fffff802`7551ec6a 418bd4          mov     edx,r12d
fffff802`7551ec6d 488bce          mov     rcx,rsi
fffff802`7551ec70 e873020000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ec75 410fb717        movzx   edx,word ptr [r15]
fffff802`7551ec79 498b4f08        mov     rcx,qword ptr [r15+8]
fffff802`7551ec7d e866020000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ec82 418bd4          mov     edx,r12d
fffff802`7551ec85 488bce          mov     rcx,rsi
fffff802`7551ec88 e85b020000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ec8d 0fb713          movzx   edx,word ptr [rbx]
fffff802`7551ec90 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff802`7551ec94 e84f020000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ec99 eb2c            jmp     nt!KiDisplayBlueScreen+0x2d7 (fffff802`7551ecc7)  Branch

nt!KiDisplayBlueScreen+0x2ab:
fffff802`7551ec9b 488d5d80        lea     rbx,[rbp-80h]
fffff802`7551ec9f 498bfe          mov     rdi,r14

nt!KiDisplayBlueScreen+0x2b2:
fffff802`7551eca2 488b0e          mov     rcx,qword ptr [rsi]
fffff802`7551eca5 488bd3          mov     rdx,rbx
fffff802`7551eca8 e80ff9ffff      call    nt!KiBugCheckConvertParameterValueToUnicodeString (fffff802`7551e5bc)
fffff802`7551ecad 4883c310        add     rbx,10h
fffff802`7551ecb1 488d7608        lea     rsi,[rsi+8]
fffff802`7551ecb5 4883ef01        sub     rdi,1
fffff802`7551ecb9 75e7            jne     nt!KiDisplayBlueScreen+0x2b2 (fffff802`7551eca2)  Branch

nt!KiDisplayBlueScreen+0x2cb:
fffff802`7551ecbb 488b7c2478      mov     rdi,qword ptr [rsp+78h]
fffff802`7551ecc0 488d356941edff  lea     rsi,[nt! ?? ::FNODOBFM::`string' (fffff802`753f2e30)]

nt!KiDisplayBlueScreen+0x2d7:
fffff802`7551ecc7 498bd4          mov     rdx,r12
fffff802`7551ecca 488bce          mov     rcx,rsi
fffff802`7551eccd e816020000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ecd2 0fb7542470      movzx   edx,word ptr [rsp+70h]
fffff802`7551ecd7 488bcf          mov     rcx,rdi
fffff802`7551ecda e809020000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ecdf 4c392d8aaf7d00  cmp     qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)],r13
fffff802`7551ece6 741e            je      nt!KiDisplayBlueScreen+0x316 (fffff802`7551ed06)  Branch

nt!KiDisplayBlueScreen+0x2f8:
fffff802`7551ece8 498bd4          mov     rdx,r12
fffff802`7551eceb 488bce          mov     rcx,rsi
fffff802`7551ecee e8f5010000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ecf3 488b0d76af7d00  mov     rcx,qword ptr [nt!KiBugCheckDriver (fffff802`75cf9c70)]
fffff802`7551ecfa 0fb711          movzx   edx,word ptr [rcx]
fffff802`7551ecfd 488b4908        mov     rcx,qword ptr [rcx+8]
fffff802`7551ed01 e8e2010000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)

nt!KiDisplayBlueScreen+0x316:
fffff802`7551ed06 498bd4          mov     rdx,r12
fffff802`7551ed09 488bce          mov     rcx,rsi
fffff802`7551ed0c e8d7010000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ed11 498bd4          mov     rdx,r12
fffff802`7551ed14 488bce          mov     rcx,rsi
fffff802`7551ed17 e8cc010000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ed1c 488d5d88        lea     rbx,[rbp-78h]

nt!KiDisplayBlueScreen+0x330:
fffff802`7551ed20 0fb753f8        movzx   edx,word ptr [rbx-8]
fffff802`7551ed24 488b0b          mov     rcx,qword ptr [rbx]
fffff802`7551ed27 e8bc010000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ed2c 498bd4          mov     rdx,r12
fffff802`7551ed2f 488bce          mov     rcx,rsi
fffff802`7551ed32 e8b1010000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ed37 488d5b10        lea     rbx,[rbx+10h]
fffff802`7551ed3b 4983ee01        sub     r14,1
fffff802`7551ed3f 75df            jne     nt!KiDisplayBlueScreen+0x330 (fffff802`7551ed20)  Branch

nt!KiDisplayBlueScreen+0x351:
fffff802`7551ed41 498bd4          mov     rdx,r12
fffff802`7551ed44 488bce          mov     rcx,rsi
fffff802`7551ed47 e89c010000      call    nt!KiHeadlessDisplayString (fffff802`7551eee8)
fffff802`7551ed4c 488b8d70010000  mov     rcx,qword ptr [rbp+170h]
fffff802`7551ed53 4833cc          xor     rcx,rsp
fffff802`7551ed56 e8c5a5e9ff      call    nt!_security_check_cookie (fffff802`753b9320)
fffff802`7551ed5b 4c8d9c2480020000 lea     r11,[rsp+280h]
fffff802`7551ed63 498b5b30        mov     rbx,qword ptr [r11+30h]
fffff802`7551ed67 498b7338        mov     rsi,qword ptr [r11+38h]
fffff802`7551ed6b 498b7b40        mov     rdi,qword ptr [r11+40h]
fffff802`7551ed6f 498be3          mov     rsp,r11
fffff802`7551ed72 415f            pop     r15
fffff802`7551ed74 415e            pop     r14
fffff802`7551ed76 415d            pop     r13
fffff802`7551ed78 415c            pop     r12
fffff802`7551ed7a 5d              pop     rbp
fffff802`7551ed7b c3              ret
