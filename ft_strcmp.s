%include "prefix.asm"
global    PREFIX %+ ft_strcmp

section   .text

PREFIX %+ ft_strcmp:
; rdi is the first argument, rax should have the return value
; rsi is the second argument
; https://soliduscode.com/nasm-x64-c-calling-convention/
; dl is the lowest byte of rdx

loop:
mov		dl, BYTE [rsi]
cmp		BYTE [ rdi ], dl
jne		end
cmp		BYTE [ rdi ], 0
je		end
inc		rdi
inc		rsi
jmp		loop

end:
movzx	rax, BYTE [ rdi ]
movzx	rdx, dl
sub		rax, rdx
ret

