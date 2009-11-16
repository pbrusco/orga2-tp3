BITS 32
%include "macrosmodoprotegido.mac"
extern pic1_intr_end


; ----------------------------------------------------------------
; Interrupt Service Routines
; TODO: Definir el resto de las ISR
; ----------------------------------------------------------------

global _isr0, _isr20, _isr21

msgisr0: db 'EXCEPCION #DE: Error de division'
msgisr0_len equ $-msgisr0



msgisr20: db 'Interrupcion : Timer tick'
msgisr20_len equ $-msgisr20

msgisr21: db 'Interrupcion : Tecleastesssssss'
msgisr21_len equ $-msgisr21

_isr0:
	cli
	mov edx, msgisr0
	IMPRIMIR_TEXTO edx, msgisr0_len, 0x0C, 0, 0, 0x13000
	jmp $
	



_isr20: 
	cli
	call next_clock

	;vamos a avisar que se atendio vio..
	mov al, 0x20
	out 0x20, al

	sti
	iret



_isr21: 
	cli
	mov edx, msgisr21
	IMPRIMIR_TEXTO edx, msgisr21_len, 0x0C, 0xA, 1, 0x13000

	xor eax, eax
	in al, 0x60

	IMPRIMIR_TEXTO eax, 1, 0x0C, 0xA, (msgisr21_len+4), 0x13000

	mov al, 0x20
	out 0x20, al

	sti
	iret


; Funcion para dibujar el reloj.
; void next_clock(void)
next_clock:
	pushad
	inc DWORD [isrnumero]
	mov ebx, [isrnumero]
	cmp ebx, 0x4
	jl .ok
		mov DWORD [isrnumero], 0x0
		mov ebx, 0
	.ok:
		add ebx, isrmessage1
		mov edx, isrmessage
		IMPRIMIR_TEXTO edx, 6, 0x0A, 23, 1, 0x13000
		IMPRIMIR_TEXTO ebx, 1, 0x0A, 23, 8, 0x13000
	popad
	ret

isrmessage: db 'Clock:'
isrnumero: dd 0x00000000
isrmessage1: db '|'
isrmessage2: db '/'
isrmessage3: db '-'
isrmessage4: db '\'
