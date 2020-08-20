# Exercise

Sample L. Explain what function sub_1000CEA0 does and then decompile it back to C.

# Solution

Bit 63 of the paging entries determines if data from the page is executable or not. In intel's manual (see chapter 5.13) it's called "Execute-disable" (XD) flag.
This bit exists in all page structures in the paging hierarchy, meaning that it can be enforced on the page-level or on entire regions.
