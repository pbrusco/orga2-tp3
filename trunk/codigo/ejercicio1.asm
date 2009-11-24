; habilito el Gate A20 y checkeo que este habilitado
	call enable_A20
	call check_A20
	
; cargo en el registro LGDT la direccion base de la GDT que armamos en gts.asm
	lgdt[GDT_DESC]			

; seteo el bit PE del registro de control CR0 para luego poder habilitar el modo protegido
	mov eax, cr0			
	or eax, 1
	mov cr0, eax

; habilito modo protegido cargando en CS la posicion dentro de la GDT del descriptor del segmento de codigo
	jmp 0x08:modo_protegido


bits 32		; le indico al compilador que el codigo que prosigue es de 32 bits
modo_protegido:
	
; actualizo los selectores para que apunten al descriptor del segmento de datos en la GDT
	mov ax, 0x10
	mov ds, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

; cargo en ES la posicion dentro de la GDT del descriptor del segmento de video
	mov ax, 0x18
	mov es, ax	
	
; a continuacion cambiamos el color del fondo de la pantalla e imprimimos un marco de '#'
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