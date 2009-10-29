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



		bits 16
		
		
		xchg bx, bx
		call disable_A20
		call check_A20
		call enable_A20
		call check_A20
		cli			;deshabilito interrupciones
		lgdt[GDT_DESC]		;carga el registro lgdt con los datos de la gtr que armamos mas abajo
		mov eax, cr0
		or eax, 1
		mov cr0, eax		;habilito modo protegido
		jmp 0x08:modo_protegido
		bits 32
		modo_protegido:
			mov ax, 0x10
			mov ds, ax
			mov es, ax
			mov fs, ax
			mov gs, ax
			mov ss, ax
			
			;aca hacemos el mostrar en pantalla que hicimos la clase anterior
			mov edi, 0xb8000
			mov al, 'A'
			mov ah, 0x0a
			mov ecx, 80
		
			cicloFilaArriba:
				mov [edi], ax
				add edi, 2
				loop cicloFilaArriba
			mov ecx, 23
			cicloBordes:
				mov [edi], ax
				add edi, 158
				mov [edi], ax
				add edi, 2
				loop cicloBordes
			mov ecx, 80
			cicloFilaAbajo:
				mov [edi], ax
				add edi, 2
				loop cicloFilaAbajo
				
			jmp $

		

	; Ejercicio 2
		
		; TODO: Habilitar paginacion
	
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

%define TASK1INIT 0x8000
%define TASK2INIT 0x9000
%define KORG 0x1200

TIMES TASK1INIT - KORG - ($ - $$) db 0x00
incbin "pintor.tsk"
incbin "traductor.tsk"
