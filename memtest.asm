[org 0x7c00]

mov bx, msg
call print_string

%include "print/print_string.asm"

msg:
	db 'HELLO WORLD!',0

times  510-($-$$) db 0
times  256 dw 0xdada
times  256 dw 0xface
dw 0xaa55
