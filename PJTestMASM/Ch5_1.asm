COMMENT !
CS 130#16635
CH05 Lab Assig
Student: Jacob Yeung #900494756

Assembly Language Programming Labs
Lab 5-1: Assignment 1 - Descending Number Pattern
Create a Microsoft Macro Assembly (MASM) program,
LP501 to prompt the user to enter a number between 1 and 9. 
Write a nested loop to print the numbers in a descending pattern.
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
; Print out a descending numeric pattern. [Create a procedure to output the numbers as required]
; Receives: ECX = the starting length to control the print pattern
; Returns:  None
;---------------------------------------------------------
PrintPattern PROC
L_Outer:
    push ecx
    mov  eax, 1
    
L_Inner:
    call WriteDec
    inc  eax
    loop L_Inner
    
    call Crlf
    pop  ecx
    loop L_Outer
    
    ret
PrintPattern ENDP
END main
; https://www.asmirvine.com/
    ; 2. Display the current CPU registers
    ! call DumpRegs
    ; 3. Wait for a key press before closing
    ! call WaitMsg
