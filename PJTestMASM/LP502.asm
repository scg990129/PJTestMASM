COMMENT !
CS 130#16635
CH05 Lab Assignment
Student: Jacob Yeung #900494756

Assembly Language Programming Labs
Lab 5-2: Assignment 2 - Ascending Number Pattern
Create a Microsoft Macro Assembly (MASM) program,
LP502 to prompt the user to enter a number between 1 and 9. 
Write a nested loop to print the numbers in an ascending pattern.
!

INCLUDE Irvine32.inc

.data
    prompt BYTE "Enter a value for length: ", 0
    errorMsg BYTE "Invalid input (Not 1-9). Please try again!", 0dh, 0ah, 0

.code
main PROC
    call GetInput
    movzx ecx, al
    mov bl, al
    call PrintPattern
    ; call WaitMsg
    invoke ExitProcess, bl
main ENDP

; Document how arguments are passed to the procedures
;---------------------------------------------------------
; GetInput
;
; Prompts user for a digit between 1 and 9. [Create a procedure that prompts the user for input]
; Receives: None
; Returns:  AL = input [the numeric value entered (1-9)]
;---------------------------------------------------------

GetInput PROC
L1:
    mov  edx, OFFSET prompt
    call WriteString
    call ReadInt

    cmp  al, 1
    jb Invalid
    cmp  al, 9
    ja Invalid
    ret

Invalid:
    mov  edx, OFFSET errorMsg
    call WriteString
    jmp  L1
GetInput ENDP

; Document how arguments are passed to the procedures
;---------------------------------------------------------
; PrintPattern
;
; Print out a ascending numeric pattern. [Create a procedure to output the numbers as required]
; Write a nested loop to print the numbers in an ascending pattern.
; Receives: ECX = the targeted length to control the print pattern 
; Returns:  None
;---------------------------------------------------------
PrintPattern PROC
    mov ecx, eax         ; ECX = (total number of rows)
    mov ebx, 1           ; EBX = first number

L_Outer:
    push ecx             ; total rows counter
    
    ; Inner Loop Setup
    mov ecx, ebx         ; for each row: loop runs 'EBX' times
    mov eax, 1           ; print from 1

L_Inner:
    call WriteDec        ; print number (cell)
    inc  eax             ; eax++
    loop L_Inner         ; loop until ECX = 0
    
    call Crlf            ; \n
    inc  ebx             ; row++
    pop  ecx             ; ecx = total row count
    loop L_Outer         ; loop until n = counter
    
    ret
PrintPattern ENDP
END main
; https://www.asmirvine.com/
    ; 2. Display the current CPU registers
    ! call DumpRegs
    ; 3. Wait for a key press before closing
    ! call WaitMsg
