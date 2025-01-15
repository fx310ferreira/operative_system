; simple bootloader
; *************
org 0x7c00
bits 16

section .data
  msg db "Hello, World!", 0ah, 0dh, 0h

section .text
  global boot

  ;--------------------------
  ; Routine: MovCursor
  ; Purpose: Moves the cursor to a specific location on the screen
  ; Parameters:
  ;          BH = Y coordinate (row)
  ;          BL = X coordinate (column)
  ; Return: None
  ;--------------------------
  MovCursor:
    mov AH, 0x02
    mov DH, BH ; row
    mov DL, BL ; column
    mov BH, 0x00 ; page number
    int 0x10
    ret

  ;--------------------------
  ; Routine: PutChar
  ; Purpose: Prints a character at the current cursor location
  ; Parameters:
  ;         AL = character
  ;         BL = color
  ;         CX = number of time to print the character
  ; Return: None
  ;--------------------------
  PutChar:
    mov AH, 0x09 ; 
    mov BH, 0x00 ; page number
    int 0x10
    ret


  boot: 
    cli ; disable interrupts
    cld
    hlt ; halt the system

    mov BH, 0x01
    mov BL, 0x07
    call MovCursor
    mov AL, "H"
    mov BL, 0x07
    mov CX, 1
    call PutChar


  ; clear the first 512 bytes of memory

  times 510-($-$$) db 0
  dw 0xAA55
