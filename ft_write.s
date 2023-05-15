%include "prefix.asm"
global    PREFIX ft_write

section   .text

%ifidn __OUTPUT_FORMAT__, macho64
    ; /Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include/sys/syscall.h
    ; add 0x02000000 to the x86 syscall number, which was 4
    %define WRITE_SYSCALL 0x02000004
%else
    ; for 64 the write syscall is 1
    %define WRITE_SYSCALL 0x1
%endif

PREFIX ft_write:

; rdi is the first argument, rax should have the return value
; rsi is the second argument
; rdx, rcx, r8, r9
; https://soliduscode.com/nasm-x64-c-calling-convention/
; dl is the lowest byte of rdx

mov		rax, WRITE_SYSCALL 
syscall
ret

