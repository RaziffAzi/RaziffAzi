;FILENAME: EXER13.ASM
;Programmer Name: Raziff D. Gumapon
;Date; September 20,2024
;Description: This assembly language program will display multiple string variables on separate lines.

.model small
.stack 200h
.DATA
String1 db 'Line1', 0dh, 0Ah, '$'
String2 db 'Line2', 0dh, 0Ah, '$'
String3 db 'Line3', 0dh, 0Ah, '$'
.code
ProgramStart:
    mov ax, @data
    mov ds, ax

    mov ah,9                 ; DOS print string function
 
    mov dx, offset String1   ; 1st string to print
    int 21h                  ; invoke DOS to print string

    mov dx, offset String2   ; 2nd string to print 
    int 21h                  ; invoke DOS to print string

    mov dx, offset String3   ; 3rd stirng to print
    int 21h                  ; invoke DOS to print string

    mov ah, 4ch              ; DOS terminate program function
    int 21h                  ; invoke DOS to end program
End ProgramStart
