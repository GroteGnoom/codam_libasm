global    _ft_write

section   .text

_ft_write:
; rdi is the first argument, rax should have the return value
; rsi is the second argument
; rdx, rcx, r8, r9
; https://soliduscode.com/nasm-x64-c-calling-convention/
; dl is the lowest byte of rdx

mov		rax, 0x02000004 
syscall
ret

