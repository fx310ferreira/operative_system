; simple bootloader
; *************
org 0x7c00
bits 16

; set up the data segment
mov ax, 0x0000
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
%include "diskload.asm"

msg db "Loading Kernel", 0

boot: 
  cli ; disable interrupts
  cld
  mov si, msg
  call Print

  ; load the kernel
  mov ax, 0x50  
  mov es, ax
  xor bx, bx
  mov al, 2 ; load 2 sectors
  call DiskLoad
  jmp 0x50:0x0 ; jump to the kernel

  hlt ; halt the system

; clear the first 512 bytes of memory
times 510-($-$$) db 0
dw 0xAA55
