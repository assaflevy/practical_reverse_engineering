# Exercise
In all of the calling conventions explained, the return value is stored in a 32-bit register (EAX). What happens when the return value does not fit in a 32-bit register? Write a program to experiment and evaluate your answer. Does the mechanism change from compiler to compiler

# Solution

### Return a struct made of 2 int's

The C code:
```
struct MyStruct { int a; int b; };

struct MyStruct init()
{
    struct MyStruct t = { 0xAAAA, 0xBBBB };
    return t;
}

int main()
{
    struct MyStruct s = init();
    return 0;
}
```

Assembles to (using WINE MSVC x86 v19.0 on godbolt.org):
```
_t$ = -8                                                ; size = 8
_init   PROC
        push    ebp
        mov     ebp, esp
        ; Allocate 8 bytes on the stack
        sub     esp, 8
        ; Fill those bytes with literal values
        mov     DWORD PTR _t$[ebp], 0AAAAh
        mov     DWORD PTR _t$[ebp+4], 0BBBBh
        ; Copy the first value to EAX
        mov     eax, DWORD PTR _t$[ebp]
        ; Copy the second value to EDX
        mov     edx, DWORD PTR _t$[ebp+4]
        mov     esp, ebp
        pop     ebp
        ret     0
_init   ENDP

_mainStruct$ = -8                                                ; size = 8
_main   PROC
        push    ebp
        mov     ebp, esp
        sub     esp, 8
        call    _init
        ; Populate the struct with eax and edx
        mov     DWORD PTR _mainStruct$[ebp], eax
        mov     DWORD PTR _mainStruct$[ebp+4], edx
        ; Set return value to zero
        xor     eax, eax
        mov     esp, ebp
        pop     ebp
        ret     0
_main   ENDP
```

All compilers that are tested (msvc, clang, gcc) place the data in `eax:edx` if it is 8 bytes or less.
It doesn't matter whether the return value is a built-in type (e.g. `long long`) or a `struct` that holds 2 integers or an array of 8 `char`'s, or 3 `short`'s, etc. As long as it
fits within two register then `eax:edx` will be used to carry the data back to the caller.

### Return a struct made of 3 int's

```
struct MyStruct { int a; int b; int c; };

struct MyStruct init()
{
    struct MyStruct t = { 0xAAAA, 0xBBBB, 0xCCCC };
    return t;
}

int main()
{
    struct MyStruct mainStruct = init();
    return 0;
}
```

```
_t$ = -12                                         ; size = 12
$T1 = 8                                       ; size = 4
_init   PROC
        push    ebp
        mov     ebp, esp
        ; Allocate 12 bytes on the stack = 3 int's
        sub     esp, 12                             ; 0000000cH
        mov     DWORD PTR _t$[ebp], 0AAAAh ; first int
        mov     DWORD PTR _t$[ebp+4], 0BBBBh ; second int
        mov     DWORD PTR _t$[ebp+8], 0CCCCh ; third int
        ; T1, which sits at a positive offset from EBP and thus is a parameter, is a pointer.
        mov     eax, DWORD PTR $T1[ebp]
        mov     ecx, DWORD PTR _t$[ebp] ; Grap the first int from `t`
        mov     DWORD PTR [eax], ecx ; Place it at offset 0 of the pointer
        mov     edx, DWORD PTR _t$[ebp+4] ; Grab the second int from `t`
        mov     DWORD PTR [eax+4], edx ; Place it at offset 4 of the pointer
        mov     ecx, DWORD PTR _t$[ebp+8] ; "
        mov     DWORD PTR [eax+8], ecx ; "
        mov     eax, DWORD PTR $T1[ebp] ; Return the pointer
        mov     esp, ebp
        pop     ebp
        ret     0
_init   ENDP

$T1 = -24                                         ; size = 12
_mainStruct$ = -12                                  ; size = 12
_main   PROC
        push    ebp
        mov     ebp, esp
        ; Allocate 24 bytes on the stack, enough for exactly two MyStruct's.
        sub     esp, 24                             ; 00000018H
        ; Pass the address of the unnamed struct to init(). Even though we didn't specify that init() receives parameters,
        ; the compiler is doing it for us.
        lea     eax, DWORD PTR $T1[ebp]
        push    eax
        call    _init
        add     esp, 4
        mov     ecx, DWORD PTR [eax] ; Grab the first int from the temporary struct
        mov     DWORD PTR _mainStruct$[ebp], ecx ; and place in the one we declared
        mov     edx, DWORD PTR [eax+4] ; second value
        mov     DWORD PTR _mainStruct$[ebp+4], edx
        mov     eax, DWORD PTR [eax+8] ; third value
        mov     DWORD PTR _mainStruct$[ebp+8], eax
        ; return 0
        xor     eax, eax
        mov     esp, ebp
        pop     ebp
        ret     0
_main   ENDP
```

We can see that when the data is bigger than 8 bytes, the compiler will allocate space on the stack to hold that data, and secretly slip a pointer to that stack location for the function to write the data to. Upon return, the calling function will copy the data from the temporary space to the declared variable.

The question that immediately arises is why the temporary struct is needed, as the compiler could pass the address of the declared one just the same.
