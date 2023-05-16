%include "prefix.asm"
global    PREFIX %+ ft_strlen

section   .text

PREFIX %+ ft_strlen:
; rdi is the first argument, rax should have the return value
; https://soliduscode.com/nasm-x64-c-calling-convention/

xor		rax, rax
loop:
cmp		BYTE [ rdi + rax ], 0
je		end
inc		rax
jmp		loop

end:
ret

