BITS 16
%include "macrosmodoreal.mac"

global start
;extern GDT_DESC
;extern gdt;
extern IDT_DESC
extern idtFill
extern tsss;


;Aca arranca todo, en el primer byte.
start:
		cli					;no me interrumpan por ahora, estoy ocupado
		jmp 	bienvenida

;aca ponemos todos los mensajes		
iniciando: db 'Iniciando el kernel mas divertido del mundo'
iniciando_len equ $ - iniciando
mensaje db 'Grupo PUNPCKHQDQ',0
mensaje_len equ $-mensaje 	


bienvenida:
	IMPRIMIR_MODO_REAL iniciando, iniciando_len, 0x07, 0, 0
	; Ejercicios AQUI

	;Ejercicio 1

		%include "ejercicio1.asm"
		
		

	; Ejercicio 2
		
		%include "ejercicio2.asm"

	
	; Ejercicio 3

		call idtFill
		%include "rutina_de_remapeo_pic.asm"
		lidt[IDT_DESC]


	; Ejercicio 4
	
		%include "ejercicio4.asm"
		jmp $
		
		

%include "a20.asm"

%define ComienzoDirectorioPaginaPintor 0xA000
%define KORG 0x1200
%define TASK1INIT 0x8000
%define TASK2INIT 0x9000
%define PILATASK1 0x15400
%define PILATASK2 0x16400 

TIMES TASK1INIT - KORG - ($ - $$) db 0x00

incbin "pintor.tsk"
incbin "traductor.tsk"

TIMES ComienzoDirectorioPaginaPintor - KORG - ($ - $$) db 0x00

%include "paging.asm"
%include "gdt.asm"