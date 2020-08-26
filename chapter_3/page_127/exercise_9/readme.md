# Exercise

In the walk-through, we mentioned that a driver can enumerate all loaded modules with the documented API `AuxKlibQueryModuleInformation`. Does this API guarantee that the returned module list is always up-to-date? Explain your answer. Next, reverse engineer `AuxKlibQueryModuleInformation` on Windows 8 and explain how it works. How does it handle the case when multiple threads are requesting access to the loaded module list? Note:The internal function handling this request (and others) is fairly large, so you will need some patience. Alternatively, you can use a debugger to help you trace the interesting code.

# Solution

* Does this API guarantee that the returned module list is always up-to-date? Explain your answer.

   The returned data represents the loaded modules at a certain point in the past (very near past, but still). In a multi-tasked system things change all the time in parallel processes, so the list can never be guaranteed to be up-to-date, unless, that is, everything stops but the thread doing the inquiry. Then it would be an accurate description of the current system.

* Reverse engineer `AuxKlibQueryModuleInformation` on Windows 8 and explain how it works.

   The call graph is:
   AuxKlibQueryModuleInformation ->
     ZwQuerySystemInformation ->
	   NtQuerySystemInformation ->
	     ExpQuerySystemInformation ->
		   ExAcquireResourceExclusiveLite(PsLoadedModuleResource)
		   ExpQueryModuleInformation
		   ExReleaseResourceExclusiveLite(PsLoadedModuleResource)
		   
   `ExpQueryModuleInformation` saves the `PsLoadedModuleList` pointer which is a `_LIST_ENTRY` head, and traverses the list until coming full circle. The rest of this function is mere parsing of that data and is irrelevant to us.
   
* How does it handle the case when multiple threads are requesting access to the loaded module list?

   `ExpQuerySystemInformation` uses `KeEnterCriticalRegion/KeLeaveCriticalRegion` to hold / restore normal APCs delivery. Unclear why `ExEnterCriticalRegionAndAcquireResourceExclusive` wasn't used, and unclear where is the call to `KeEnterCriticalRegion`.
   
   Regardless of the module list, it is of note that `ZwQuerySystemInformation` employs `cti/sti` instructions to hold maskable interrupts, effectively blocking the scheduler from switching to other threads.
   
   It was too hard to analyze `ZwQueryInformationProcess` just from a dead listing, so I revert to stepping through it in windbg.
   
   I notice that the `uf` command in windbg does NOT necessarily return the whole function as in the disassembly window.
   I should pay better attention to the message 'Flow analysis was incomplete, some code may be missing' in the beginning.
   And what's more fun is that it's also the other way around.
   
