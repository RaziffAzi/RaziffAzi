; FILENAME: EXER22.ASM
; Programmer Name: Raziff D. Gumapon
; Date: September 22, 2024
; Description: This program simulates a student enrollment form, 
; collects personal details, and displays a summary of the entered information.

.model small
.stack 200h
.data


    line1 db 'Cebu Institute of Technology - Univeristy$'
    line2 db 13,10, 'STUDENT ENROLLMENT FORM$'
    line3 db 13,10,10, 'Please enter the following information:$'
    line4 db 13,10, 'Student ID Number: $'
    line5 db 13,10,'First Name: $'
    line6 db 13,10,'Middle Name: $'
    line7 db 13,10,'Last Name: $'
    line8 db 13,10,'Address: $'
    line9 db 13,10,'Course: $'
    line10 db 13,10, 'Year: $'
    line11 db 13,10,'Birthday Month: $'
    line12 db 13,10, 'Birthday Day: $'
    line13 db 13,10,'Birthday Year: $'
    line14 db 13,10,'Email Address: $'
    line15 db 13,10,10,'SUMMARY$'
    line16 db 13,10,'Please check if all information are correct.$'
    line17 db 13,10,10,'ID Number: $'

    line18 db 13,10,'Full name: $'
    courseAndYear db 13,10, 'Course & Year: $'
    line19 db 13,10,'Birthday: $'

    line20 db 13,10,10,'Thank you for enrolling at CIT-U.$'
    line21 db 13,10,'Copyright 2024$'
    line22 db 13,10,'Programmer: RAZIFF D. GUMAPON$'

    input1 db 50, 50 dup(?)
    input2 db 50, 50 dup(?)
    input3 db 50, 50 dup(?)
    input4 db 50, 50 dup(?)
    input5 db 100, 100 dup(?)
    input6 db 50, 50 dup(?)
    input7 db 50, 50 dup(?)
    input8 db 50, 50 dup(?)
    input9 db 50, 50 dup(?)
    input10 db 50, 50 dup(?)
    input11 db 50, 50 dup(?)
.code
ProgramStart:
    mov ax, @data
    mov ds, ax

    mov ah,09h
    lea dx, line1
    int 21h

    mov ah,09h
    lea dx, line2
    int 21h

    mov ah,09h
    lea dx, line3
    int 21h

    mov ah,09h
    lea dx,line4
    int 21h

    lea dx, input1
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line5
    int 21h

    lea dx, input2
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line6
    int 21h

    lea dx, input3
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line7
    int 21h

    lea dx, input4
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line8
    int 21h

    lea dx, input5
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line9
    int 21h

    lea dx, input6
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line10
    int 21h

    lea dx, input7
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line11
    int 21h

    lea dx, input8
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line12
    int 21h

    lea dx, input9
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line13
    int 21h

    lea dx, input10
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line14
    int 21h

    lea dx, input11
    mov ah, 0Ah
    int 21h

    mov ah,09h
    lea dx,line15
    int 21h

    mov ah,09h
    lea dx,line16
    int 21h

    lea si, input1 + 2
    mov cl, [input1 + 1]

    lea dx, line17
    mov ah,09h
    int 21h

DisplayIDNumber:


    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayIDNumber          

    lea si, input4 + 2 
    mov cl, [input4+1] 

    lea dx, line18
    mov ah,09h
    int 21h

DisplayFamilyName:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayFamilyName          
 
    mov ah,02h
    mov dl,','
    int 21h

    mov ah,02h
    mov dl, ' '
    int 21h
 
    lea si, input2 + 2 
    mov cl, [input2+1] 

DisplayFirstName:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayFirstName          

    mov ah,02h
    mov dl, ' '
    int 21h
 
    lea si, input3 + 2 
    mov cl, [input3+1] 

DisplayMiddleName:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayMiddleName          
 
    mov ah,09h
    lea dx,line8
    int 21h
 
    lea si, input5 + 2 
    mov cl, [input5+1] 

DisplayAddress:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayAddress         
 
    mov ah,09h
    lea dx,courseAndYear
    int 21h

    lea si, input6 + 2 
    mov cl, [input6+1] 

DisplayCourse:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayCourse        
 
    mov ah,02h
    mov dl, ' '
    int 21h
 
    lea si, input7 + 2 
    mov cl, [input7+1] 

DisplayCourseYear:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayCourseYear        
 
    mov ah,09h
    lea dx, line19
    int 21h
 
    lea si, input8 + 2 
    mov cl, [input8+1] 

DisplayMonth:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayMonth     
 
    mov ah,02h
    mov dl, ' '
    int 21h
 
    lea si, input9 + 2 
    mov cl, [input9+1] 

DisplayDay:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayDay
 
    mov ah,02h
    mov dl, ','
    int 21h

    mov ah,02h
    mov dl, ' '
    int 21h
 
    lea si, input10 + 2 
    mov cl, [input10+1] 

DisplayYear:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayYear
 
    mov ah,09h
    lea dx,line14
    int 21h

    lea si, input11 + 2 
    mov cl, [input11+1] 

DisplayEmailAddress:

    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayEmailAddress

ThankYou:
    ; Thank you segment
    mov ah,09h
    lea dx, line20
    int 21h

    mov ah,09h
    lea dx, line21
    int 21h

    mov ah,09h
    lea dx, line22
    int 21h

Done:
    mov ah, 4ch
    int 21h
END ProgramStart