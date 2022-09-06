global    _ft_read

section   .text

_ft_read:
; rdi is the first argument, rax should have the return value
; rsi is the second argument
; rdx, rcx, r8, r9
; https://soliduscode.com/nasm-x64-c-calling-convention/
; dl is the lowest byte of rdx
; /Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include/sys/syscall.h
; add 0x02000000 to it

mov		rax, 0x02000003 
syscall
ret

