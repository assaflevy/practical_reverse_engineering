# Exercise

Sample H. The function sub_10BB6 (actually sub_10BB2) has a loop searching for something.
First recover the function prototype and then infer the types based on the context. Hint: You should probably have a copy of the PE specification nearby.

# Solution

The function searches for a PE section by name.

The `+3Ch` offset is the first hint, which is `e_lfanew`. Then `+14h` obtains the size of the optional header, and finally both of those `+18h` brings us right at the beginning of the sections header.
Register `edi` is added `28h` which is the size of a section entry, and always points to the name.
Based on other functions' use of `dword_169a4`, I believe it's doing string compare.
Hence the first parameter `esp+4` is the PE Base, and the second parameter `esp+14` (because of the preceeding 3 pushes) is a string.
Finally the function rewinds the stack upon return so the calling convention is `__stdcall`.
The function has no prolog/epilog.

The calling convention is `IMAGE_SECTION_HEADER* __stdcall FindSectionByName(LPBYTE lpBaseAddress, const char* sectionName)`


