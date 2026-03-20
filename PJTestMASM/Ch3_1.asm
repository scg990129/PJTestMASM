.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
myList DWORD 2, 3, 5, 8
my QWORD ?
myy SQWORD ?

.code
main PROC
  mov eax, 9
  add eax, 8
  INVOKE ExitProcess, eax
main ENDP

END main        ;specify the program's entry point
# https://programminghaven.home.blog/2020/02/16/setup-an-assembly-project-on-visual-studio-2019/