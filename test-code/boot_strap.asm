mov bx, BOOT_MSG
call print_string
mov bx, 0xff58
call print_hex

%include "print/print_string.asm"
%include "print/print_hex.asm"

BOOT_MSG:
	db 'REDRUM',0
HEX_OUT:
	db 'aaaa',0

times 510-($-$$) db 0
dw 0xaa55
