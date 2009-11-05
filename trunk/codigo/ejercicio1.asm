bits 16
		
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
	mov fs, ax
	mov gs, ax
	mov ss, ax
	mov ax, 0x18
	mov es, ax	;A ES LE PONEMOS 0200h porque le estamos indicando donde debe escribir el video,
	
	;aca hacemos el mostrar en pantalla que hicimos la clase anterior
	mov edi, 0
	mov al, '*'
	mov ah, 0xc0
	mov ecx, 80
	cicloFilaArriba:
		mov [es:edi], ax
		add edi, 2
		loop cicloFilaArriba
	
	mov ecx, 23
	cicloBordes:
		mov [es:edi], ax
		add edi, 158
		mov [es:edi], ax
		add edi, 2
		loop cicloBordes
	mov ecx, 80
	cicloFilaAbajo:
		mov [es:edi], ax
		add edi, 2
		loop cicloFilaAbajo
