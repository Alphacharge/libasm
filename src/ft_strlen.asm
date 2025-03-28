default rel
section .text
global ft_strlen
ft_strlen:
	; set return value to 0
	mov	rax, 0
.loop:
	;cpy value of rdi to cl register
	mov	cl, [rdi]
	; cmp to zero, value would be in ZF
	cmp	cl, 0
	je	.done
	; inc counter
	add	rax, 1
	; move rdi pointer
	add	rdi, 1
	jmp	.loop
.done:
	; return rax
	ret
