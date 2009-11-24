; Inicializo la TSS de la tarea pintor
	
	mov edi, tsss				;me salteo la primera tss (104 bytes)
	add edi, 104			
	add edi, 28
	mov eax, page_dir_pintor		;CR3
	mov [edi], eax
	add edi, 4
	mov dword [edi], TASK1INIT		;EIP
	add edi, 4
	mov dword [edi], 0x202			;EFLAGS
	add edi, 20
	mov dword [edi], PILATASK1		;ESP
	add edi, 4	
	mov dword [edi], PILATASK1		;EBP
	add edi, 12
	mov word [edi], 0x10			;ES
	add edi, 4			
	mov word [edi], 0x8			;CS
	add edi, 4
	mov word [edi], 0x10			;SS
	add edi, 4
	mov word [edi], 0x10			;DS
	add edi, 4
	mov word [edi], 0x10			;FS
	add edi, 4	
	mov word [edi], 0x10			;GS


; Inicializo la TSS de la tarea traductor
	
	mov edi, tsss				;me salteo las dos primeras tss (208 bytes)
	add edi, 208				
	add edi, 28
	mov eax, page_dir_traductorykernel	;CR3 
	mov [edi], eax
	add edi, 4
	mov dword [edi], TASK2INIT		;EIP
	add edi, 4
	mov dword [edi], 0x202			;EFLAGS
	add edi, 20
	mov dword [edi], PILATASK2		;ESP
	add edi, 4		
	mov dword [edi], PILATASK2		;EBP
	add edi, 12
	mov word [edi], 0x10			;ES
	add edi, 4
	mov word [edi], 0x8			;CS
	add edi, 4
	mov word [edi], 0x10			;SS
	add edi, 4
	mov word [edi], 0x10			;DS
	add edi, 4
	mov word [edi], 0x10			;FS
	add edi, 4
	mov word [edi], 0x10			;GS


; Actualizo los descriptores de la GDT

	mov edi, gdt			;se posiciona en la primer entrada de tss de la gdt
	add edi, 0x20			

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

; Cargo el registro de tareas
	mov ax, 0x20		
	ltr ax

; Inicializo el PIC
	mov al, 0x00
	out 0x21, al


; Habilito las interrupciones
	sti

; Paso a la primer tarea
jmp 0x28:0
