BITS 16

%include "macrosmodoreal.mac"

global start
extern GDT_DESC
extern gdt;
extern IDT_DESC
extern idtFill
extern tsss;


;Aca arranca todo, en el primer byte.
start:
		cli					;no me interrumpan por ahora, estoy ocupado
		jmp 	bienvenida

;aca ponemos todos los mensajes		
iniciando: db 'Iniciando el kernel mas inutil del mundo'
iniciando_len equ $ - iniciando		


bienvenida:
	IMPRIMIR_MODO_REAL iniciando, iniciando_len, 0x07, 0, 0
	; Ejercicios AQUI

	;ejercicio1

		%include "ejercicio1.asm"
		
				
	

		

	; Ejercicio 2
		
		%include "ejercicio2.asm"


	jmp $
	
	; Ejercicio 3
	
		; TODO: Inicializar la IDT
		
		; TODO: Resetear la pic
		
		; TODO: Cargar el registro IDTR
				
	; Ejercicio 4
	
		; TODO: Inicializar las TSS
		
		; TODO: Inicializar correctamente los descriptores de TSS en la GDT
		
		; TODO: Cargar el registro TR con el descriptor de la GDT de la TSS actual
		
		; TODO: Habilitar la PIC
		
		; TODO: Habilitar Interrupciones
		
		; TODO: Saltar a la primer tarea
		
		


%include "a20.asm"
%include "paging.asm"

%define TASK1INIT 0x8000
%define TASK2INIT 0x9000
%define KORG 0x1200

mensaje db "Hola Mundo, con segmentacion flat e identity mapping!",0
mensaje_len equ $-mensaje 

TIMES TASK1INIT - KORG - ($ - $$) db 0x00
incbin "pintor.tsk"
incbin "traductor.tsk"


