
.model flat, c
.code

; Computes:	a / b
;			a * b
;			a & b


MulDiv proc

	push ebp
	mov ebp, esp
	push ebx

; Declare variables

	mov ecx, [ebp+8]			; sets a to ecx
	mov edx, [ebp+12]			; sets b to edx

; Check divisor is not zero

	xor eax, eax				; set error return code
	or edx, edx					
	jz InvalidDivisor

; Multiply and save result

	imul edx, ecx
	mov ebx, [ebp+16]
	mov [ebx], edx

; Calculate Quotient

	mov eax, ecx
	cdq
	idiv dword ptr [ebp+12]

; Save results

	mov ebx, [ebp+20]
	mov [ebx], eax			; Save quotient
	mov ebx, [ebp+24]
	mov [ebx], edx			; Save remainder
	mov eax, 1

InvalidDivisor:

	pop ebx
	pop ebp
	ret

MulDiv endp
	end