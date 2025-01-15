; simple bootloader
; *************
org 0x7c00
bits 16

mov ax, 0x07E0      ; 07E0h = (07C00h+200h)/10h, beginning of stack segment
mov ss, ax
mov sp, 0x2000      ; 8k of stack space
; end of stack segment 0x07E0:0x2000=0x09E00

jmp boot

%include "io.asm"

msg db "Hello, World!", 0

boot: 
  cli ; disable interrupts
  cld
  mov si, msg
  call Print

  hlt ; halt the system

; clear the first 512 bytes of memory

times 510-($-$$) db 0
dw 0xAA55
