; FILENAME: EXER17.ASM
; Programmer Name: Raziff D. Gumapon
; Date: September 20, 2024
; Description: This assembly language program will get string input and
; display back string

.model small
.stack 200h
.data
MAXIMUM_STRING_LENGTH EQU 1000
StringInput DB MAXIMUM_STRING_LENGTH DUP (?)
InputPrompt db 'Enter text: $'
.code
ProgramStart:
    mov ax, @data
    mov ds,ax                       ; set DS to point to the data segment

    mov dx, offset InputPrompt
    mov ah, 9
    int 21h

    mov ah,3fh                      ; DOS read from handle function
    mov bx,0                        ; standard input handle
    mov cx, MAXIMUM_STRING_LENGTH   ; read up to maximum number of characters
    mov dx, offset StringInput      ; store the string here
    int 21h                         ; get the string
    
    and ax, ax                      ; were any character read?
    jz Done                         ; no, so you're done
    mov cx, ax                      ; put string length in CX where
                                    ; you can use it as a counter
    push cx                         ; save the string length
    mov bx, offset StringInput      

    pop cx                          ; get back the string length
    mov ah,40h                      ; DOS write form handle function
    mov bx,1                        ; standard output handle
    mov dx, offset StringInput      ; prepare to print the string 
    int 21h                         ; print the string

Done:
    mov ah,4ch                      ; DOS terminate program function
    int 21h                         ; terminate the program
  
END ProgramStart