global    _ft_strdup
extern	  _malloc
extern	  _ft_strcpy

section   .text

_ft_strdup:
; rdi is the first argument, rax should have the return value
; rsi is the second argument
; rdx, rcx, r8, r9
; https://soliduscode.com/nasm-x64-c-calling-convention/
; dl is the lowest byte of rdx


xor		rax, rax
loop:
cmp		BYTE [ rdi + rax ], 0
je		allocate
inc		rax
jmp		loop

; now strlen is in rax, we want to call malloc with it
; rdi needs to be pushed, because we need it later

allocate:
push	rdi
mov		rdi, rax
inc		rdi ; make room for the 0 at the end
call	_malloc
cmp		rax, 0 ; malloc returned NULL, we're also gong to return NULL
je		end

pop		rsi ; rdi was on the stack, we use it as the second argument to strcpy
mov		rdi, rax
call	_ft_strcpy

end:
ret

