;--------------------------
; Routine: LoadKernel
; Purpose: Load AL sectors from drive
; Parameters:
;          AL = number of sectors to load
;          ES:BX = address to load the sectors
; Return: None
;--------------------------
LoadKernel:
    pusha
    mov cl, 2 ; sector number
    mov ch, 0 ; cylinder number
    mov dh, 0 ; head number
    mov dl, 0 ; drive number
    mov ah, 0x02 ; read function
    int 0x13
    popa
    ret