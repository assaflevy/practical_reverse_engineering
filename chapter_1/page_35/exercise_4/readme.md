# Exercise
Implement the following functions in x86 assembly: strlen, strchr, mem-cpy, memset, strcmp, strset.

# Solution
See .asm files in this directory.

I'm compiling with nasm:
`nasm -fwin32 prog.asm`

And linking with microsoft's linker:
* Open a development prompt
* Run `link prog.obj "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Tools\MSVC\14.26.28801\lib\onecore\x86\msvcrt.lib" "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\ucrt\x86\ucrtd.lib" legacy_stdio_definitions.lib`
  
  Note: You need all 3 above to work with printf on windows 10.
  
