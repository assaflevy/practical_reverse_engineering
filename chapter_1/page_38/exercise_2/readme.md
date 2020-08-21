We have a string at virtual (linear) address: `00007FF655451F98`<br>
```
Bits Positions:  63-60    59-56   55-52    51-48    47-44    43-40    39-36    35-32    31-28    27-24    23-20    19-16    15-12    11-8     7-4      3-0
                 0        0       0        0        7        F        F        6        5        5        4        5        1        F        9        8
Bits:            0000     0000    0000     0000     0111     1111     1111     0110     0101     0101     0100     0101     0001     1111     1001     1000
```

First read CR3 to get the physical address of the PML4 structure:
```
1: kd> rcr3
cr3=000000002154d002
```

Stage 1: Getting the appropriate PML4 entry
-------------------
The manual states that bit positions "M-1:12" contain "Physical address of the 4-KByte aligned PML4 table used for linear-address translation[1]"
[1] M is an abbreviation for MAXPHYADDR, which is at most 52.

Bits 51:12 (40 bits) of CR3 are `2154d` = `100001010101001101`<br>
Bits 11:3 (9 bits) are 47:39 of the linear address are `7F1` = `011111111`<br>
Bits 2:0 are zeroes = `000`<br>
Glue them together: `100001010101001101011111111000` = `2154D7F8`<br>

Let's see it:
```
1: kd> !dq 2154D7F8 L1
#2154d7f8 8a000000`00959867
```

So the 9 bits from 47:39 of the linear address are the index of the entry in the PML4. 9 bits can specify 512 unique values.<br>

Stage 2: Get the Page-Directory-Pointer-Table-Entry
----------------
The base of Page-Directory-Pointer-Table sits at bits 51:12 of the PML4 entry obtained in the previous stage.

Bits 51:12 (40 bits) of the PML4E are `959` = `100101011001`<br>
Bits 11:3 (9 bits) are 38:30 of the linear address are `111011001`<br>
Bits 2:0 are zeroes = `000`<br>
Together: `100101011001111011001000` = `959EC8`<br>

Let's see it:
```
1: kd> !dq 959EC8 L1
#  959ec8 0a000000`3f45a867
```

Stage 3: Get the Page Directory Entry
--------------------
The base of the page directory sits at bits 51:12 of the PDPT entry obtained in the previous stage.

Bits 51:12 (40 bits) of the PDPTE are `3f45a` = `111111010001011010`<br>
Bits 11:3 (9 bits) are bits 29:21 of the linear address = `010101010`<br>
Bits 2:0 are zeroes = `000`<br>
Together: `111111010001011010010101010000` = `3F45A550`<br>

Let's see:
```
1: kd> !dq 3F45A550 L1
#3f45a550 0a000000`85b5c867
```

Stage 4: Get the Page Table Entry
----------------
Bits 51:12 (40 bits) of the PDE are `85b5c` = `10000101101101011100`<br>
Bits 11:3 (9 bits) are bits 20:12 of the linear address = `001010001`<br>
Bits 2:0 (3 bits) are zeroes = `000`<br>
Together: `10000101101101011100001010001000` = `85B5C288`<br>

Let's see:
```
1: kd> !dq 85B5C288 L1
#85b5c288 80000000`bf19d025
```

Stage 5: Get the Page+offset
-------------------
Bits 51:12 (40 bits) of the PTE are `bf19d`<br>
Bits 11:0 (12 bits) are `F98` from the linear address.<br>
Together: bf19df98<br>

Let's see:
```
1: kd> da /p bf19df98
00000000`bf19df98  "I wanna get physical, physical.."
00000000`bf19dfb8  "."

1: kd> da 00007FF655451F98
00007ff6`55451f98  "I wanna get physical, physical.."
00007ff6`55451fb8  "."
```
















