; FILENAME: EXER21.ASM
; Programmer Name: Raziff D. Gumapon
; Date: September 22, 2024
; Description: This program prompts the user to input their first, 
; middle, and family names, then displays a greeting with the full name

.MODEL small
.STACK 200h
.DATA
    line1 db 'REGISTRATION FORM$', 0dh, 0ah
    line2 db 0Dh, 0Ah, 0Ah,'Enter your first name: $'
    line3 db 0Dh, 0Ah, 0Ah,'Enter your middle name: $'
    line4 db 0Dh, 0Ah, 0Ah, 'Enter your family name: $'
    line5 db 0Dh, 0Ah, 0Ah, 'Hello, $'
    firstName db 20, 20 dup(?)
    middleName db 20, 20 dup(?)
    familyName db 20, 20 dup(?)
 
.CODE
 
ProgramStart:
    mov ax, @data
    mov ds, ax
   
    lea dx, line1
    mov ah, 09h
    int 21h
 
    lea dx, line2
    mov ah, 09h
    int 21h
 
    lea dx, firstName
    mov ah, 0Ah
    int 21h
 
    lea dx, line3
    mov ah, 09h
    int 21h
 
    lea dx, middleName
    mov ah, 0Ah
    int 21h
 
    lea dx, line4
    mov ah, 09h
    int 21h
 
    lea dx, familyName
    mov ah, 0Ah
    int 21h
 
    lea dx, line5
    mov ah, 09h
    int 21h
 
    lea si, firstName + 2 
    mov cl, [firstName+1] 

DisplayFirstName:
    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayFirstName          
 
    mov dl, ' '
    mov ah, 02h
    int 21h
 
    lea si, middleName + 2 
    mov cl, [middleName+1] 

DisplayMiddleName:
    mov dl, [si]  
    mov ah, 02h  
    int 21h
    inc si 
    loop DisplayMiddleName          
 
    mov dl, ' '
    mov ah, 02h
    int 21h
 
    lea si, familyName + 2 
    mov cl, [familyName+1] 

DisplayFamilyName:
    mov dl, [si]
    mov ah, 02h
    int 21h
    inc si 
    loop DisplayFamilyName    

    mov dl, '!'
    mov ah, 02h
    int 21h      
 
    mov ax, 4Ch
    int 21h
 
END ProgramStart