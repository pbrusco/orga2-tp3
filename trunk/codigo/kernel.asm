BITS 16
%include "macrosmodoreal.mac"

BITS 16		; le indico al compilador que el codigo que prosigue es de 16 bits

global start
;extern GDT_DESC
;extern gdt;
extern IDT_DESC
extern idtFill
extern tsss;



%define ComienzoDirectorioPaginaPintor 0xA000
%define KORG 0x1200
%define TASK1INIT 0x8000
%define TASK2INIT 0x9000
%define PILATASK1 0x15400
%define PILATASK2 0x16400 

;Aca arranca todo, en el primer byte.
; incluimos al principio del kernel el codigo de las macros para imprimir en pantalla en modo real
	%include "macrosmodoreal.mac"

start:
		cli					;no me interrumpan por ahora, estoy ocupado
		jmp 	bienvenida

;aca ponemos todos los mensajes		
iniciando: db 'Iniciando el kernel mas divertido del mundo'
iniciando_len equ $ - iniciando
mensaje db 'Grupo PUNPCKHQDQ',0
mensaje_len equ $-mensaje 	
; deshabilito interrupciones
	cli					
	jmp 	bienvenida

;  mensajes por pantalla del sistema
	iniciando: db 'Iniciando el kernel mas divertido del mundo'
	iniciando_len equ $ - iniciando
	mensaje db 'Grupo PUNPCKHQDQ',0
	mensaje_len equ $-mensaje 	


bienvenida:
	
	; mensaje de bienvenida
	IMPRIMIR_MODO_REAL iniciando, iniciando_len, 0x07, 0, 0
	; Ejercicios AQUI

	;Ejercicio 1

	
	; ejercicio 1
		%include "ejercicio1.asm"
		
		

	; Ejercicio 2
		
	
	; ejercicio 2
		%include "ejercicio2.asm"

	
	; Ejercicio 3

		call idtFill
		%include "rutina_de_remapeo_pic.asm"
		lidt[IDT_DESC]


	; Ejercicio 4
	; ejercicio 3
		%include "ejercicio3.asm"
	
	; ejercicio 4
		%include "ejercicio4.asm"
		jmp $
	
	; detenemos la ejecucion en este punto
	jmp $
		
		

%include "a20.asm"
; incluimos en el kernel el codigo de los siguientes archivos
	%include "a20.asm"

%define ComienzoDirectorioPaginaPintor 0xA000
%define KORG 0x1200
%define TASK1INIT 0x8000
%define TASK2INIT 0x9000
%define PILATASK1 0x15400
%define PILATASK2 0x16400 
;  rellenamos con 0's hasta la posicion donde inicia la tarea pintor (0x8000)
	TIMES TASK1INIT - KORG - ($ - $$) db 0x00

TIMES TASK1INIT - KORG - ($ - $$) db 0x00
; incluimos el codigo de la tarea pintor , y como este ocupa justamente una pagina, seguidamente incluimos el codigo de la tarea 
;traductor sin necesidad de tener que rellenar con 0's nuevamente
	incbin "pintor.tsk"
	incbin "traductor.tsk"

incbin "pintor.tsk"
incbin "traductor.tsk"

;  rellenamos con 0's hasta la posicion donde inicia el Directorio de Paginas de la tarea pintor (0xA000)
TIMES ComienzoDirectorioPaginaPintor - KORG - ($ - $$) db 0x00

%include "paging.asm"
%include "gdt.asm"
; bla
	%include "paging.asm"
