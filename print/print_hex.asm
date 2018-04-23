print_hex:
	pusha
	begin:
		call put_hex
		shl bx, 0x4
		cmp bx, 0x0000
		jne begin
	popa
	ret

put_hex:
	pusha
	mov ah, 0x0e
	and bx, 0xf000
	shr bx, 12
	cmp bx, 0x0009
	jg big
	add bx, 0x0030
	mov al, bl
	int 0x10
	popa
	ret
	big:
		add bx, 0x0037
		mov al, bl
		int 0x10
		popa
		ret
