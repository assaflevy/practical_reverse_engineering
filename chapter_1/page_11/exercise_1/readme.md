`[EBP+8]` in line 1 holds a byte pointer, which is inferred by the `scasb` instruction at line 5.
`[EBP+0Ch]` in line 8 also holds a byte pointer, since we're taking a byte from it and placing it in `al` which is 8 bits. Another hint is the `stosb` instruction.

The first part of the function (lines 1-7) looks for the first byte that is zero, starting at the address `[ebp+8]`.
After line 7 `ecx` will hold the index of the zero byte. So that part performs strlen().
The second part of the function (lines 8-11) will place the byte at [ebp+0Ch] in all `ecx` bytes starting at `edx` (which is `[ebp+8]`).
Then the function will place the value of `edx` in `eax`, thus returning the first parameter, which is a string.

`[ebp+8]` is normally the first parameter to the function: `[ebp]` holds the return address and `[ebp+4]` is the previous value of `rsp`.

So the parameters to the function are two:
`[ebp+8]` is a string pointer
`[ebp+0Ch]` is a character

The entire function thus fills a null-terminated string with a certain character by first performing `strlen()` to get the size of the string, followed by `memset()`, and returns the string.

