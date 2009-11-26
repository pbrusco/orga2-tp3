BITS 16		; le indico al compilador que el codigo que prosigue es de 16 bits

global start
extern GDT_DESC
extern gdt
extern IDT_DESC
extern idtFill
extern tsss

%define ComienzoDirectorioPaginaPintor 0xA000
%define KORG 0x1200					; posicion de inicio de kernel
%define TASK1INIT 0x8000			; posicion de inicio de la tarea pintor
%define TASK2INIT 0x9000			; posicion de inicio de la tarea traductor


; incluimos al principio del kernel el codigo de las macros para imprimir en pantalla en modo real
	%include "macrosmodoreal.mac"
	%include "macrosmodoprotegido.mac"

start:

; deshabilito interrupciones
	cli					
	jmp 	bienvenida

;  mensajes por pantalla del sistema
	iniciando: db 'Iniciando el kernel'
	iniciando_len equ $ - iniciando

	modreal: db 'Cpu en Modo Real'
	modreal_len equ $ - modreal

	cambiando: db 'Cambiando a Modo Protegido'	
	cambiando_len equ $ - cambiando

	pulse: db 'Escriba el nombre del grupo para continuar'
	pulse_len equ $ - pulse

	elNombre: db 'Ahhh.. el nombre es PUNPCKHQDQ'
	elNombre_len equ $ - elNombre

	pista: db 'o un "-"'
	pista_len equ $ - pista


	modprot: db 'Cpu en Modo Protegido'
	modprot_len equ $ - modprot

	mensaje db 'Grupo PUNPCKHQDQ',0
	mensaje_len equ $-mensaje


bienvenida:
	; ejercicio 1
		%include "ejercicio1.asm"
	
	; ejercicio 2
		%include "ejercicio2.asm"

	; ejercicio 3
		%include "ejercicio3.asm"
	
	; ejercicio 4
		%include "ejercicio4.asm"
	
	; detenemos la ejecucion en este punto
	jmp $
		
		
; incluimos en el kernel el codigo de los siguientes archivos
	%include "a20.asm"

;  rellenamos con 0's hasta la posicion donde inicia la tarea pintor (0x8000)
	TIMES TASK1INIT - KORG - ($ - $$) db 0x00

; incluimos el codigo de la tarea pintor , y como este ocupa justamente una pagina, seguidamente incluimos el codigo de la tarea traductor sin necesidad de tener que rellenar con 0's nuevamente
	incbin "pintor.tsk"
	incbin "traductor.tsk"

;  rellenamos con 0's hasta la posicion donde inicia el Directorio de Paginas de la tarea pintor (0xA000)
	TIMES ComienzoDirectorioPaginaPintor - KORG - ($ - $$) db 0x00

; incluimos los Directorios de Tablas de Paginas y las Tablas de Paginas del kernel y de las tareas pintor y traductor
	%include "paging.asm"
