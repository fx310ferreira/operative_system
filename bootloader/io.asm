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
  mov BH, 0x00 ; page number
  int 0x10
  ret

;--------------------------
; Routine: PutChar
; Purpose: Prints a character at the current cursor location
; Parameters:
;         AL = character
;         BL = color
; Return: None
;--------------------------
PutChar:
  mov AH, 0x0E ; 
  mov BH, 0x00 ; page number
  int 0x10
  ret

;--------------------------
; Routine: Print
; Purpose: Prints a string
; Parameters:
;         DS:SI = address of the string
; Return: None
;--------------------------
Print:
  mov BL, 0x07
  mov CX, 1
.loop:
  lodsb
  cmp AL, 0
  je .return
  call PutChar
  jmp .loop
.return:
  ret