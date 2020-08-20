# Exercise
SampleH.
The function sub_13846 references several structures whose types are not entirely clear.
Your task is to first recover the function prototype and then try to reconstruct the structure fields.
After reading Chapter 3, return to this exercise to see if your understanding has changed.
(Note: This sample is targeting Windows XP x86.)

# Solution
The target references NDIS.sys (so something to do with network), HAL.sys, ntoskrnl.exe.
The import table seems obfuscated, and I don't have access to WinXP dlls. So I'm gonna go on a hunch here.
Also, strings are referenced +3 bytes offset from where they actually begin. So in IDA "LoadLibrary" looks like "dLibrary" in IDA with the "Loa" part coming just before, as bytes.

Function is reading ecx & edx without initializing them, therefore they were initialized outside, meaning this is a __fastcall.

```
Struct1 (ECX/PARAM1):
	+0x23 Count? : UChar
	+0x60 Struct4 : Ptr32
}

Struct2 (EDX/PARAM2):
	+0x8 Struct5 : Ptr32

Struct3:
	+0x0 functionIndex : UChar
	+0x10 pStruct2 : Ptr32
	+0x24 Struct4

Struct5:
	+0x38 : Ptr32 Array Base

DWORD sub_13842(LPVOID param1, LPVOID param2)
{
eax = param1->ptr_0x60h;
eax -= 0x24;
param1->ptr_0x60 = eax;
eax->field_0x14 = param2;
param1->field_0x23--;

// Call function by index.
// So param2->field_0x8 is pointer to some struct, where 0x38 is an array of functions.
BYTE function_id = eax->byte_0x00;
base = param2->field_0x8;
// The paramaeters are passed as they are to the indexed function. I'd surmise that they are some known, maybe OS structures.
return ((DWORD(*)(LPVOID,LPVOID)(base+function_id*4+0x38))(param2, param1);
}
```
