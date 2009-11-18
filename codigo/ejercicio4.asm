; Inicializo la TSS de la tarea pintor
	
	mov edi, tsss			;me salteo la primera tss (104 bytes)
	add edi, 104			
	add edi, 4
	mov [edi], esp			;guardo la base de la pila del nivel 0
	add edi, 4
	mov word [edi], 0x10		;guarda el selector de segmento de datos
	add edi, 20
	mov eax, page_dir_pintor	;guardamos el CR3 de la tarea pintor
	mov [edi], eax
	add edi, 4
	mov dword [edi], 0x8000		;guarda el eip de la tarea pintor
	add edi, 4
	mov dword [edi], 0x202		;habilita interrupciones
	add edi, 20
	mov dword [edi], 0x15000	;guarda el esp de la tarea pintor
	add edi, 4	
	mov dword [edi], 0x15000	;guarda el ebp de la tarea pintor
	add edi, 12
	mov word [edi], 0x10
	add edi, 4
	mov word [edi], 0x8
	add edi, 4
	mov word [edi], 0x10
	add edi, 4
	mov word [edi], 0x10
	add edi, 4
	mov word [edi], 0x10
	add edi, 4
	mov word [edi], 0x10


; Inicializo la TSS de la tarea traductor
	
	mov edi, tsss				;me salteo las dos primeras tss (208 bytes)
	add edi, 208				
	add edi, 4
	mov [edi], esp				;guardo la base de la pila del nivel 0
	add edi, 4
	mov word [edi], 0x10			;guarda el selector de segmento de datos
	add edi, 20
	mov eax, page_dir_traductorykernel	;guardamos el CR3 de la tarea traductor y kernel
	mov [edi], eax
	add edi, 4
	mov dword [edi], 0x9000			;guarda el eip de la tarea pintor
	add edi, 4
	mov dword [edi], 0x202			;habilita interrupciones
	add edi, 20
	mov dword [edi], 0x16000		;guarda el esp de la tarea traductor
	add edi, 4		
	mov dword [edi], 0x16000		;guarda el ebp de la tarea traductor
	add edi, 12
	mov word [edi], 0x10
	add edi, 4
	mov word [edi], 0x8
	add edi, 4
	mov word [edi], 0x10
	add edi, 4
	mov word [edi], 0x10
	add edi, 4
	mov word [edi], 0x10
	add edi, 4
	mov word [edi], 0x10


; Actualizo los descriptores de la GDT

	mov edi, gdt
	add edi, 0x20			;se posiciona en la primer entrada de tss de la gdt

	; Tarea 0
	mov eax, tsss
	mov [edi+2], ax			;escribe la base_15:0 para el descriptor 0x20
	shr eax, 16
	mov [edi+4], al			;escribe la base_23:16 para el descriptor 0x20
	mov [edi+7], ah			;escribe la base_31:24 para el descriptor 0x20
	mov eax, tsss

	; Tarea pintor
	add eax, 104
	add edi, 8
	mov [edi+2], ax			;escribe la base_15:0 para el descriptor 0x28
	shr eax, 16
	mov [edi+4], al			;escribe la base_23:16 para el descriptor 0x28
	mov [edi+7], ah			;escribe la base_31:24 para el descriptor 0x28
	mov eax, tsss

	; Tarea traductor
	add eax, 208
	add edi, 8
	mov [edi+2], ax			;escribe la base_15:0 para el descriptor 0x30
	shr eax, 16
	mov [edi+4], al			;escribe la base_23:16 para el descriptor 0x30
	mov [edi+7], ah			;escribe la base_31:24 para el descriptor 0x30

xchg bx,bx
; Cargo el registro de tareas
	mov ax, 0x20		
	ltr ax
xchg bx, bx

; Inicializo el PIC
	mov al, 0x00
	out 0x21, al

xchg bx, bx
; Habilito las interrupciones
	sti
xchg bx, bx
; Paso a la primer tarea
jmp 0x28:0

xchg bx, bx

jmp $
		
