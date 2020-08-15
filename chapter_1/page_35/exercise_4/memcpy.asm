global _main
extern _printf

section .data
data: db 0xa8, 0x1a, 0x4a, 0xf3, 0x15, 0xf6, 0x08, 0x67
data_len: db 8
format: db 'my_memcmp() returns: %d', 0

section .text

my_memcpy:
	mov edi, [esp + 4]
	mov esi, [esp + 8h]
	mov ecx, [esp + 0Ch]
	rep movsb
	mov eax, [esp + 4]
	ret
	
my_memcmp:
	mov edi, [esp + 4]
	mov esi, [esp + 8h]
	mov ecx, [esp + 0Ch]
my_memcmp_loop:
	mov al, byte [edi]
	cmp al, byte [esi]
	jb my_memcmp_below
	ja my_memcmp_above
	inc edi
	inc esi
	dec ecx
	jnz my_memcmp_loop
	xor eax, eax
	ret
my_memcmp_below:
	or eax, 0xffffffff
	ret
my_memcmp_above:
	mov eax, 1
	ret

_main:
	push ebp
	mov ebp, esp
	sub esp, 0Ah
	push 0Ah
	lea eax, data
	push eax
	lea eax, [ebp-0Ah]
	push eax
	call my_memcpy
	add esp, 0Ch

	push 0Ah
	lea eax, [ebp-0Ah]
	push eax
	lea eax, data
	push data
	call my_memcmp
	add esp, 0Ch
	push eax
	push format
	call _printf
	add esp, 8
	add esp, 0Ah
	mov esp, ebp
	pop ebp
	ret
	
