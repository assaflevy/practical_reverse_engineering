# Exercise
In the example walk-through, we did a nearly one-to-one translation of the assembly code to C. As an exercise, re-decompile this whole function so that it looks more natural. What can you say about the developer’s skill level/experience? Explain your reasons. Can you do a better job?

# Solution
```
LPCSTR g_processName = 0x10007C50;
LPTHREAD_START_ROUTINE g_fn = (LPTHREAD_START_ROUTINE)0x100032D0;

BOOL WINAPI DllMain(HINSTANCE hInstDll, DWORD fdwReason, LPVOID lpvReserved)
{
	PROCESSENTRY32 pe32;
	unsigned long long idtr;
	__asm sidt fword ptr [idtr];
	// The code restricts itself to IDT sitting either below 8003F400h or above 80047400h. This is the IDT base on WinXP (however in further XP versions the IDT base was randomized). Moreover, this would be the IDT only for the first processor. There are a myriad of other ways to detect VM...
	if ( (ULONG)(idtr>>2) > 8003F400h || (ULONG)(idtr>>2) < 80047400h )
		return 0;
	
	// The separate zero'ing of the struct's members and dwSize seems redundant.
	pe32.dwSize = 0;
	memset(&pe32, 0, sizeof(pe32)-4);
	
	// Enumerate all process in the system.
	HANDLE tlh = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);		
	if ( tlh == INVALID_HANDLE_VALUE )
		return 0;
	
	pe32.dwSize = sizeof(pe32);
	BOOL retVal = Process32First(tlh, &pe32);
	while ( TRUE )
	{
		if ( retVal == FALSE )
			return 0;
		
		if ( stricmp(pe32.szExeFile, g_processName) == 0 )
		{
			if ( pe32.th32ParentProcessID == pe32.th32ProcessID )
				return 0;
			break;
		}
		
		retVal == Process32Next(tlh, &pe32);
	}

	// In the book they decompiled the code as follows:
	//
	//		if (fdwReason == DLL_PROCESS_DETACH) { return FALSE; }
	//		if (fdwReason == DLL_THREAD_ATTACH || fdwReason == DLL_THREAD_DETACH) { return TRUE; }
	//		CreateThread(0, 0, (LPTHREAD_START_ROUTINE) 0x100032D0, 0, 0, 0);
	//		return TRUE;
	//
	// However the way I understand lines 83-85 it's simply this:
	
	// This check should have been at the start.
	if ( fdwReason == DLL_PROCESS_ATTACH )
		CreateThread(0, 0, g_fn, 0, 0, 0);
	
	return 1;
}
```
