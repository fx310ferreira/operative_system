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

;--------------------------
; Routine: Print
; Purpose: Prints a string
; Parameters:
;         DS:SI = address of the string
; Return: None
;--------------------------
Print:
  
  ret

