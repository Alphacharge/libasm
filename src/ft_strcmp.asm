section .text
global ft_strcmp
ft_strcmp:
.loop:
	; rdi null check
	cmp	byte [rdi], 0
	je	.done

	; rsi null check
	cmp	byte [rsi], 0
	je	.done

	; equality check
	mov	bl, [rdi]
	mov	cl, [rsi]
	cmp	bl, cl
	jne	.done

	; move pointers
	add	rsi, 1
	add	rdi, 1
	jmp	.loop

.done:
	; safe rsi from overwriting
	mov	al, [rsi]
	sub	al, [rdi]

	; move sign extended value from al back in rax
	movsx rax, al

	; return rax
	ret
