; simple bootloader
; *************
[org 0x7c00]
[bits 16]

LOAD_ADDRESS equ 10000h
LOAD_SEGMENT equ 1000h

; set up the data segment
mov ax, 0x0000
mov ds, ax
; set up the stack
mov ax, 0x07E0
mov ss, ax
mov sp, 0x2000
; set up the extra segment to load the kernel
mov ax, LOAD_SEGMENT
mov es, ax

jmp boot

%include "io.asm"
%include "diskload.asm"
%include "gdt.asm"

msg db "Loading Kernel", 0

boot: 
  cli ; disable interrupts
  cld
  mov si, msg
  call Print

  ;load the kernel
  xor bx, bx
  mov al, 17 ; load 17 sectors
  call LoadKernel

  ; activae the protected mode
	cli
	lgdt[gdt_descriptor]
	mov eax, cr0
	or al, 0x01
	mov cr0, eax
	jmp CODE_SEG:startPM

[bits 32]
startPM:
  mov si, 0x18
  mov eax, dword [es:si]
  call eax

  jmp $

; clear the first 512 bytes of memory
times 510-($-$$) db 0
dw 0xAA55
