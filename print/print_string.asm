print_string:
	mov ah, 0x0e
	add bx, 0x7c00
	
	start:
		mov al, [bx]
		int 0x10
		inc bx
		cmp al, 0x00
		jne start
	ret
