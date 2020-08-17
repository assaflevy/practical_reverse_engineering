//nt!RtlValidateUnicodeString:
//fffff802`8053cc90 33c0 xor eax, eax
//fffff802`8053cc92 85c9            test    ecx, ecx
//fffff802`8053cc94 753c            jne     nt!RtlValidateUnicodeString + 0x42 (fffff802`8053ccd2)  Branch
//
//nt!RtlValidateUnicodeString + 0x6:
//fffff802`8053cc96 4885d2          test    rdx, rdx
//fffff802`8053cc99 742b            je      nt!RtlValidateUnicodeString + 0x36 (fffff802`8053ccc6)  Branch
//
//nt!RtlValidateUnicodeString + 0xb:
//fffff802`8053cc9b 440fb702        movzx   r8d, word ptr[rdx]
//fffff802`8053cc9f 41f6c001        test    r8b, 1
//fffff802`8053cca3 752d            jne     nt!RtlValidateUnicodeString + 0x42 (fffff802`8053ccd2)  Branch
//
//nt!RtlValidateUnicodeString + 0x15:
//fffff802`8053cca5 0fb74a02        movzx   ecx, word ptr[rdx + 2]
//fffff802`8053cca9 f6c101          test    cl, 1
//fffff802`8053ccac 7524            jne     nt!RtlValidateUnicodeString + 0x42 (fffff802`8053ccd2)  Branch
//
//nt!RtlValidateUnicodeString + 0x1e:
//fffff802`8053ccae 66443bc1        cmp     r8w, cx
//fffff802`8053ccb2 771e            ja      nt!RtlValidateUnicodeString + 0x42 (fffff802`8053ccd2)  Branch
//
//nt!RtlValidateUnicodeString + 0x24:
//fffff802`8053ccb4 41b9feff0000    mov     r9d, 0FFFEh
//fffff802`8053ccba 66413bc9        cmp     cx, r9w
//fffff802`8053ccbe 7712            ja      nt!RtlValidateUnicodeString + 0x42 (fffff802`8053ccd2)  Branch
//
//nt!RtlValidateUnicodeString + 0x30:
//fffff802`8053ccc0 48394208        cmp     qword ptr[rdx + 8], rax
//fffff802`8053ccc4 7401            je      nt!RtlValidateUnicodeString + 0x37 (fffff802`8053ccc7)  Branch
//
//nt!RtlValidateUnicodeString + 0x36:
//fffff802`8053ccc6 c3              ret  Branch
//
//nt!RtlValidateUnicodeString + 0x37:
//fffff802`8053ccc7 664585c0        test    r8w, r8w
//fffff802`8053cccb 7505            jne     nt!RtlValidateUnicodeString + 0x42 (fffff802`8053ccd2)  Branch
//
//nt!RtlValidateUnicodeString + 0x3d:
//fffff802`8053cccd 6685c9          test    cx, cx
//fffff802`8053ccd0 74f4            je      nt!RtlValidateUnicodeString + 0x36 (fffff802`8053ccc6)  Branch
//
//nt!RtlValidateUnicodeString + 0x42:
//fffff802`8053ccd2 b80d0000c0      mov     eax, 0C000000Dh
//fffff802`8053ccd7 c3              ret

// Bit of a mystery the first parameter. Unused except for failing if nonzero.
NTSTATUS RtlValidateUnicodeString(
    ULONG_PTR param1,
    PUNICODE_STRING s
)
{
    if (param1 != 0)
        return 0xC000000D;

    if (s == nullptr)
        return 0;

    if (s->Length & 0x1 || s->MaximumLength & 0x1 || 
        s->Length > s->MaximumLength || s->MaximumLength > 0xFFFE ||
        (s->Buffer == nullptr && (s->Length != 0 || s->MaximumLength != 0)))
        return 0xC000000D;

    return 0;
}
