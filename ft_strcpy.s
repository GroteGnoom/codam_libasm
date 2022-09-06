global    _ft_strcpy

section   .text

_ft_strcpy:
; rdi is the first argument, rax should have the return value
; rsi is the second argument
; https://soliduscode.com/nasm-x64-c-calling-convention/

mov		rax, rdi
loop:
mov		dl, BYTE [rsi]
mov		BYTE [rdi], dl
cmp		BYTE [ rsi ], 0
je		end
inc		rdi
inc		rsi
jmp		loop

end:
ret

