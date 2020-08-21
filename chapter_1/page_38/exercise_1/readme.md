# Exercise


# Solution
Beyond `call-pop`, we can use actual RIP-relative addressing:

```
global _get_rip
section .text
_get_rip:
	mov rax, _get_rip
	ret
```

Or test a C program from a debugger:
```
#pragma optimize("", off)
int main(int argc)
{
    unsigned __int64 p = (unsigned __int64)&main;
    return 0;
}
```

Which assembles to:
```
#pragma optimize("", off)
int main(int argc)
{
00007FF781461000 89 4C 24 08          mov         dword ptr [rsp+8],ecx  
00007FF781461005 83 EC 18             sub         esp,18h  
    unsigned __int64 p = (unsigned __int64)&main;
00007FF781461008 48 8D 05 F1 FF FF FF lea         rax,[main (07FF781461000h)]  
00007FF78146100F 48 89 04 24          mov         qword ptr [rsp],rax  
    return 0;
00007FF781461013 33 C0                xor         eax,eax  
}
00007FF781461015 48 83 C4 18          add         rsp,18h  
00007FF781461019 C3                   ret  
```

The cool part is this line:<br>
`00007FF781461008 48 8D 05 F1 FF FF FF lea         rax,[main (07FF781461000h)]`<br>
The opcodes don't actually do `mov rax, 07FF781461000h`. That's the VS debugger making life easier for us.<br>
If we take opcodes `48 8D 05 F1 FF FF FF` and feed them to https://onlinedisassembler.com/odaweb/ we get:<br>
`lea rax, [rip+0xfffffffffffffff1]`<br>
Taking into account that when this instruction is executing `rip` already points at the next instruction at `00007FF78146100F`, the instruction does this:<br>
`0x00007FF78146100F+0xfffffffffffffff1=7FF781461000` (effectively subtracting 15 from `rip`), bringing us squarely at the beginning of `main`.
