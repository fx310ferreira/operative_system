; simple bootloader
; *************
org 0x7c00
bits 16

; set up the data segment
mov ax, 0x07C0 ;;todo this might be wrong
mov ds, ax
; set up the stack
mov ax, 0x07E0
mov ss, ax
mov sp, 0x2000
; set up the extra segment to load the kernel
mov ax, 0x1000
mov es, ax

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
