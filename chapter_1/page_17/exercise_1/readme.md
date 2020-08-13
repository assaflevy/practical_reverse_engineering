#Exercise
Given what you learned about `CALL` and `RET`, explain how you would read the value of `EIP`? Why can’t you just do `MOV EAX, EIP`?

#Solution
The contents of `EIP` aren't readable directly by a `MOV` instruction since such an instruction simply doesn't exist and can't be assembled.
However there are workarounds. Indirectly, EIP can be read by performing a call:

```
call my_label ; push EIP to the stack and jump to `my_label`. This is equivalent to `sub esp, 4`, `mov dword ptr [esp], eip`, `jmp my_label`.
my_label:
pop eax ; pop EIP from the stack to eax. This is equivalent to `mov eax, dword ptr [esp]`, `add esp, 4`.
```

  
