; FILENAME: EXER24.ASM
; Programmer Name: Raziff D. Gumapon
; Date: September 24, 2024
;Description: Vehicle Sticker
.model small
.stack 100
.data
menu    db 13,10, '                                                                         ', 13, 10
        db '                   Cebu Institute of Technology - University               ', 13, 10
        db '                       VEHICLE STICKER APPLICATION FORM                   ', 13, 10
        db '                        Please fill out the form below.                    ', 13, 10, 10
        db '   Personnel Type:                      V   Vehicle Sticker Type:           V ', 13, 10, 10
        db '   Name of Applicant/Driver:                ID Number:                      ', 13, 10, 10
        db '   Mobile Number:                           Address:                        ', 13, 10, 10
        db '   Vehicle Make(s)/Brand:                   Plate Number:                   ', 13, 10, 10
        db '   Vehicle Color:                       V   Vehicle Type:                   V ', 13, 10, 10, 10
        db '                                    SUBMIT                      ', 13, 10, 10,10
        db '                       Copyright 2024 RAZIFF D. GUMAPON     ', 13, 10, 10, 10
        db '                                  Thank You!            ', 13, 10, '$'

    line1 db 'Cebu Institute of Technology - Universiy$'
    line2 db 13,10,'VEHICLE STICKER APPLICATION FORM$'
    line3 db 13,10,'Please enter the needed information:$'
    line4 db 13,10,10, 'Personnel Type: $'
    line5 db 13,10, 'Name of Applicant/Driver: $'
    line6 db 13,10, 'Mobile Number: $'
    line7 db 13,10, 'Vehicle Make(s)/Brand: $'
    line8 db 13,10, 'Vehicle Color: $'
    line9 db 13,10, 'Vehicle Sticker Type: $'
    line10 db 13,10, 'ID Number: $'
    line11 db 13,10, 'Addres: $'
    line12 db 13,10, 'Plate Number: $'
    line13 db 13,10, 'Vehicle Type: $'

    input1 db 9,0,9 dup(?)
    input2 db 14,0,14 dup(?)
    input3 db 12,0,12 dup(?)
    input4 db 12,0,12 dup(?)
    input5 db 9,0,9 dup(?)
    input6 db 9,0,9 dup(?)
    input7 db 12,0,12 dup(?)
    input8 db 12,0,12 dup(?)
    input9 db 12,0,12 dup(?)
    input10 db 9,0,9 dup(?)
    nxt db 13,10,'$'
.code
NextLine:
    lea dx, nxt
    MOV ah, 09h
    INT 21h
    RET

main proc
    mov ax,@data
    mov ds,ax

    call InputForm

    mov ah,00h
    mov ax, 3
    int 10h

    call Sticker

    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 22            ; Row (0-based)
    mov dl, 029          ; Column (0-based)
    int 10h              ; Call BIOS interrupt

; Print Personnel
    lea si, input1 + 2  
    mov cl, [input1 + 1]  
PrintPersonnel:
    mov dl, [si]
    cmp dl, 0dh          
    je DonePersonnel
    mov ah, 02h          
    int 21h
    inc si
    loop PrintPersonnel
DonePersonnel:
    CALL NextLine

main endp

InputForm proc
mov ah,09h
    lea dx,line1
    int 21h

    mov ah,09h
    lea dx,line2
    int 21h

    mov ah,09h
    lea dx,line3
    int 21h

    mov ah,09h
    lea dx,line4
    int 21h

    lea dx, input1
    mov ah,0Ah
    int 21h 

    mov ah,09h
    lea dx,line5
    int 21h

    lea dx, input2
    mov ah,0Ah
    int 21h 

    mov ah,09h
    lea dx,line6
    int 21h

    lea dx, input3
    mov ah,0Ah
    int 21h 

    mov ah,09h
    lea dx,line7
    int 21h

    lea dx, input4
    mov ah,0Ah
    int 21h 

    mov ah,09h
    lea dx,line8
    int 21h

    lea dx, input5
    mov ah,0Ah
    int 21h 

    mov ah,09h
    lea dx,line9
    int 21h

    lea dx, input6
    mov ah,0Ah
    int 21h 

    mov ah,09h
    lea dx,line10
    int 21h

    lea dx, input7
    mov ah,0Ah
    int 21h 

    mov ah,09h
    lea dx,line11
    int 21h

    lea dx, input8
    mov ah,0Ah
    int 21h 

    mov ah,09h
    lea dx,line12
    int 21h

    lea dx, input9
    mov ah,0Ah
    int 21h 

    mov ah,09h
    lea dx,line13
    int 21h

    lea dx, input10
    mov ah,0Ah
    int 21h 

    mov ax, 3
    int 10h
