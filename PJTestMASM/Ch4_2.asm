COMMENT !
CS 130#16635
CH04 Lab 02
Student: Jacob Yeung #900494756

Assembly Language Programming Labs
Lab 4-2
!

INCLUDE Irvine32.inc

.data
    fibArray DWORD 15 DUP(0)
    message BYTE "Irvine32 Library is working!", 0dh, 0ah, 0

.code
main PROC
    ; 1. Print the string to the console
    mov edx, OFFSET message
    call WriteString

    ; 2. Display the current CPU registers
    call DumpRegs

    ; 3. Wait for a key press before closing
    call WaitMsg

main ENDP

END main
; https://www.asmirvine.com/s
