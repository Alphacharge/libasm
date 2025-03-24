section .text
global ft_strcpy
ft_strcpy:
	; save the original dest pointer to stack
	push	rdi

.loop:
	; cmp to zero, value would be in ZF
	cmp	byte [rsi], 0
	je	.done

	; cpy byte
	mov	al, [rsi]
	mov	[rdi], al

	; move pointers
	add	rsi, 1
	add	rdi, 1
	jmp	.loop

.done:
	; cpy 0 byte
	mov	al, [rsi]
	mov	[rdi], al

	; restore original dest to rax
	pop	rax
	ret
