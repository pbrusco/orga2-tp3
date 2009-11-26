; Actualizo los descriptores de la GDT que apuntan a una tarea

	mov edi, gdt			; se posiciona en la primer entrada de tss de la gdt
	add edi, 0x20			

	; Tarea 0
	mov eax, tsss
	mov [edi+2], ax			; escribe la base_15:0 para el descriptor 0x20
	shr eax, 16
	mov [edi+4], al			; escribe la base_23:16 para el descriptor 0x20
	mov [edi+7], ah			; escribe la base_31:24 para el descriptor 0x20
	mov eax, tsss

	; Tarea pintor
	add eax, 104
	add edi, 8
	mov [edi+2], ax			; escribe la base_15:0 para el descriptor 0x28
	shr eax, 16
	mov [edi+4], al			; escribe la base_23:16 para el descriptor 0x28
	mov [edi+7], ah			; escribe la base_31:24 para el descriptor 0x28
	mov eax, tsss

	; Tarea traductor
	add eax, 208
	add edi, 8
	mov [edi+2], ax			; escribe la base_15:0 para el descriptor 0x30
	shr eax, 16
	mov [edi+4], al			; escribe la base_23:16 para el descriptor 0x30
	mov [edi+7], ah			; escribe la base_31:24 para el descriptor 0x30

; Cargo el registro de tareas (TR)
	mov ax, 0x20		
	ltr ax


; Habilito las interrupciones
	sti

; Paso a la primer tarea
jmp 0x28:0