InputForm endp
Sticker proc
    xor al, al

    mov ah, 06h
    mov ch, 2 ; r s
    mov cl, 2 ; c s
    mov dh, 21 ; r e
    mov dl, 77 ; c e
    mov bh, 070H;
    int 10h

    mov ah, 06h
    mov ch, 2 ; r s
    mov cl, 3 ; c s
    mov dh, 3 ; r e
    mov dl, 76 ; c e
    mov bh, 04fH;
    int 10h

    mov ah, 06h
    mov ch, 4 ; r s
    mov cl, 3 ; c s
    mov dh, 4 ; r e
    mov dl, 76 ; c e
    mov bh, 0CEH;
    int 10h

    mov ah, 06h
    mov ch, 6 ; r s
    mov cl, 29 ; c s
    mov dh, 6 ; r e
    mov dl, 40 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 8 ; r s
    mov cl, 29 ; c s
    mov dh, 8 ; r e
    mov dl, 40 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 10 ; r s
    mov cl, 29 ; c s
    mov dh, 10 ; r e
    mov dl, 40 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 12 ; r s
    mov cl, 29 ; c s
    mov dh, 12 ; r e
    mov dl, 40 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 14 ; r s
    mov cl, 29 ; c s
    mov dh, 14 ; r e
    mov dl, 40 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 14 ; r s
    mov cl, 66 ; c s
    mov dh, 14 ; r e
    mov dl, 76 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 6 ; r s
    mov cl, 66 ; c s
    mov dh, 6 ; r e
    mov dl, 76 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 8 ; r s
    mov cl, 66 ; c s
    mov dh, 8 ; r e
    mov dl, 76 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 10 ; r s
    mov cl, 66 ; c s
    mov dh, 10 ; r e
    mov dl, 76 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 12 ; r s
    mov cl, 66 ; c s
    mov dh, 12 ; r e
    mov dl, 76 ; c e
    mov bh, 07H;
    int 10h

    mov ah, 06h
    mov ch, 6 ; r s
    mov cl, 40 ; c s
    mov dh, 6 ; r e
    mov dl, 40 ; c e
    mov bh, 4fH;
    int 10h

    mov ah, 06h
    mov ch, 6 ; r s
    mov cl, 76 ; c s
    mov dh, 6 ; r e
    mov dl, 76 ; c e
    mov bh, 4fH;
    int 10h

    mov ah, 06h
    mov ch, 14 ; r s
    mov cl, 40 ; c s
    mov dh, 14 ; r e
    mov dl, 40 ; c e
    mov bh, 4fH;
    int 10h

    mov ah, 06h
    mov ch, 14 ; r s
    mov cl, 76 ; c s
    mov dh, 14 ; r e
    mov dl, 76 ; c e
    mov bh, 4fH;
    int 10h

    mov ah, 06h
    mov ch, 16 ; r s
    mov cl, 35; c s
    mov dh, 18 ; r e
    mov dl, 42 ; c e
    mov bh, 4fH;
    int 10h

    mov ah, 06h
    mov ch, 23  ; r s
    mov cl, 1 ; c s
    mov dh, 23  ; r e
    mov dl, 77 ; c e
    mov bh, 08EH;
    int 10h

    mov ah, 02h          ; Function to set cursor position
    mov bh, 01h          ; Page number (0 for standard screen)
    mov dh, 0            ; Row (0-based)
    mov dl, 0          ; Column (0-based)
    int 10h              ; Call BIOS interrupt

    mov ah,09h
    lea dx,menu
    int 21h
Sticker endp

end main
