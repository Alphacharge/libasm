default rel
extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location 

section .text
global ft_strdup
ft_strdup:
	; init pointer with 0
	mov	rax, 0
	push rdi

.func:
	; rdi null check
	cmp	byte [rdi], 0
	je	.done

	; get len of str
	call ft_strlen
	add	rax, 1

	; allocate memory
	mov	rdi, rax
	mov rsi, 1
	call malloc

	; check for error
	cmp	rax, 0
	je	.errno

	; cpy content
	mov rdi, rax
	pop rsi
	call ft_strcpy

	jmp	.done

.errno:
	; set errno and exit
	call __errno_location
	mov al, 12
	movsx rax, al
	jmp	.done

.done:
	; return rax
	ret
