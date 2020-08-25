# Exercise
If you did the exercises for InsertHeadList, InsertTailList, RemoveHeadList, RemoveTailList, and RemoveEntryList on Windows 8, you should have observed a code construct common to all these functions. This construct should also enable you to easily spot the inlined list insertion and removal routines. Explain this code construct and why it is there. Hint: This construct exists only on Windows 8 and it requires you to look at the IDT.

# Solution
This would be the int `29h`, which is the `__fastfail` mechanism.

This mechanism terminates a process as fast as possible with the minimum of actions taken.

Windows 10 Kernel Version 19041 MP (2 procs) Free x64<br>
Product: WinNt, suite: TerminalServer SingleUserTS<br>
Edition build lab: 19041.1.amd64fre.vb_release.191206-1406

!idt 29 brings:
`29:	fffff80275a22d40 nt!KiRaiseSecurityCheckFailureShadow`

Let's skim this function.

If going really fast through the assembly, this function is strikingly similar to `KiSystemCall64`.

It goes on to call `KiFastFailDispatch` -> `KiBugCheckDispatch` and the whole system goes down. KeBugCheck2 contains a lot of interesting stuff.

So if a flaw is detected in one of the kernel structure we get a bug check.
