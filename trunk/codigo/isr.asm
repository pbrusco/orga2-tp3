BITS 32
%include "macrosmodoprotegido.mac"
extern pic1_intr_end


; ----------------------------------------------------------------
; Interrupt Service Routines
; TODO: Definir el resto de las ISR
; ----------------------------------------------------------------

global _isr0, _isr1, _isr2, _isr3, _isr4, _isr5, _isr6, _isr7, _isr8, _isr9, _isrA, _isrB, _isrC, _isrD, _isrE, _isrF, _isr10, _isr11, _isr12, _isr13, _isr20, _isr21


msgisr0: db '0'
msgisr0_len equ $-msgisr0

msgisr1: db '1'
msgisr1_len equ $-msgisr1

msgisr2: db '2'
msgisr2_len equ $-msgisr2

msgisr3: db '3'
msgisr3_len equ $-msgisr3

msgisr4: db '4'
msgisr4_len equ $-msgisr4

msgisr5: db '5'
msgisr5_len equ $-msgisr5

msgisr6: db '6'
msgisr6_len equ $-msgisr6

msgisr7: db '7'
msgisr7_len equ $-msgisr7

msgisr8: db '8'
msgisr8_len equ $-msgisr8


msgisr9: db '9'
msgisr9_len equ $-msgisr9

msgisrA: db 'A'
msgisrA_len equ $-msgisrA

msgisrB: db 'B'
msgisrB_len equ $-msgisrB

msgisrC: db 'C'
msgisrC_len equ $-msgisrC

msgisrD: db 'D'
msgisrD_len equ $-msgisrD

msgisrE: db 'E'
msgisrE_len equ $-msgisrE

msgisrF: db 'F'
msgisrF_len equ $-msgisrF

msgisr10: db '10'
msgisr10_len equ $-msgisr10

msgisr11: db '11'
msgisr11_len equ $-msgisr11

msgisr12: db '12'
msgisr12_len equ $-msgisr12

msgisr13: db '13'
msgisr13_len equ $-msgisr13



msgisr20: db 'Interrupcion : Timer tick'
msgisr20_len equ $-msgisr20

msgisr21: db 'Interrupcion : Tecleaste Algo'
msgisr21_len equ $-msgisr21



_isr0:
	cli
	mov edx, msgisr0
	IMPRIMIR_TEXTO edx, msgisr0_len, 0xEC, 10, 0, 0x13000
	jmp $
	
_isr1:
	cli
	mov edx, msgisr1
	IMPRIMIR_TEXTO edx, msgisr1_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr2:
	cli
	mov edx, msgisr2
	IMPRIMIR_TEXTO edx, msgisr2_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr3:
	cli
	mov edx, msgisr3
	IMPRIMIR_TEXTO edx, msgisr3_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr4:
	cli
	mov edx, msgisr4
	IMPRIMIR_TEXTO edx, msgisr4_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr5:
	cli
	mov edx, msgisr5
	IMPRIMIR_TEXTO edx, msgisr5_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr6:
	cli
	mov edx, msgisr6
	IMPRIMIR_TEXTO edx, msgisr6_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr7:
	cli
	mov edx, msgisr7
	IMPRIMIR_TEXTO edx, msgisr7_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr8:
	cli
	mov edx, msgisr8
	IMPRIMIR_TEXTO edx, msgisr8_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr9:
	cli
	mov edx, msgisr9
	IMPRIMIR_TEXTO edx, msgisr9_len, 0x0C, 0, 0, 0x13000
	jmp $

_isrA:
	cli
	mov edx, msgisrA
	IMPRIMIR_TEXTO edx, msgisrA_len, 0x0C, 0, 0, 0x13000
	jmp $

_isrB:
	cli
	mov edx, msgisrB
	IMPRIMIR_TEXTO edx, msgisrB_len, 0x0C, 0, 0, 0x13000
	jmp $

_isrC:
	cli
	mov edx, msgisrC
	IMPRIMIR_TEXTO edx, msgisrC_len, 0x0C, 0, 0, 0x13000
	jmp $

_isrD:
	cli
	mov edx, msgisrD
	IMPRIMIR_TEXTO edx, msgisrD_len, 0x0C, 0, 0, 0x13000
	jmp $


_isrE:
	cli
	mov edx, msgisrE
	IMPRIMIR_TEXTO edx, msgisrE_len, 0x0C, 0, 0, 0x13000
	jmp $

_isrF:
	cli
	mov edx, msgisrF
	IMPRIMIR_TEXTO edx, msgisrF_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr10:
	cli
	mov edx, msgisr10
	IMPRIMIR_TEXTO edx, msgisr10_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr11:
	cli
	mov edx, msgisr11
	IMPRIMIR_TEXTO edx, msgisr11_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr12:
	cli
	mov edx, msgisr12
	IMPRIMIR_TEXTO edx, msgisr12_len, 0x0C, 0, 0, 0x13000
	jmp $

_isr13:
	cli
	mov edx, msgisr13
	IMPRIMIR_TEXTO edx, msgisr13_len, 0x0C, 0, 0, 0x13000
	jmp $


_isr20: 
	cli
	call next_clock
	mov al, 0x20
	out 0x20, al

	
	cmp dword [isrnumero], 1
	je tarea2
	cmp dword [isrnumero], 3
	je tarea2
tarea1:
	sti
	jmp 0x28:0
	iret

tarea2:
	sti	
	jmp 0x30:0
	iret
	

_isr21: 
	cli
	pushad
	in al,0x60
	
	
	mov edx, pantallazo
	IMPRIMIR_TEXTO edx, 1, 0x3C, 1 , 1, 0x13000
	inc byte [pantallazo]

	mov al, 0x20
	out 0x20, al
	popad
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
		
pantallazo: db '0'
isrmessage: db 'Relos:'
isrnumero: dd 0x00000000
isrmessage1: db '|'
isrmessage2: db '/'
isrmessage3: db '-'
isrmessage4: db '\'


