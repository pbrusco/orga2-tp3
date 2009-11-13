BITS 32
%include "macrosmodoprotegido.mac"
extern pic1_intr_end


; ----------------------------------------------------------------
; Interrupt Service Routines
; TODO: Definir el resto de las ISR
; ----------------------------------------------------------------

global _isr0,_isr21h

msgisr0: db 'EXCEPCION: Division por cero'
msgisr0_len equ $-msgisr0

msgisr21h: db 'Interrupcion:BONYOURRRR PEDAZO DE ZOQUETE.. Tecleaste Algo'
msgisr21h_len equ $-msgisr21h

_isr0:
	mov edx, msgisr0
	IMPRIMIR_TEXTO edx, msgisr0_len, 0x0C, 0, 0, 0x13000
	jmp $
	



_isr21h: 
	cli	
	xchg bx,bx
	mov edx, msgisr21h
	IMPRIMIR_TEXTO edx, msgisr21h_len, 0x0C, 0, 0, 0x13000

	;vamos a avisar que se atendio vio..
	

	mov al, 0xFF 			;OCW1: Set o Clearel IMR
	out 0x21, al
	
	;HABILITO LA PARTE DEL TECLADO DEL PIC1:
	mov al,0x61
	out 0x21, al
	
	
		

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
