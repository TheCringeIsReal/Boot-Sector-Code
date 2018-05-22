[org 0x7c00]


mov bx, msg
call print_string_pm

mov [BOOT_DRIVE], dl ; BIOS  stores  our  boot  drive  in DL, so it’s
			; best to  remember  this  for  later.
mov bp, 0x8000         ; Here we set our  stack  safely  out of the
mov sp, bp             ; way , at 0x8000
mov bx, 0x9000         ; Load 5 sectors  to 0x0000(ES):0 x9000(BX)
mov dh, 5               ; from  the  boot  disk.
mov dl, [BOOT_DRIVE]
call  disk_load

mov bx, [0x9000 + 512]
call print_hex

jmp $

%include "print/print.asm"
%include "print/print_hex.asm"
%include "load_disk.asm"

; Global vars
msg:
	db 'HELLO WORLD!',0

BOOT_DRIVE: db 0

times  510-($-$$) db 0
dw 0xaa55

times  256 dw 0xdada
times  256 dw 0xface
